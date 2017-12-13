from . import Node
from .Variable import VariableType, Variable
from .Identifier import Identifier
from ASM.ASM import ASM
from ASM.Registers import Registers


class FunctionCall(Node):

    def __init__(self, parent=None, arguments=None, function=None):
        super(FunctionCall, self).__init__(parent)
        self.arguments = arguments
        if self.arguments is not None:
            for i in self.arguments:
                i.set_parent(self)
        self.function = function

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__ + " " + str(self.function)
        if self.arguments is not None:
            tmp += '\n' + self.depth * '\t' + "Arguments: "
            for i in self.arguments:
                tmp += '\n' + str(i)
        return tmp

    def asm(self):
        code = ""
        # uložení registrů
        for register in ASM.UNSAFE_REGISTERS:
            break
            code += ASM.instruction("pushq", register)

        # předání parametrů
        if self.arguments is not None:
            for i, argument in enumerate(self.arguments):
                code += argument.asm()

                if i <= 6:
                    code += ASM.instruction("movq", Registers.RAX, ASM.UNSAFE_REGISTERS[i])
                else:
                    code += ASM.instruction("pushq", Registers.RAX)

        code += ASM.instruction("call", self.function)


        # obnovení registrů
        for register in reversed(ASM.UNSAFE_REGISTERS):
            break
            code += ASM.instruction("popq", register)
        return code
