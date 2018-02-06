from ASM.ASM import ASM
from ASM.Registers import Registers

from . import Node


class SubscriptExpression(Node):

    def __init__(self, expression=None, parent=None, sub_expr=None):
        super(SubscriptExpression, self).__init__(parent)
        self.expression = expression
        self.expression.parent = self
        self.sub_expr = sub_expr
        self.sub_expr.parent = self

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Expression: "
        tmp += "\n" + str(self.expression)
        tmp += "\n" + self.depth * "\t" + "Inner Expression: "
        tmp += "\n" + str(self.sub_expr)
        return tmp

    def asm2(self):
        code = ""
        # offset to stack
        code += self.sub_expr.asm()
        code += ASM.instruction("imulq", "$8", Registers.RAX)
        code += ASM.instruction("pushq", Registers.RAX)
        # get identifier address
        code += self.expression.asm()
        code += ASM.instruction("movq", Registers.RAX, Registers.RBX)
        code += ASM.instruction("popq", Registers.RAX)
        # add address and fetch value
        code += ASM.instruction("addq", Registers.RAX, Registers.RBX)
        code += ASM.instruction("movq", Registers.RBX.dereference(), Registers.RAX)

        return code

    def asm(self):
        code = ""
        # get identifier address and save to stack
        code += self.expression.asm()
        code += ASM.instruction("pushq", Registers.RAX)
        # offset to RBX
        code += self.sub_expr.asm()
        code += ASM.instruction("imulq", "$8", Registers.RAX)
        code += ASM.instruction("movq", Registers.RAX, Registers.RBX)

        # add address and fetch value
        code += ASM.instruction("popq", Registers.RAX)
        code += ASM.instruction("addq", Registers.RAX, Registers.RBX)
        code += ASM.instruction("movq", Registers.RBX.dereference(), Registers.RAX)

        return code
