from . import Node
from .Variable import VariableType
from ASM.ASM import ASM
from ASM.Registers import Registers

import re

class String(Node):

    def __init__(self, text, parent=None):
        super(String, self).__init__(parent)
        self.text = text[1:-1]

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__ + ": " + str(self.text)

        return tmp


    def asm(self):
        environment = self.parent_block.environment
        offset = environment.add(self.label_name(), len(self.text), VariableType.ARRAY)
        offset_tmp = offset

        code = ""

        for i in self.text:
            code += ASM.instruction("movq", "${0}".format(ord(i)), "-{1}({0})".format(Registers.RBP, offset_tmp * 8))
            offset_tmp -= 1
        code += ASM.instruction("subq", "${0}".format(8*offset), Registers.RSP)
        code += ASM.instruction("leaq", "-{1}({0})".format(Registers.RBP, offset*8), Registers.RAX)
        return code