#!/usr/bin/env python3

import sys

from HeroCCustomVisitor import HeroCCustomVisitor
from HeroCLexer import HeroCLexer
from HeroCParser import HeroCParser
from ParserErrorListener import ParserErrorListener
from antlr4 import InputStream, CommonTokenStream


def printTree():
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
    treeVisitor = HeroCCustomVisitor()
    AST = treeVisitor.visit(tree)
    sys.stdout.write(str(AST))

if __name__ == '__main__':
    printTree()
