from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers

class DoWhileExpression(Node):

    def __init__(self, condition=None, parent=None, statement=None):
        super(DoWhileExpression, self).__init__(parent)
        self.condition = condition
        self.condition.parent = self
        self.statement = statement
        self.statement.parent = self

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Condition: "
        tmp += "\n" + str(self.condition)
        tmp += "\n" + self.depth * "\t" + "Statement: "
        tmp += "\n" + str(self.statement)
        return tmp

    def asm(self):
        code = ""

        code += "{0}_BODY:\n".format(self.label_name())
        # print(self.statements)
        code += self.statement.asm()

        code += "{0}_COND:\n".format(self.label_name())
        if self.condition is not None:
            code += self.condition.asm()
            code += ASM.instruction("cmp", "$0", Registers.RAX)
            code += ASM.instruction("je", "{0}_END".format(self.label_name()))



        code += ASM.instruction("jmp", "{0}_BODY".format(self.label_name()))

        code += "{0}_END:\n".format(self.label_name())


        return code