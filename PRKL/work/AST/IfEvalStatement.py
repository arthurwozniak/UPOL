from . import IfStatement
from ASM.ASM import ASM
from ASM.Registers import Registers


class IfEvalStatement(IfStatement):

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