from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers

class BinaryExpression(Node):

    def __init__(self, left=None, right=None, parent=None, operation=None):
        super(BinaryExpression, self).__init__(parent)
        self.left = left
        self.right = right
        if self.right is not None:
            self.right.parent = self
        if self.left is not None:
            self.left.parent = self
        self.operation = operation

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Operation: " + str(self.operation)
        tmp += "\n" + self.depth * "\t" + "Left: "
        tmp += "\n" + str(self.left)
        tmp += "\n" + self.depth * "\t" + "Right: "
        tmp += "\n" + str(self.right)
        return tmp

    def asm(self):
        code = ""

        left_code = self.left.asm()
        right_code = self.right.asm()

        # backup of used registers
        #code += ASM.instruction("pushq", Registers.RAX)
        #code += ASM.instruction("pushq", Registers.RBX)
        code += left_code
        code += "\n"
        # backup result
        code += ASM.instruction("pushq", Registers.RAX)
        code += right_code
        # result of right part to RBX
        code += ASM.instruction("movq", Registers.RAX, Registers.RCX)
        code += ASM.instruction("popq", Registers.RAX)

        code += self._translate_operation()

        #ASM.instruction("popq", Registers.RBX)
        #ASM.instruction("popq", Registers.RAX)

        return code

    def _translate_operation(self):
        operation = "addq"
        if self.operation == "<<":
            operation = "shld"
        elif self.operation == "|":
            operation = "orq"
        elif self.operation == "+":
            operation = "addq"
        elif self.operation == "-":
            operation = "subq"

        return ASM.instruction(operation, Registers.RCX, Registers.RAX)
