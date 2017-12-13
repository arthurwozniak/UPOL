from . import Node
from .Function import Function
from .Block import Block
from ASM.ASM import ASM
from ASM.Registers import Registers


class Identifier(Node):

    def __init__(self, text, parent=None):
        super(Identifier, self).__init__(parent)
        self.text = text

    def __str__(self):
        return self.depth * "\t" + self.__class__.__name__ + ": " + str(self.text)

    def get_offset(self):
        parent = self.parent

        while True:
            if isinstance(parent, Function):
                break
            if isinstance(parent, Block):
                enviroment = parent.enviroment
                if self.text in enviroment.keys():
                    return enviroment[self.text]
            parent = parent.parent

    def asm(self):
        code = ""
        offset = self.get_offset()
        code += ASM.instruction("movq", "-{0}({1})".format(offset, Registers.RBP), Registers.RAX)
        return code
