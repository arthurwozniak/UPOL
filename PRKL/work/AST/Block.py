from . import Node
from . import Environment
from .Variable import Variable, VariableType
from .Number import Number
from .UnaryExpression import UnaryExpression
from .Function import Function
from ASM.ASM import ASM
from ASM.Registers import Registers
from . import Identifier
class Block(Node):

    def __init__(self, statements=None, parent=None):
        super(Block, self).__init__(parent)
        self.statements = statements
        self.offset = 0
        self.environment = None
        for i in statements:
            i.parent = self
        self.parent = parent

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        for i in self.statements:
            tmp += "\n" + str(i)
        return tmp

    def _insert_arguments(self, arguments):
        code = ""
        for i, arg in enumerate(arguments):
            arg.parent = self
            self.environment.add(arg.text, 8)
            if i < 6:
                code += ASM.instruction("movq", ASM.UNSAFE_REGISTERS[i], arg.address())
            else:
                code += ASM.instruction("movq", "{0}({1})".format(8*(len(arguments) - i + 1), Registers.RSP), Registers.RAX)
                code += ASM.instruction("movq", Registers.RAX, arg.address())
        return code

    def _insert_statements(self, statements):
        code = ""
        declarations = True
        for i in self.statements:
            i.parent = self
            if isinstance(i, Variable):
                if not declarations:
                    raise Exception("Variable declaration after beginning of block")
                offset = self.environment.add(i.id.text, i.byte_size())

                if isinstance(i.value, Number):
                    code += ASM.instruction("movq", "${0}".format(i.value.value), "-{1}({0})".format(Registers.RBP, offset))
                elif isinstance(i.value, Identifier) or isinstance(i.value, UnaryExpression):
                    #assigned_var_offset = self.environment[i.value.text]
                    #self.environment.get()
                    code += i.value.asm()
                    code += ASM.instruction("movq", "{0}".format(Registers.RAX), "-{1}({0})".format(Registers.RBP, offset))
                elif i.type == VariableType.ARRAY:

                    # uninitialized array, fill with 0
                    if len(i.value) == 0:
                        for pos in reversed(range(i.size.value)):
                            code += ASM.instruction("movq", "$0", "-{1}({0})".format(Registers.RBP, offset - 8 * pos - 8))
                    # declaration with list of values
                    elif i.size.value == len(i.value):
                        for pos, elem in reversed(list(enumerate(i.value))):
                            code += ASM.instruction("movq", "${0}".format(elem.value), "-{1}({0})".format(Registers.RBP, offset - 8 * pos - 8))
                    # size mismatch
                    else:
                        raise Exception("Error: Invalid count of array elements")
                    # pointer to first element
                    code += ASM.instruction("movq", "$-{0}".format(offset), Registers.RAX)
                    code += ASM.instruction("addq", "$8", Registers.RAX)
                    code += ASM.instruction("addq", Registers.RBP, Registers.RAX)
                    code += ASM.instruction("movq", Registers.RAX,
                                            "-{1}({0})".format(Registers.RBP, offset))
            else:
                if declarations:
                    # posunutí zásobníku o lokální proměnné
                    code += ASM.instruction("subq", "${0}".format(self.environment.offset), Registers.RSP)
                    declarations = False
                code += i.asm()
            code += "\n"
        return code

    def asm(self, arguments=[]):
        code = ""

        offset = 0 if isinstance(self.parent_block, Function) else self.parent_block.environment.offset

        self.environment = Environment.Environment(self, offset)

        code += self._insert_arguments(arguments)

        code += self._insert_statements(self.statements)

        return code

