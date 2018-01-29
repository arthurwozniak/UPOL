from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers


class ForExpression(Node):

    def __init__(self, init=None, cond=None, step=None, statements=None, parent=None):
        super(ForExpression, self).__init__(parent)
        self.init = init
        self.cond = cond
        self.step = step
        self.statements = statements
        if self.init is not None:
            self.init.parent = self
        if self.cond is not None:
            self.cond.parent = self
        if self.step is not None:
            self.step.parent = self
        self.statements.parent = self

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        if self.init is not None:
            tmp += "\n" + self.depth * "\t" + "Initial value: "
            tmp += "\n" + str(self.init)
        else:
            tmp += "\n" + self.depth * "\t" + "Initial value: None"
        if self.cond is not None:
            tmp += "\n" + self.depth * "\t" + "Condition: "
            tmp += "\n" + str(self.cond)
        else:
            tmp += "\n" + self.depth * "\t" + "Condition: None"
        if self.step is not None:
            tmp += "\n" + self.depth * "\t" + "Step: "
            tmp += "\n" + str(self.step)
        else:
            tmp += "\n" + self.depth * "\t" + "Step: None"
        tmp += "\n" + self.depth * "\t" + "Statement: "
        tmp += "\n" + str(self.statements)
        return tmp


    def asm(self):
        code = ""
        code += "{0}_INIT:\n".format(self.label_name())
        if self.init is not None:
            code += self.init.asm()

        code += "{0}_COND:\n".format(self.label_name())
        if self.cond is not None:
            code += self.cond.asm()
            code += ASM.instruction("cmp", "$0", Registers.RAX)
            code += ASM.instruction("je", "{0}_END".format(self.label_name()))

        code += "{0}_BODY:\n".format(self.label_name())
        #print(self.statements)
        code += self.statements.asm()

        code += "{0}_STEP:\n".format(self.label_name())
        if self.step is not None:
            code += self.step.asm()
        code += ASM.instruction("jmp", "{0}_COND".format(self.label_name()))

        code += "{0}_END:\n".format(self.label_name())


        return code
