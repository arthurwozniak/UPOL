from . import Node
from ASM.ASM import ASM
from ASM.Registers import Registers


class Function(Node):

    def __init__(self, parent=None, id=None, arguments=None, body=None):
        super(Function, self).__init__(parent)
        self.id = id
        self.arguments = arguments
        self.body = body
        # if self.id is not None:
        #     #self.id.set_parent(self)
        if self.arguments is not None:
            for i in self.arguments:
                i.set_parent(self)
        if self.body is not None:
            self.body.set_parent(self)

    def __str__(self):
        tmp = self.__class__.__name__ + " " + str(self.id)
        tmp += '\n' + self.depth * '\t' + "Arguments: "
        for i in self.arguments:
            tmp += '\n' + str(i)
        #tmp = "function: {0}; args: {1},\nbody:".format(self.id, self.arguments)
        tmp += '\n' + self.depth * '\t' + "Body: "
        tmp += '\n' + str(self.body)
        return tmp

    def asm(self):
        code = "{0}:\n".format(self.id)
        code += ASM.instruction("pushq", Registers.RBP)
        code += ASM.instruction("movq", Registers.RSP, Registers.RBP)
        code += self.body.asm()
        code += "\n"

        # obnovíme registry
        code += ASM.instruction("ret")
        return code
