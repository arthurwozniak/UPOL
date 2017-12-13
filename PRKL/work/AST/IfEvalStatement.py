from . import Node


class IfEvalStatement(Node):

    def __init__(self, parent=None, cond=None, then=None, els=None):
        super(IfEvalStatement, self).__init__(parent)
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
