from ASM.ASM import ASM
from .Variable import Variable, VariableType
from .Function import Function


class Program:
    propagation = set()
    parent_block = None
    functions = []

    def __init__(self, statements=[]):
        from .Block import Block
        from .Environment import Environment
        self.statements = statements
        self.depth = 0
        self.environment = Environment(None)

        for stmt in statements:
            if isinstance(stmt, Block):
                stmt.parent = self

    def __str__(self):
        return "\n".join([str(i) for i in self.statements]) + "\n"

    def asm(self):
        code = ""
        code += ASM.program_directive()
        for i in self.statements:
            i.parent = self
            if isinstance(i, Function):
                self.functions.append(str(i.id))
            if isinstance(i, Variable):
                self.environment.add(i.id.text, i.byte_size(), i.type)
                code += i.asm_global()
            else:
                code += i.asm()

        return code
