#!/usr/bin/env python3

import sys
from antlr4 import InputStream, CommonTokenStream
from HeroCLexer import HeroCLexer
from HeroCParser import HeroCParser
from HeroCCustomVisitor import HeroCCustomVisitor


def printTree():
    stream = InputStream(sys.stdin.read())
    lexer = HeroCLexer(stream)
    parser = HeroCParser(CommonTokenStream(lexer))
    tree = parser.prog()
    treeVisitor = HeroCCustomVisitor()
    AST = treeVisitor.visit(tree)
    sys.stdout.write(str(AST))
    #print(tree.children)
    #print(AST)
    #print(AST.__class__())
    #sys.stdout.write(str(AST.asm()))

if __name__ == '__main__':
    printTree()
