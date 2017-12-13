from . import Node


class DoWhileExpression(Node):

    def __init__(self, condition=None, parent=None, statement=None):
        super(DoWhileExpression, self).__init__(parent)
        self.condition = condition
        self.condition.parent = self
        self.statement = statement
        self.statement.parent = self

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Condition: "
        tmp += "\n" + str(self.condition)
        tmp += "\n" + self.depth * "\t" + "Statement: "
        tmp += "\n" + str(self.statement)
        return tmp
