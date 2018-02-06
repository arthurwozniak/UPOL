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

        if self.operation in ["+=", "-=", "*=", "/=", "^=", "<<="]:
            return self._assign_special_operation()
        if self.operation in [">", ">=", "<", "<=", "==", "!="]:
            return self._compare_operation()
        if self.operation in ["&&", "||"]:
            return self._boolean_operation()
        if self.operation in ["/", "%"]:
            return self._division()
        if self.operation in ["<<", ">>"]:
            return self._shift_operation()

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


    def _assign_special_operation(self):
        from .Identifier import Identifier
        from .UnaryExpression import UnaryExpression
        translate_table = {"^=": "xorq",
                           "*=": "imulq",
                           "+=": "addq",
                           "-=": "subq",
                           "<<=": "shld"}
        code = ""
        if self.operation == "/=":
            code += self._division()
        elif self.operation == "<<=":
            code += self._shift_operation()
        else:
            right_code = self.right.asm()

            code += right_code;
            code += "\n"
            code += ASM.instruction("pushq", Registers.RAX)

            code += self.left.asm()
            code += ASM.instruction("popq", Registers.R11)
            code += ASM.instruction(translate_table[self.operation], Registers.R11, Registers.RAX)
        if isinstance(self.left, Identifier):
            code += ASM.instruction("movq", Registers.RAX, self.left.address())
        elif isinstance(self.left, UnaryExpression):
            code += ASM.instruction("pushq", Registers.RAX)
            code += self.left.expression.asm()
            code += ASM.instruction("popq", Registers.RBX)
            code += ASM.instruction("movq", Registers.RBX, Registers.RAX.dereference())
        else:
            code += ASM.instruction("movq", Registers.RAX, Registers.RBX.dereference())

        return code


    def _assign_operation(self):
        from .Identifier import Identifier
        from .UnaryExpression import UnaryExpression
        code = ""
        right_code = self.right.asm()

        code += right_code;
        code += "\n"
        if isinstance(self.left, Identifier):
            code += ASM.instruction("movq", Registers.RAX, self.left.address())
        elif isinstance(self.left, UnaryExpression):
            code += ASM.instruction("movq", Registers.RAX, Registers.R11)
            code += self.left.expression.asm()
            code += ASM.instruction("movq", Registers.R11, Registers.RAX.dereference())
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
                           "==": "jne",
                           "!=": "je"}

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

    def _boolean_operation2(self):
        code = ""
        left_code = self.left.asm()
        right_code = self.right.asm()

        # backup of used registers
        # code += ASM.instruction("pushq", Registers.RAX)
        # code += ASM.instruction("pushq", Registers.RBX)
        code += left_code
        code += "\n"

        code += ASM.instruction("cmp", "$0", Registers.RAX)
        code += ASM.instruction("je", "COMP_FALSE_{0}\n".format(self.label_name()))
        code += right_code
        code += "\n"
        code += ASM.instruction("cmp", "$0", Registers.RAX)
        code += ASM.instruction("je", "COMP_FALSE_{0}\n".format(self.label_name()))

        code += ASM.instruction("jmp", "COMP_END_{0}\n".format(self.label_name()))

        code += "COMP_FALSE_{0}:\n".format(self.label_name())
        code += ASM.instruction("movq", "$0", Registers.RAX)
        code += "COMP_END_{0}:\n".format(self.label_name())

        return code

    def _boolean_operation(self):
        code = ""
        left_code = self.left.asm()
        right_code = self.right.asm()
        jump_op = "je" if self.operation == "&&" else "jne"
        ret_val = 0 if self.operation == "&&" else 1
        # backup of used registers
        # code += ASM.instruction("pushq", Registers.RAX)
        # code += ASM.instruction("pushq", Registers.RBX)
        code += left_code
        code += "\n"

        code += ASM.instruction("cmp", "$0", Registers.RAX)
        code += ASM.instruction(jump_op, "COMP_FALSE_{0}\n".format(self.label_name()))
        code += right_code
        code += ASM.instruction("jmp", "COMP_END_{0}\n".format(self.label_name()))

        code += "COMP_FALSE_{0}:\n".format(self.label_name())
        code += ASM.instruction("movq", "${0}".format(ret_val), Registers.RAX)
        code += "COMP_END_{0}:\n".format(self.label_name())

        return code

    def _division(self):
        code = ""
        remainder = self.operation == "%"
        left_code = self.left.asm()
        right_code = self.right.asm()

        code += left_code
        code += "\n"
        # backup result
        code += ASM.instruction("pushq", Registers.RAX)
        code += right_code
        # denominator to RBX
        code += ASM.instruction("movq", Registers.RAX, Registers.RBX)
        # nominator to RAX
        code += ASM.instruction("popq", Registers.RAX)
        code += ASM.instruction("cqto")
        # make RDX empty, because we use RDX:RAX
        code += ASM.instruction("idivq", Registers.RBX)
        if remainder:
            code += ASM.instruction("movq", Registers.RDX, Registers.RAX)
        return code

    def _shift_operation(self):
        code = ""
        translate_table = {"<<": "salq",
                           "<<=": "salq",
                           ">>": "sarq",
                           "=>>": "sarq"}
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
        code += ASM.instruction("cltq")

        code += ASM.instruction(translate_table[self.operation], Registers.CL, Registers.RAX)

        # ASM.instruction("popq", Registers.RBX)
        # ASM.instruction("popq", Registers.RAX)

        return code


    def _translate_operation(self):
        operation = "addq"
        if self.operation == "<<":
            operation = "shldq"
        elif self.operation == ">>":
            operation = "shrdq"
        elif self.operation == "|":
            operation = "orq"
        elif self.operation == "||":
            operation = "orq"
        elif self.operation == "^":
            operation = "xorq"
        elif self.operation == "+":
            operation = "addq"
        elif self.operation == "-":
            operation = "subq"
        elif self.operation == "*":
            operation = "imulq"
        elif self.operation == "%":
            operation = "modq"
        elif self.operation == "=":
            operation = "movq"
        elif self.operation == "&":
            operation = "andq"
        return ASM.instruction(operation, Registers.RCX, Registers.RAX)
