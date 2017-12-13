from enum import Enum
from . import Node


class VariableType(Enum):
    LONG = "LONG"
    POINTER = "POINTER"
    ARRAY = "ARRAY"


class Variable(Node):

    def __init__(self, id, value, typ=VariableType.LONG, size=None, parent=None):
        super(Variable, self).__init__(parent)
        self.id = id
        self.value = value
        self.type = typ
        if self.type == VariableType.ARRAY:
            for i in self.value:
                i.set_parent(self)
        else:
            self.value.set_parent(self)
        self.id.set_parent(self)
        self.size = size

    def __str__(self):
        tmp = self.depth * '\t' + self.__class__.__name__
        tmp += "\n" + str(self.id)
        tmp += "\n" + (1+self.depth) * "\t" + "Type: " + str(self.type)
        if self.type == VariableType.ARRAY:
            for i in self.value:
                tmp += "\n" + str(i)
        else:
            tmp += "\n" + str(self.value)
        return tmp

    def byte_size(self):
        if self.type == VariableType.LONG:
            return 8
        if self.type == VariableType.POINTER:
            return 8
        else:
            return self.size * 8
