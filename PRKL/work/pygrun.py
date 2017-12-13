#!/bin/env python
import optparse
import os
import sys
import re

# for GUI
from PyQt4.QtCore import *
from PyQt4.QtGui import *

# put antlr4 runtime at the same directory and uncomment these line.
# tied run-time with antlr generate file to avoid unexpected error due to version change.
# antlr_runtime_path = os.path.realpath(os.path.join(os.path.dirname(__file__), '.'))
# sys.path.insert(0, antlr_runtime_path)
from antlr4 import *


# this is a python version of TestRig
def beautify_lisp_string(in_string):
    indent_size = 3
    add_indent = ' ' * indent_size
    out_string = in_string[0]  # no indent for 1st (
    indent = ''
    for i in range(1, len(in_string)):
        if in_string[i] == '(' and in_string[i + 1] != ' ':
            indent += add_indent
            out_string += "\n" + indent + '('
        elif in_string[i] == ')':
            out_string += ')'
            if len(indent) > 0:
                indent = indent.replace(add_indent, '', 1)
        else:
            out_string += in_string[i]
    return out_string


class AntlrParserTreeViewer(QDialog):
    def __init__(self, parent=None):
        super(AntlrParserTreeViewer, self).__init__(parent)
        self.re_context = re.compile(r'([\w\d_]+)Context\'\>')

        self.tree = QTreeWidget()
        self.tree.setColumnCount(4)
        self.tree.setColumnWidth(0, 350)
        self.tree.setColumnWidth(1, 400)
        self.tree.setColumnWidth(2, 200)
        self.tree.setColumnWidth(3, 200)
        self.tree.setHeaderLabels(['name', 'Text', 'start', 'stop'])

        self.layout = QVBoxLayout()
        self.layout.addWidget(self.tree)
        self.setLayout(self.layout)

        self.setWindowTitle('AST Tree')
        self.resize(1200, 800)

    def set_data(self, py_obj):
        self.tree.clear()
        self.add_sub_tree(py_obj, self.tree)

    def add_sub_tree(self, node, parent):
        widget_item = QTreeWidgetItem(parent)
        if isinstance(node, ParserRuleContext):
            class_name = str(type(node))
            # print(class_name)
            m = self.re_context.search(class_name)
            short_name = m.group(1)
            widget_item.setText(0, short_name)
            widget_item.setText(1, '')
            widget_item.setText(2, str(node.start))
            widget_item.setText(3, str(node.stop))
        else:
            widget_item.setText(0, '')
            widget_item.setText(1, node.getText())
            widget_item.setText(2, '')
            widget_item.setText(3, '')

        if hasattr(node, 'children'):
            for child in getattr(node, 'children'):
                self.add_sub_tree(child, widget_item)


if __name__ == '__main__':

    #############################################################
    # parse options
    # not support -gui -encoding -ps
    #############################################################
    usage = "Usage: %prog [options] Grammar_Name Start_Rule"
    parser = optparse.OptionParser(usage=usage)
    # parser.add_option('-t', '--tree',
    #                   dest="out_file",
    #                   default="default.out",
    #                   help='set output file name',
    #                   )
    parser.add_option('-t', '--tree',
                      dest="tree",
                      default=False,
                      action='store_true',
                      help='Print AST tree'
                      )
    parser.add_option('-g', '--gui',
                      dest="gui",
                      default=False,
                      action='store_true',
                      help='show AST tree in GUI'
                      )
    parser.add_option('-k', '--tokens',
                      dest="token",
                      default=False,
                      action='store_true',
                      help='Show Tokens'
                      )
    parser.add_option('-s', '--sll',
                      dest="sll",
                      default=False,
                      action='store_true',
                      help='Show SLL'
                      )
    parser.add_option('-d', '--diagnostics',
                      dest="diagnostics",
                      default=False,
                      action='store_true',
                      help='Enable diagnostics error listener'
                      )
    parser.add_option('-a', '--trace',
                      dest="trace",
                      default=False,
                      action='store_true',
                      help='Enable Trace'
                      )
    parser.add_option('-p', '--path',
                      dest="search_path",
                      action='append',
                      help='seach path for Lexer/Parser files'
                      )

    options, remainder = parser.parse_args()

    if len(remainder) < 2:
        print('ERROR: You have to provide at least 2 arguments!')
        parser.print_help()
        exit(1)
    else:
        grammar = remainder.pop(0)
        start_rule = remainder.pop(0)
        file_list = remainder

    #############################################################
    # check and load antlr generated files
    #############################################################
    # searching for file
    search_path = ['.']
    found = False
    found_path = ''
    if options.search_path is not None:
        search_path += options.search_path
    for p in search_path:
        lexer_file = os.path.join(p, grammar + 'Lexer.py')
        parser_file = os.path.join(p, grammar + 'Parser.py')
        if os.path.exists(lexer_file) and os.path.exists(parser_file):
            found = True
            found_path = p
            break
    if not found:
        print("[ERROR] Can't find lexer file {} or parser file {}!".format(grammar + 'Lexer.py', grammar + 'Parser.py'))
        print("search path : ", search_path)
        exit(1)

    # dynamic load the module and class
    lexerName = grammar + 'Lexer'
    parserName = grammar + 'Parser'
    sys.path.append(found_path)

    # print("Load Lexer {}".format(lexerName))
    module_lexer = __import__(lexerName, globals(), locals(), lexerName)
    class_lexer = getattr(module_lexer, lexerName)

    # print("Load Parser {}".format(parserName))
    module_parser = __import__(parserName, globals(), locals(), parserName)
    class_parser = getattr(module_parser, parserName)


    #############################################################
    # main process steps.
    #############################################################
    def process(input_stream, class_lexer, class_parser):
        lexer = class_lexer(input_stream)
        token_stream = CommonTokenStream(lexer)
        token_stream.fill()
        if options.token:  # need to show token
            for tok in token_stream.tokens:
                print(tok)
        if start_rule == 'tokens':
            return

        parser = class_parser(token_stream)

        if options.diagnostics:
            parser.addErrorListener(DiagnosticErrorListener())
            parser._interp.predictionMode = PredictionMode.LL_EXACT_AMBIG_DETECTION
        if options.tree or options.gui:
            parser.buildParseTrees = True
        if options.sll:
            parser._interp.predictionMode = PredictionMode.SLL
        # parser.setTokenStream(token_stream)
        parser.setTrace(options.trace)
        if hasattr(parser, start_rule):
            func_start_rule = getattr(parser, start_rule)
            parser_ret = func_start_rule()
            if options.tree:
                if options.gui:
                    app = QApplication(sys.argv)
                    viewer = AntlrParserTreeViewer()
                    viewer.set_data(parser_ret)
                    viewer.show()
                    ret = app.exec_()
                    sys.exit(ret)
                else:
                    lisp_tree_str = parser_ret.toStringTree(recog=parser)
                    print(beautify_lisp_string(lisp_tree_str))
        else:
            print("[ERROR] Can't find start rule '{}' in parser '{}'".format(start_rule, parserName))


    #############################################################
    # use stdin if not provide file as input stream
    #############################################################
    if len(file_list) == 0:
        input_stream = InputStream(sys.stdin.read())
        process(input_stream, class_lexer, class_parser)
        exit(0)

    #############################################################
    # iterate all input file
    #############################################################
    for file_name in file_list:
        if os.path.exists(file_name) and os.path.isfile(file_name):
            input_stream = FileStream(file_name)
            process(input_stream, class_lexer, class_parser)
        else:
            print("[ERROR] file {} not exist".format(os.path.normpath(file_name)))
