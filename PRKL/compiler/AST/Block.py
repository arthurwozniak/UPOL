from ASM.ASM import ASM
from ASM.Registers import Registers

from . import Environment
from . import Identifier
from . import Node
from .FunctionCall import FunctionCall
from .Number import Number
from .UnaryExpression import UnaryExpression
from .Variable import Variable, VariableType
from .Program import Program
from .SemanticException import SemanticException


class Block(Node):

    def __init__(self, statements=None, parent=None):
        super(Block, self).__init__(parent)
        self.statements = statements
        self.offset = 0
        self.environment = None
        for i in statements:
            if i is None:
                continue
            i.parent = self
        self.parent = parent
        self.var_c = 0

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        for i in self.statements:
            tmp += "\n" + str(i)
        return tmp

    def _insert_arguments(self, arguments):
        code = ""
        for i, arg in enumerate(arguments):
            arg.parent = self
            self.environment.add(arg.text, 8, VariableType.LONG)
            if i < 6:
                code += ASM.instruction("movq", ASM.UNSAFE_REGISTERS[i], arg.address())
            else:
                code += ASM.instruction("movq", "{0}({1})".format(8 * (len(arguments) - i + 1), Registers.RSP),
                                        Registers.RAX)
                code += ASM.instruction("movq", Registers.RAX, arg.address())

        if len(arguments) != 0:
            code += ASM.instruction("subq", "${0}".format(len(arguments) * 8), Registers.RSP)
        return code

    def _insert_statements(self, arg_c):
        code = ""
        code_var = ""
        declarations = True
        from .BinaryExpression import BinaryExpression
        from .SubscriptExpression import SubscriptExpression

        for i in self.statements:
            i.parent = self
            if isinstance(i, Variable):
                if not declarations:
                    raise SemanticException("Variable `{0}` declaration after beginning of block".format(i.id.text))
                offset = self.environment.add(i.id.text, i.byte_size(), i.type)
                code_var += i.asm(offset)
            else:
                if declarations:
                    # posunutí zásobníku o lokální proměnné
                    if (self.environment.get_sub() - 8 * arg_c) > 0:
                        code += ASM.instruction("subq", "${0}".format(self.environment.get_sub() - 8 * arg_c),
                                                Registers.RSP)
                        code += code_var
                    declarations = False
                code += i.asm()
            code += "\n"
        from .Function import Function
        if isinstance(self.parent, Function) and self.environment.get_sub() != 0:
            code += ASM.instruction("addq", "${0}".format(self.environment.get_sub() - 8 * arg_c), Registers.RSP)
        return code

    def asm(self, arguments=[]):
        code = ""

        offset = 0 if isinstance(self.parent_block, Program) else self.parent_block.environment.offset
        self.environment = Environment.Environment(self, offset)

        code += self._insert_arguments(arguments)

        code += self._insert_statements(len(arguments))

        return code
