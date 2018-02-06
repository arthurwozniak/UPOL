from enum import Enum
from . import Node
from ASM.ASM import ASM

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
            return self.size.value * 8

    def asm(self):
        from .Program import Program
        from .Number import Number
        from .UnaryExpression import UnaryExpression
        from .Array import Array
        if not(isinstance(self.parent, Program)):
            return ""
        code = ""
        code += "\t{0}:\n".format(self.id.text)
        if self.value is None or self.value == []:
            code += "\t\t.zero {0}\n".format(self.byte_size())
        elif isinstance(self.value, Number):
            code += "\t\t.quad {0}\n".format(self.value.value)
        elif isinstance(self.value, list):
            for val in self.value:
                code += "\t\t.quad {0}\n".format(val.value)
        elif isinstance(self.value, UnaryExpression):
            code += "\t\t.quad {0}\n".format(self.value.expression.text)
        return code


