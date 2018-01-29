from ASM.ASM import ASM


class Program:

    def __init__(self, statements=[]):
        from .Block import Block
        self.statements = statements
        for stmt in statements:
            if isinstance(stmt, Block):
                stmt.parent = self

    def __str__(self):
        return "\n".join([str(i) for i in self.statements])

    def asm(self):
        code = ""
        code += ASM.program_directive()
        for i in self.statements:

            code += i.asm()
        return code
