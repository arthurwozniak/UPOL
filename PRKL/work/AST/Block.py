from . import Node
from . import Enviroment
from .Variable import Variable
from .Number import Number
from .UnaryExpression import UnaryExpression
from ASM.ASM import ASM
from ASM.Registers import Registers
from . import Identifier
class Block(Node):

    def __init__(self, statements=None, parent=None):
        super(Block, self).__init__(parent)
        self.statements = statements
        self.offset = 0
        self.enviroment = None
        for i in statements:
            i.parent = self
        self.parent = parent

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        for i in self.statements:
            tmp += "\n" + str(i)
        return tmp

    def asm(self, arguments=[]):
        code = ""

        offset = 0 if self.parent_block is None else self.parent_block.enviroment.offset
        self.enviroment = Enviroment.Enviroment(self, offset)

        for i, arg in enumerate(arguments):
            arg.parent = self.enviroment
            self.enviroment.add(arg.text, 8)
            if i < 6:
                code += ASM.instruction("movq", ASM.UNSAFE_REGISTERS[i], arg.address())
            else:
                code += ASM.instruction("movq", "{0}({1})".format(8*(len(arguments) - i + 1), Registers.RSP), Registers.RAX)
                code += ASM.instruction("movq", Registers.RAX, arg.address())

        declarations = True

        for i in self.statements:
            if not isinstance(i, Variable):
                declarations = False
            elif declarations is False and isinstance(i, Variable):
                raise Exception("Variable declaration after")
            elif isinstance(i, Variable):
                self.enviroment.add(i.id.text, i.byte_size())
        # posunutí zásobníku o lokální proměnné
        code += ASM.instruction("subq", "${0}".format(self.enviroment.offset), Registers.RSP)

        for i in self.statements:
            if isinstance(i, Variable):
                offset = self.enviroment[i.id.text]
                if isinstance(i.value, Number):
                    code += ASM.instruction("movq", "${0}".format(i.value.value), "-{1}({0})".format(Registers.RBP, offset))
                elif isinstance(i.value, Identifier) or isinstance(i.value, UnaryExpression):
                    #assigned_var_offset = self.enviroment[i.value.text]
                    #self.enviroment.get()
                    code += i.value.asm()
                    code += ASM.instruction("movq", "{0}".format(Registers.RAX), "-{1}({0})".format(Registers.RBP, offset))
                else:
                    code += ASM.instruction("movq", "$FF{0}".format(i.value.text), "-{1}({0})".format(Registers.RBP, offset))
            else:
                code += i.asm()
            code += "\n"

        return code

    @property
    def parent_block(self):
        from .Function import Function
        from .Program import Program
        if self.parent is None:
            return None
        if isinstance(self.parent, Program):
            return None
        if isinstance(self.parent, Function):
            return self.parent.parent
        p = self.parent
        while not(isinstance(p, Block)):

            p = p.parent
        return p