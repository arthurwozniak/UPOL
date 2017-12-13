# Generated from HeroC.g4 by ANTLR 4.5.2
from antlr4 import *
import AST
from HeroCParser import HeroCParser
from HeroCLexer import HeroCLexer
import re
from HeroCVisitor import HeroCVisitor
import sys
# This class defines a complete generic visitor for a parse tree produced
# by HeroCParser.

DEBUG = False

def describe(func):
    '''Decorator to print function call details - parameters names and effective values'''
    def wrapper(*func_args, **func_kwargs):
        if not DEBUG:
            return func(*func_args, **func_kwargs)
        print(2 * "\n" + 20 * "=")
        print(func.__name__)
        print(func_args[1].getText())
        print(20 * "-")
        return func(*func_args, **func_kwargs)
    return wrapper


def print_children(ctx):
    for i in ctx.getChildren():
        print(type(i))
        print(i.getText())


class HeroCCustomVisitor(HeroCVisitor):

    # Visit a parse tree produced by HeroCParser#prog.
    @describe
    def visitProg(self, ctx: HeroCParser.ProgContext):
        return AST.Program(self.visit(ctx.getChild(0)))

    # Visit a parse tree produced by HeroCParser#program.
    @describe
    def visitProgram(self, ctx: HeroCParser.ProgramContext):
        items = []
        for i in ctx.getChildren():
#            print(i)
            node = self.visit(i)
            if isinstance(node, list):
                items.extend(self.visit(i))
            else:
                items.append(self.visit(i))
        return items

    # Visit a parse tree produced by HeroCParser#declaration
    # operace přiřazení.
    @describe
    def visitDeclaration(self, ctx: HeroCParser.DeclarationContext):
        # identifikátor nás nezajímá
        return self.visit(ctx.getChild(1))

    # Visit a parse tree produced by HeroCParser#initDeclaratorList.
    @describe
    def visitInitDeclaratorList(self, ctx: HeroCParser.InitDeclaratorListContext):
        lst = []
        while ctx is not None:
            lst.append(self.visit(ctx.initDeclarator()))
            ctx = ctx.initDeclaratorList()
        return lst

    # Visit a parse tree produced by HeroCParser#initDeclarator.
    @describe
    def visitInitDeclarator(self, ctx: HeroCParser.InitDeclaratorContext):
        if isinstance(ctx.getChild(0), HeroCParser.PointerContext):
            pointer = True
            variable = self.visit(ctx.getChild(1))
        else:
            pointer = False
            variable = self.visit(ctx.getChild(0))
        if pointer:
            variable.type = AST.VariableType.POINTER
        return variable

    # Visit a parse tree produced by HeroCParser#initLongDeclarator.
    @describe
    def visitInitLongDeclarator(self, ctx: HeroCParser.InitLongDeclaratorContext):
        id = AST.Identifier(ctx.getChild(0).getText())
        if ctx.getChildCount() == 3:
            value = self.visit(ctx.getChild(2))
        else:
            value = AST.Number()

        return AST.Variable(id=id, value=value)

    # Visit a parse tree produced by HeroCParser#initLongListDeclarator.
    @describe
    def visitInitLongListDeclarator(self, ctx: HeroCParser.InitLongListDeclaratorContext):
        id = AST.Identifier(ctx.getChild(0))
        size_node = ctx.getTypedRuleContext(HeroCParser.ExpressionContext, 0)
        items_node = ctx.getTypedRuleContext(
            HeroCParser.InitializerListContext, 0)

        if items_node:
            items = self.visit(items_node)
        else:
            items = []

        if size_node:
            size = self.visit(size_node)
        else:
            size = AST.Number(len(items))

        return AST.Variable(id=id, value=items, typ=AST.VariableType.ARRAY,
                            size=size)

    # Visit a parse tree produced by HeroCParser#initializer.
    @describe
    def visitInitializer(self, ctx: HeroCParser.InitializerContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by HeroCParser#initializerList.
    @describe
    def visitInitializerList(self, ctx: HeroCParser.InitializerListContext):
        return [self.visit(x) for x in ctx.getTypedRuleContexts(HeroCParser.InitializerContext)]

    # Visit a parse tree produced by HeroCParser#pointer.
    @describe
    def visitPointer(self, ctx: HeroCParser.PointerContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by HeroCParser#functionDefinition.
    @describe
    def visitFunctionDefinition(self, ctx: HeroCParser.FunctionDefinitionContext):
        # nemůžu ošetřit níže, protože nemám pravidlo pro ID
        id = ctx.getChild(0)
        args = []
        for i in ctx.getChildren():
            if isinstance(i, HeroCParser.DeclarationListContext):
                args = self.visit(i)
            elif isinstance(i, HeroCParser.CompoundStatementContext):
                body = self.visit(i)
        function = AST.Function(id=id, body=body, arguments=args)
        return function

    # Visit a parse tree produced by HeroCParser#declarationList.
    @describe
    def visitDeclarationList(self, ctx: HeroCParser.DeclarationListContext):
        declarationList = []
        while ctx is not None:
            declarationList.append(AST.Identifier(ctx.ID().getText()))
            ctx = ctx.getTypedRuleContext(
                HeroCParser.DeclarationListContext, 0)
        return declarationList

    # Visit a parse tree produced by HeroCParser#statement.
    @describe
    def visitStatement(self, ctx: HeroCParser.StatementContext):
        return self.visit(ctx.getChild(0))

    # Visit a parse tree produced by HeroCParser#compoundStatement.
    @describe
    def visitCompoundStatement(self, ctx: HeroCParser.CompoundStatementContext):
        block_body = ctx.getTypedRuleContext(
            HeroCParser.BlockItemListContext, 0)
        block_items = self.visit(block_body)
        block = AST.Block(statements=block_items)

        return block
        # return self.visitChildren(ctx)

    # Visit a parse tree produced by HeroCParser#blockItemList.
    @describe
    def visitBlockItemList(self, ctx: HeroCParser.BlockItemListContext):
        items = []

        while ctx is not None:
            item = self.visit(ctx.blockItem())
            if isinstance(item, list):
                items.extend(item)
            else:
                items.append(item)
            ctx = ctx.getTypedRuleContext(HeroCParser.BlockItemListContext, 0)
        return items

    # Visit a parse tree produced by HeroCParser#blockItem.
    @describe
    def visitBlockItem(self, ctx: HeroCParser.BlockItemContext):
        return self.visit(ctx.getChild(0))

    # Visit a parse tree produced by HeroCParser#expressionStatement.
    @describe
    def visitExpressionStatement(self, ctx: HeroCParser.ExpressionStatementContext):
        return self.visit(ctx.getChild(0))

    # Visit a parse tree produced by HeroCParser#selectionStatement.
    @describe
    def visitSelectionStatement(self, ctx: HeroCParser.SelectionStatementContext):
        cond = self.visit(ctx.getChild(2))
        then = self.visit(ctx.getChild(4))
        els = None
        if ctx.getChildCount() == 7:
            els = self.visit(ctx.getChild(6))
        return AST.IfStatement(cond=cond, then=then, els=els)

    # Visit a parse tree produced by HeroCParser#iterationStatement.
    @describe
    def visitIterationStatement(self, ctx: HeroCParser.IterationStatementContext):
        name = ctx.getChild(0).getText()
        if name == "while":
            condition = self.visit(ctx.getChild(2))
            statement = self.visit(ctx.getChild(4))
            return AST.WhileExpression(condition=condition, statement=statement)
        elif name == "do":
            condition = self.visit(ctx.getChild(4))
            statement = self.visit(ctx.getChild(1))
            return AST.DoWhileExpression(condition=condition, statement=statement)
        elif name == "for":
            expressions = ctx.getTypedRuleContexts(HeroCParser.ExpressionContext)
            pos = 2
            semis = 0
            init = None
            cond = None
            step = None
            while True:
                expr = ctx.getChild(pos)
                pos += 1
                if expr.getText() == ";":
                    semis += 1
                    continue
                elif expr.getText() == ")":
                    break
                else:
                    if semis == 0:
                        init = self.visit(expr)
                    elif semis == 1:
                        cond = self.visit(expr)
                    else:
                        step = self.visit(expr)

            statements = ctx.getTypedRuleContext(HeroCParser.StatementContext, 0)
            statements = self.visit(statements)
            forexpr = AST.ForExpression(init=init, cond=cond, step=step, statements=statements)
            return forexpr
        return self.visitChildren(ctx)

    # Visit a parse tree produced by HeroCParser#jumpStatement.
    @describe
    def visitJumpStatement(self, ctx: HeroCParser.JumpStatementContext):
        jump_type = AST.JumpStatementType(ctx.getChild(0).getText().upper())
        return_val = None
        if (jump_type == AST.JumpStatementType.RETURN) and ctx.getChildCount() == 3:
            return_val = self.visit(ctx.getChild(1))
        return AST.JumpStatement(type_val=jump_type, return_val=return_val)


    # Visit a parse tree produced by HeroCParser#primaryExpression.
    @describe
    def visitPrimaryExpression(self, ctx: HeroCParser.PrimaryExpressionContext):
        token_type = ctx.getChild(0).getSymbol().type
        text = ctx.getText()

        if token_type is HeroCLexer.Constant:
            if self.hex_matcher.match(text):
                return AST.Number(int(text, 16))
            elif self.oct_matcher.match(text):
                return AST.Number(int(text, 8))
            return AST.Number(int(text))

        elif token_type is HeroCLexer.String:
            return AST.String(text.replace("\\t", "\t").replace("\\n", "\n"))
        # jinak je to ID
        elif token_type is HeroCLexer.ID:
            return AST.Identifier(text)
        else:
            return self.visit(ctx.getChild(1))

    # Visit a parse tree produced by HeroCParser#unaryOperator.
    @describe
    def visitUnaryOperator(self, ctx: HeroCParser.UnaryOperatorContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by HeroCParser#unaryExpression.
    @describe
    def visitUnaryExpression(self, ctx: HeroCParser.UnaryExpressionContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.getChild(0))
        elif isinstance(ctx.getChild(0), HeroCParser.UnaryOperatorContext):
            op_symbol = ctx.getChild(0).getText()
            expr = self.visit(ctx.getChild(1))
            return AST.UnaryExpression(expression=expr, operation=op_symbol)
        return AST.Number(value=8)

    # Visit a parse tree produced by HeroCParser#postfixExpression.
    @describe
    def visitPostfixExpression(self, ctx: HeroCParser.PostfixExpressionContext):
        if ctx.getChildCount() == 1:
            return self.visit(ctx.getChild(0))
        elif ctx.getChildCount() == 2:
            # postfix
            op_type = ctx.getChild(1).getText()
            expr = self.visit(ctx.getChild(0))
            return AST.PostfixExpression(operation=op_type, expression=expr)
        elif (isinstance(ctx.getChild(1), HeroCParser.InitializerListContext)):
            return AST.Array(values=self.visit(ctx.getChild(1)))
        elif isinstance(ctx.getChild(2), HeroCParser.ExpressionContext):
            expr = self.visit(ctx.getChild(0))
            sub = self.visit(ctx.getChild(2))
            return AST.SubscriptExpression(expression=expr, sub_expr=sub)
        return self.visitChildren(ctx)

    # Visit a parse tree produced by HeroCParser#argumentExpressionList.
    @describe
    def visitArgumentExpressionList(self, ctx: HeroCParser.ArgumentExpressionListContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by HeroCParser#multiplicativeExpression.
    @describe
    def visitMultiplicativeExpression(self, ctx: HeroCParser.MultiplicativeExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.Star, HeroCLexer.Div, HeroCLexer.Mod]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        add_op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(add_op)
        right.set_parent(add_op)
        return add_op
    # Visit a parse tree produced by HeroCParser#additiveExpression.

    @describe
    def visitAdditiveExpression(self, ctx: HeroCParser.AdditiveExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.Plus, HeroCLexer.Minus]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        add_op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(add_op)
        right.set_parent(add_op)
        return add_op

    # Visit a parse tree produced by HeroCParser#shiftExpression.
    @describe
    def visitShiftExpression(self, ctx: HeroCParser.ShiftExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.LeftShift, HeroCLexer.RightShift]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        shif_op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(shif_op)
        right.set_parent(shif_op)
        return shif_op

    # Visit a parse tree produced by HeroCParser#relationalExpression.
    @describe
    def visitRelationalExpression(self, ctx: HeroCParser.RelationalExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.Less, HeroCLexer.LessEqual,
                                  HeroCLexer.Greater, HeroCLexer.GreaterEqual]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(op)
        right.set_parent(op)
        return op

    # Visit a parse tree produced by HeroCParser#equalityExpression.
    @describe
    def visitEqualityExpression(self, ctx: HeroCParser.EqualityExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.Equal, HeroCLexer.NotEqual]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(op)
        right.set_parent(op)
        return op

    # Visit a parse tree produced by HeroCParser#andExpression.
    @describe
    def visitAndExpression(self, ctx: HeroCParser.AndExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.And]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(op)
        right.set_parent(op)
        return op

    # Visit a parse tree produced by HeroCParser#exclusiveOrExpression.
    @describe
    def visitExclusiveOrExpression(self, ctx: HeroCParser.ExclusiveOrExpressionContext):

        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        help(ctx)

        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.Caret]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(op)
        right.set_parent(op)
        return op

    # Visit a parse tree produced by HeroCParser#inclusiveOrExpression.
    @describe
    def visitInclusiveOrExpression(self, ctx: HeroCParser.InclusiveOrExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.Or]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(op)
        right.set_parent(op)
        return op
    # Visit a parse tree produced by HeroCParser#logicalAndExpression.

    @describe
    def visitLogicalAndExpression(self, ctx: HeroCParser.LogicalAndExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.AndAnd]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(op)
        right.set_parent(op)
        return op

    # Visit a parse tree produced by HeroCParser#logicalOrExpression.
    @describe
    def visitLogicalOrExpression(self, ctx: HeroCParser.LogicalOrExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.getChild(1).getSymbol()
        if operation.type not in [HeroCLexer.OrOr]:
            return self.visitChildren(ctx)
        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        op = AST.BinaryExpression(
            left=left, right=right, operation=operation.text)
        left.set_parent(op)
        right.set_parent(op)
        return op
    # Visit a parse tree produced by HeroCParser#conditionalExpression.

    @describe
    def visitConditionalExpression(self, ctx: HeroCParser.ConditionalExpressionContext):
        if ctx.getChildCount() > 1:
            cond = self.visit(ctx.getChild(0))
            then = self.visit(ctx.getChild(2))
            els = self.visit(ctx.getChild(4))
            return AST.IfEvalStatement(cond=cond, then=then, els=els)
        return self.visit(ctx.getChild(0))

    # Visit a parse tree produced by HeroCParser#assignmentExpression.
    @describe
    def visitAssignmentExpression(self, ctx: HeroCParser.AssignmentExpressionContext):
        if ctx.getChildCount() != 3:
            return self.visitChildren(ctx)
        operation = ctx.assignmentOperator().getText()
        # '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='

        left = self.visit(ctx.getChild(0))
        right = self.visit(ctx.getChild(2))
        op = AST.BinaryExpression(
            left=left, right=right, operation=operation)
        left.set_parent(op)
        right.set_parent(op)
        return op

    # Visit a parse tree produced by HeroCParser#assignmentOperator.
    @describe
    def visitAssignmentOperator(self, ctx: HeroCParser.AssignmentOperatorContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by HeroCParser#functionCallExpression.
    @describe
    def visitFunctionCallExpression(self, ctx: HeroCParser.FunctionCallExpressionContext):
        parameters = ctx.functionParameterList()
        if parameters is not None:
            parameters = self.visit(parameters)
        elif len(ctx.getChild(2).getText()) == 3:
            parameters = [AST.Number(value=ord(ctx.getChild(2).getText()[1]))]
        name = ctx.getChild(0).getSymbol().text
        fcall = AST.FunctionCall(function=name, arguments=parameters)
        return fcall

    # Visit a parse tree produced by HeroCParser#functionParameterList.
    @describe
    def visitFunctionParameterList(self, ctx: HeroCParser.FunctionParameterListContext):
        result = []
        while ctx is not None:
            item = self.visit(ctx.expression())
            result.append(item)
            ctx = ctx.functionParameterList()
        return result

    # Visit a parse tree produced by HeroCParser#expression.
    @describe
    def visitExpression(self, ctx: HeroCParser.ExpressionContext):
        return self.visit(ctx.getChild(0))

    def __init__(self):
        super(HeroCCustomVisitor, self).__init__()
        self.hex_matcher = re.compile('^0[xX]([a-fA-F]|[0-9])+$')
        self.oct_matcher = re.compile('^0[0-7]+$')
