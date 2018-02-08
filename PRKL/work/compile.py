#!/usr/bin/env python3

import sys

from HeroCCustomVisitor import HeroCCustomVisitor
from HeroCLexer import HeroCLexer
from HeroCParser import HeroCParser
from ParserErrorListener import ParserErrorListener
from antlr4 import InputStream, CommonTokenStream

from AST.SemanticException import SemanticException


def print_tree():
    stream = InputStream(sys.stdin.read())
    lexer = HeroCLexer(stream)
    parser = HeroCParser(CommonTokenStream(lexer))
    error_listener = ParserErrorListener()
    parser._listeners = [error_listener]
    tree = parser.prog()
    if error_listener.errors:
        for i in error_listener.errors:
            sys.stderr.write(i)
        sys.exit(0)
    tree_visitor = HeroCCustomVisitor()
    ast = tree_visitor.visit(tree)
    asm = ""
    try:
        asm = ast.asm()
    except SemanticException as se:
        sys.stderr.write(se.message + "\n")
    sys.stdout.write(str(asm))

if __name__ == '__main__':
    print_tree()
