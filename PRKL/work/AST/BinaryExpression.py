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

        # assign operation is handled different way
        if self.operation == "=":
            return self._assign_operation()

        if self.operation == "^=":
            return self._assign_special_operation("xorq")
        if self.operation == "*=":
            return self._assign_special_operation("imulq")

        if self.operation in [">", ">=", "<", "<=", "=="]:
            return self._compare_operation()

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


    def _assign_special_operation(self, spec_op="xorq"):
        from .Identifier import Identifier
        code = ""
        right_code = self.right.asm()

        code += right_code;
        code += "\n"
        code += ASM.instruction("movq", Registers.RAX, Registers.R11)

        code += self.left.asm()
        code += ASM.instruction(spec_op, Registers.R11, Registers.RAX)
        if isinstance(self.left, Identifier):
            code += ASM.instruction("movq", Registers.RAX, self.left.address())
        else:
            code += ASM.instruction("movq", Registers.RAX, Registers.RBX.dereference())

        return code


    def _assign_operation(self):
        from .Identifier import Identifier
        code = ""
        right_code = self.right.asm()

        code += right_code;
        code += "\n"
        if isinstance(self.left, Identifier):
            code += ASM.instruction("movq", Registers.RAX, self.left.address())
        else:

            # assigned value to R11
            code += ASM.instruction("movq", Registers.RAX, Registers.R11)
            code += self.left.asm()
            code += ASM.instruction("movq", Registers.R11, Registers.RBX.dereference())

        return code

    def _compare_operation(self):
        code = ""
        translate_table = {"<": "jge",
                           "<=": "jg",
                           ">": "jle",
                           ">=": "jl",
                           "==": "jne"}

        left_code = self.left.asm()
        right_code = self.right.asm()

        # backup of used registers
        # code += ASM.instruction("pushq", Registers.RAX)
        # code += ASM.instruction("pushq", Registers.RBX)
        code += left_code
        code += "\n"
        # backup result
        code += ASM.instruction("pushq", Registers.RAX)
        code += right_code
        # result of right part to RBX
        code += ASM.instruction("movq", Registers.RAX, Registers.RCX)
        code += ASM.instruction("popq", Registers.RAX)

        code += ASM.instruction("cmp", Registers.RCX, Registers.RAX)
        code += ASM.instruction(translate_table[self.operation], "COMP_FALSE_{0}\n".format(self.label_name()))
        code += "COMP_TRUE_{0}:\n".format(self.label_name())
        code += ASM.instruction("movq", "$1", Registers.RAX)
        code += ASM.instruction("jmp", "COMP_END_{0}\n".format(self.label_name()))

        code += "COMP_FALSE_{0}:\n".format(self.label_name())
        code += ASM.instruction("movq", "$0", Registers.RAX)
        code += "COMP_END_{0}:\n".format(self.label_name())

        return code


    def _translate_operation(self):
        operation = "addq"
        if self.operation == "<<":
            operation = "shld"
        elif self.operation == "|":
            operation = "orq"
        elif self.operation == "||":
            operation = "orq"
        elif self.operation == "+":
            operation = "addq"
        elif self.operation == "-":
            operation = "subq"
        elif self.operation == "*":
            operation = "imulq"
        elif self.operation == "=":
            operation = "movq"

        return ASM.instruction(operation, Registers.RCX, Registers.RAX)
