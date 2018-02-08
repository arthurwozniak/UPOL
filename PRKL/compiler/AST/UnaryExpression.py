from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers


class UnaryExpression(Node):

    def __init__(self, expression=None, parent=None, operation=None):
        super(UnaryExpression, self).__init__(parent)
        self.expression = expression
        self.expression.parent = self
        self.operation = operation

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Operation: " + str(self.operation)
        tmp += "\n" + self.depth * "\t" + "Expression: "
        tmp += "\n" + str(self.expression)
        return tmp

    def asm(self):
        code = ""
        if self.operation == "&":
            code += ASM.instruction("leaq", self.expression.address(), Registers.RAX)
        elif self.operation == "*":
            # code += ASM.instruction("movq", self.expression.address(), Registers.RBX)
            code += self.expression.asm()
            code += ASM.instruction("movq", Registers.RAX.dereference(), Registers.RAX)
        elif self.operation == "!":
            code += self.expression.asm()
            code += ASM.instruction("cmp", "$0", Registers.RAX)
            code += ASM.instruction("je", "NOT_FALSE_{0}\n".format(self.label_name()))
            code += "NOT_TRUE_{0}:\n".format(self.label_name())
            code += ASM.instruction("movq", "$0", Registers.RAX)
            code += ASM.instruction("jmp", "NOT_END_{0}\n".format(self.label_name()))

            code += "NOT_FALSE_{0}:\n".format(self.label_name())
            code += ASM.instruction("movq", "$1", Registers.RAX)
            code += "NOT_END_{0}:\n".format(self.label_name())

        elif self.operation == "-":
            code += self.expression.asm()
            code += ASM.instruction("negq", Registers.RAX)

        elif self.operation == "~":
            code += self.expression.asm()
            code += ASM.instruction("notq", Registers.RAX)

        elif self.operation == "--":
            code += self.expression.asm()
            code += ASM.instruction("decq", Registers.RAX)
            code += ASM.instruction("movq", Registers.RAX, self.expression.address())

        elif self.operation == "++":
            code += self.expression.asm()
            code += ASM.instruction("incq", Registers.RAX)
            code += ASM.instruction("movq", Registers.RAX, self.expression.address())

        return code

    def address(self):
        return self.asm()
