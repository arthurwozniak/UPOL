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
                code += ASM.instruction("movq", "{0}({1})".format(8*(len(arguments) - i + 1), Registers.RSP), Registers.RAX)
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
                    raise Exception("Variable declaration after beginning of block")
                offset = self.environment.add(i.id.text, i.byte_size(), i.type)

                if isinstance(i.value, Number):
                    code_var += ASM.instruction("movq", "${0}".format(i.value.value), "-{1}({0})".format(Registers.RBP, offset))
                elif isinstance(i.value, Identifier) or isinstance(i.value, UnaryExpression) or isinstance(i.value, FunctionCall):
                    #assigned_var_offset = self.environment[i.value.text]
                    #self.environment.get()
                    code_var += i.value.asm()
                    code_var += ASM.instruction("movq", "{0}".format(Registers.RAX), "-{1}({0})".format(Registers.RBP, offset))
                elif isinstance(i.value, BinaryExpression) or isinstance(i.value, SubscriptExpression):
                    code_var += i.value.asm()
                    code_var += ASM.instruction("movq", "{0}".format(Registers.RAX), "-{1}({0})".format(Registers.RBP, offset))
                elif i.type == VariableType.ARRAY:

                    # uninitialized array, fill with 0
                    if len(i.value) == 0:
                        for pos in reversed(range(i.size.value)):
                            code_var += ASM.instruction("movq", "$0", "-{1}({0})".format(Registers.RBP, offset - 8 * pos))
                    # declaration with list of values
                    elif i.size.value == len(i.value):

                        for pos, elem in reversed(list(enumerate(i.value))):
                            if isinstance(elem, Number):
                                code_var += ASM.instruction("movq", "${0}".format(elem.value), "-{1}({0})".format(Registers.RBP, offset - 8 * pos))
                            else:
                                code_var += elem.asm()
                                code_var += ASM.instruction("movq", Registers.RAX, "-{1}({0})".format(Registers.RBP, offset - 8 * pos))
                    # size mismatch
                    else:
                        raise Exception("Error: Invalid count of array elements")
                    # pointer to first element
                    # code += ASM.instruction("movq", "$-{0}".format(offset), Registers.RAX)
                    # code += ASM.instruction("addq", "$8", Registers.RAX)
                    # code += ASM.instruction("addq", Registers.RBP, Registers.RAX)
                    # code += ASM.instruction("movq", Registers.RAX,
                    #                         "-{1}({0})".format(Registers.RBP, offset))
            else:
                if declarations:
                    # posunutí zásobníku o lokální proměnné
                    if (self.environment.get_sub() - 8 * arg_c) > 0:
                        code += ASM.instruction("subq", "${0}".format(self.environment.get_sub() - 8 * arg_c), Registers.RSP)
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

