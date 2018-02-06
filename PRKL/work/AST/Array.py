from . import Node
from .Variable import VariableType
from ASM.ASM import ASM
from ASM.Registers import Registers


class Array(Node):

    def __init__(self, values=None, size=None, parent=None):
        super(Array, self).__init__(parent)
        self.values = values
        self.size = size
        if self.size is None:
            self.size = 0 if self.values is None else len(self.values)

    def __str__(self):
        tmp = self.depth * '\t' + self.__class__.__name__
        tmp += "\n" + (1+self.depth) * "\t" + "Size: " + str(self.size)
        for i in self.values:
            tmp += "\n" + (1+self.depth)*'\t' + str(i)
        return tmp

    def asm(self):
        environment = self.parent_block.environment
        offset = environment.add(self.label_name(), len(self.values), VariableType.ARRAY)
        offset_tmp = offset

        code = ""

        for i in self.values:
            code += ASM.instruction("movq", "${0}".format(i.value), "-{1}({0})".format(Registers.RBP, offset_tmp * 8))
            offset_tmp -= 1
        code += ASM.instruction("subq", "${0}".format(8*offset), Registers.RSP)
        code += ASM.instruction("leaq", "-{1}({0})".format(Registers.RBP, offset*8), Registers.RAX)
        return code