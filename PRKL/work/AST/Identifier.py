from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers
from .Variable import VariableType

class Identifier(Node):
    _address = None
    _type = None
    def __init__(self, text, parent=None):
        super(Identifier, self).__init__(parent)
        self.text = text

    def __str__(self):
        return self.depth * "\t" + self.__class__.__name__ + ": " + str(self.text)

    def address(self):
        if self._address is not None:
            return self._address

        from .Block import Block
        from .Program import Program
        parent = self.parent_block

        while True:
            if parent is None:
                raise Exception("Variable `{0}` not found".format(self.text))

            environment = parent.environment

            if self.text in environment.keys():
                if isinstance(parent, Block):
                    self._address = "-{0}({1})".format(environment.get_offset(self.text), Registers.RBP)
                else:
                    self._address =  "{0}".format(self.text)
                self._type = environment.get_type(self.text)
                return self._address

            if isinstance(parent, Program) and self.text in parent.functions:
                self._address = "{0}".format(self.text)
                return self._address

            parent = parent.parent_block



    def asm(self):
        code = ""
        address = self.address()
        if self._type == VariableType.ARRAY:
            code += ASM.instruction("leaq", address, Registers.RAX)
        else:
            code += ASM.instruction("movq", address, Registers.RAX)
        return code

