from . import Node
from . import Enviroment
from .Variable import Variable
from .Number import Number
from ASM.ASM import ASM
from ASM.Registers import Registers


class Block(Node):

    def __init__(self, statements=None, parent=None):
        super(Block, self).__init__(parent)
        self.statements = statements
        for i in statements:
            i.parent = self
        self.parent = parent

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        for i in self.statements:
            tmp += "\n" + str(i)
        return tmp

    def asm(self):
        code = ""

        self.enviroment = Enviroment.Enviroment(self)
        declarations = True

        for i in self.statements:
            if not isinstance(i, Variable):
                declarations = False
            elif declarations is False and isinstance(i, Variable):
                raise Exception("Variable declaration after")
            elif isinstance(i, Variable):
                self.enviroment.add(i.id.text, i.byte_size())
        # posunutí zásobníku o lokální proměnné
        code += ASM.instruction("subq", "${0}".format(self.enviroment.offset), Registers.RBP)

        for i in self.statements:
            if isinstance(i, Variable):
                offset = self.enviroment[i.id.text]
                if isinstance(i.value, Number):
                    code += ASM.instruction("movq", "${0}".format(i.value.value), "-{1}({0})".format(Registers.RBP, offset))
                else:
                    code += ASM.instruction("movq", "${0}".format(i.value.text), "-{1}({0})".format(Registers.RBP, offset))
            else:
                code += i.asm()
            code += "\n"

        return code
