from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers
from .SemanticException import SemanticException

class PostfixExpression(Node):

    def __init__(self, expression=None, parent=None, operation=None):
        super(PostfixExpression, self).__init__(parent)
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
        code += self.expression.asm()
        #code += self._translate_operation()
        code += ASM.instruction("pushq", Registers.RAX)
        # perform postfix operation on variable
        code += ASM.instruction(self._translate_operation(), Registers.RAX)
        code += ASM.instruction("movq", Registers.RAX, self.expression.address())
        # pop stacked value
        code += ASM.instruction("popq", Registers.RAX)
        #code += ASM.instruction(self._translate_operation(), self.expression.address())

        return code

    def _translate_operation(self):
        if self.operation == "++":
            return "incq"
        elif self.operation == "--":
            return "decq"
        raise SemanticException("Unsupported postfix operation `{0}`".format(self.operation))
