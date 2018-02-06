# Generated from /home/kamil/git/UPOL/PRKL/work/HeroC.g4 by ANTLR 4.7
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .HeroCParser import HeroCParser
else:
    from HeroCParser import HeroCParser

# This class defines a complete generic visitor for a parse tree produced by HeroCParser.

class HeroCVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by HeroCParser#prog.
    def visitProg(self, ctx:HeroCParser.ProgContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#program.
    def visitProgram(self, ctx:HeroCParser.ProgramContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#declaration.
    def visitDeclaration(self, ctx:HeroCParser.DeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#initDeclaratorList.
    def visitInitDeclaratorList(self, ctx:HeroCParser.InitDeclaratorListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#initDeclarator.
    def visitInitDeclarator(self, ctx:HeroCParser.InitDeclaratorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#initLongDeclarator.
    def visitInitLongDeclarator(self, ctx:HeroCParser.InitLongDeclaratorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#initLongListDeclarator.
    def visitInitLongListDeclarator(self, ctx:HeroCParser.InitLongListDeclaratorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#initializer.
    def visitInitializer(self, ctx:HeroCParser.InitializerContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#initializerList.
    def visitInitializerList(self, ctx:HeroCParser.InitializerListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#pointer.
    def visitPointer(self, ctx:HeroCParser.PointerContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#functionDefinition.
    def visitFunctionDefinition(self, ctx:HeroCParser.FunctionDefinitionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#declarationList.
    def visitDeclarationList(self, ctx:HeroCParser.DeclarationListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#statement.
    def visitStatement(self, ctx:HeroCParser.StatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#compoundStatement.
    def visitCompoundStatement(self, ctx:HeroCParser.CompoundStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#blockItemList.
    def visitBlockItemList(self, ctx:HeroCParser.BlockItemListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#blockItem.
    def visitBlockItem(self, ctx:HeroCParser.BlockItemContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#expressionStatement.
    def visitExpressionStatement(self, ctx:HeroCParser.ExpressionStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#selectionStatement.
    def visitSelectionStatement(self, ctx:HeroCParser.SelectionStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#iterationStatement.
    def visitIterationStatement(self, ctx:HeroCParser.IterationStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#jumpStatement.
    def visitJumpStatement(self, ctx:HeroCParser.JumpStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#primaryExpression.
    def visitPrimaryExpression(self, ctx:HeroCParser.PrimaryExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#unaryOperator.
    def visitUnaryOperator(self, ctx:HeroCParser.UnaryOperatorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#unaryExpression.
    def visitUnaryExpression(self, ctx:HeroCParser.UnaryExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#postfixExpression.
    def visitPostfixExpression(self, ctx:HeroCParser.PostfixExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#argumentExpressionList.
    def visitArgumentExpressionList(self, ctx:HeroCParser.ArgumentExpressionListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#multiplicativeExpression.
    def visitMultiplicativeExpression(self, ctx:HeroCParser.MultiplicativeExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#additiveExpression.
    def visitAdditiveExpression(self, ctx:HeroCParser.AdditiveExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#shiftExpression.
    def visitShiftExpression(self, ctx:HeroCParser.ShiftExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#relationalExpression.
    def visitRelationalExpression(self, ctx:HeroCParser.RelationalExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#equalityExpression.
    def visitEqualityExpression(self, ctx:HeroCParser.EqualityExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#andExpression.
    def visitAndExpression(self, ctx:HeroCParser.AndExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#exclusiveOrExpression.
    def visitExclusiveOrExpression(self, ctx:HeroCParser.ExclusiveOrExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#inclusiveOrExpression.
    def visitInclusiveOrExpression(self, ctx:HeroCParser.InclusiveOrExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#logicalAndExpression.
    def visitLogicalAndExpression(self, ctx:HeroCParser.LogicalAndExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#logicalOrExpression.
    def visitLogicalOrExpression(self, ctx:HeroCParser.LogicalOrExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#conditionalExpression.
    def visitConditionalExpression(self, ctx:HeroCParser.ConditionalExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#assignmentExpression.
    def visitAssignmentExpression(self, ctx:HeroCParser.AssignmentExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#assignmentOperator.
    def visitAssignmentOperator(self, ctx:HeroCParser.AssignmentOperatorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#functionCallExpression.
    def visitFunctionCallExpression(self, ctx:HeroCParser.FunctionCallExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#functionParameterList.
    def visitFunctionParameterList(self, ctx:HeroCParser.FunctionParameterListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by HeroCParser#expression.
    def visitExpression(self, ctx:HeroCParser.ExpressionContext):
        return self.visitChildren(ctx)



del HeroCParser