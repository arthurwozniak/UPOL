from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers

class Number(Node):

    def __init__(self, value=0, parent=None):
        super(Number, self).__init__(parent)
        self.value = value

    def __str__(self):
        return self.depth * "\t" + self.__class__.__name__ + ": {0}".format(self.value)

    def asm(self):
        return ASM.instruction('movq', "${0}".format(self.value), Registers.RAX.value)
