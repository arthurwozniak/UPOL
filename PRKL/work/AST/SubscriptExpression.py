from . import Node


class SubscriptExpression(Node):

    def __init__(self, expression=None, parent=None, sub_expr=None):
        super(SubscriptExpression, self).__init__(parent)
        self.expression = expression
        self.expression.parent = self
        self.sub_expr = sub_expr
        self.sub_expr.parent = self

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Expression: "
        tmp += "\n" + str(self.expression)
        tmp += "\n" + self.depth * "\t" + "Inner Expression: "
        tmp += "\n" + str(self.sub_expr)
        return tmp
