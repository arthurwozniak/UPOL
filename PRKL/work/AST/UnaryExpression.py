from . import Node


class UnaryExpression(Node):

    def __init__(self, expression=None, parent=None, operation=None):
        super(UnaryExpression, self).__init__(parent)
        self.expression = expression
        self.expression.parent = self
        self.operation = operation

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Operation: " + str(self.operation)
        tmp += "\n" + self.depth * "\t" + "Expression: "
        tmp += "\n" + str(self.expression)
        return tmp
