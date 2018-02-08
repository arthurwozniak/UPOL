from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers


class WhileExpression(Node):

    def __init__(self, condition=None, parent=None, statement=None):
        super(WhileExpression, self).__init__(parent)
        self.condition = condition
        self.condition.parent = self
        self.statements = statement
        self.statements.parent = self

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Condition: "
        tmp += "\n" + str(self.condition)
        tmp += "\n" + self.depth * "\t" + "Statements: "
        tmp += "\n" + str(self.statements)
        return tmp

    def asm(self):
        code = ""

        code += "{0}_COND:\n".format(self.label_name())
        if self.condition is not None:
            code += self.condition.asm()
            code += ASM.instruction("cmp", "$0", Registers.RAX)
            code += ASM.instruction("je", "{0}_END".format(self.label_name()))

        code += "{0}_BODY:\n".format(self.label_name())
        # print(self.statements)
        code += self.statements.asm()

        code += ASM.instruction("jmp", "{0}_COND".format(self.label_name()))

        code += "{0}_END:\n".format(self.label_name())

        return code
