from . import Node
from enum import Enum


class JumpStatementType(Enum):
    RETURN = "RETURN"
    BREAK = "BREAK"
    CONTINUE = "CONTINUE"


class JumpStatement(Node):

    def __init__(self, parent=None, type_val=None, return_val=None):
        super(JumpStatement, self).__init__(parent)
        self.type_val = type_val
        self.return_val = return_val
        if self.return_val is not None:
            self.return_val.parent = self

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Type: " + str(self.type_val)
        if self.return_val is not None:
            tmp += "\n" + self.depth * "\t" + "Return value: "
            tmp += "\n" + str(self.return_val)
        return tmp
