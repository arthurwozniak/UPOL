from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers

class IfStatement(Node):

    def __init__(self, parent=None, cond=None, then=None, els=None):
        super(IfStatement, self).__init__(parent)
        self.cond = cond
        self.cond.parent = self
        self.then = then
        self.then.parent = self
        self.els = els
        if self.els is not None:
            self.els.parent = self

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Condition: "
        tmp += "\n" + str(self.cond)
        tmp += "\n" + self.depth * "\t" + "Then: "
        tmp += "\n" + str(self.then)
        if self.els is not None:
            tmp += "\n" + self.depth * "\t" + "Else: "
            tmp += "\n" + str(self.els)
        return tmp

    def asm(self):
        code = ""

        code += "{0}_COND:\n".format(self.label_name())
        if self.cond is not None:
            code += self.cond.asm()
            code += ASM.instruction("cmp", "$0", Registers.RAX)
            code += ASM.instruction("je", "{0}_ELSE".format(self.label_name()))

        code += "{0}_THEN:\n".format(self.label_name())
        #print(self.statements)
        code += self.then.asm()
        code += ASM.instruction("jmp", "{0}_END\n".format(self.label_name()))


        code += "{0}_ELSE:\n".format(self.label_name())
        if self.els is not None:
            code += self.els.asm()
        code += "{0}_END:\n".format(self.label_name())


        return code