from . import Node
from enum import Enum
from ASM.ASM import ASM
from ASM.Registers import Registers
from .ForExpression import ForExpression
from .WhileExpression import WhileExpression

class JumpStatementType(Enum):
    RETURN = "RETURN"
    BREAK = "BREAK"
    CONTINUE = "CONTINUE"


class JumpStatement(Node):

    def __init__(self, parent=None, type_val=None, return_val=None):
        super(JumpStatement, self).__init__(parent)
        self.type_val = type_val
        self.return_val = return_val
        if self.return_val is not None:
            self.return_val.parent = self

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__
        tmp += "\n" + self.depth * "\t" + "Type: " + str(self.type_val)
        if self.return_val is not None:
            tmp += "\n" + self.depth * "\t" + "Return value: "
            tmp += "\n" + str(self.return_val)
        return tmp

    def _get_parent_loop(self):

        p = self.parent
        while True:
            if p is None:
                break
            if isinstance(p, ForExpression) or isinstance(p, WhileExpression):
                break
            p = p.parent
        return p

    def asm(self):
        code = ""

        if self.type_val == JumpStatementType.BREAK:
            parent = self._get_parent_loop()
            if parent is None:
                return code
            code += ASM.instruction("jmp", parent.label_name() + "_END")

        if self.type_val == JumpStatementType.CONTINUE:
            parent = self._get_parent_loop()
            if parent is None:
                return code
            if isinstance(parent, ForExpression):
                code += ASM.instruction("jmp", parent.label_name() + "_STEP")
            else:
                code += ASM.instruction("jmp", parent.label_name() + "_COND")

        if self.type_val == JumpStatementType.RETURN:
            if self.return_val is not None:
                code += self.return_val.asm()
            else:
                code += ASM.instruction("movq", "$0", Registers.RAX)
            code += ASM.instruction("leave")
            code += ASM.instruction("ret")

        return code
