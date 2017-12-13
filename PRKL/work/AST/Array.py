from . import Node


class Array(Node):

    def __init__(self, values=None, size=None, parent=None):
        super(Array, self).__init__(parent)
        self.values = values
        self.size = size
        if self.size is None:
            self.size = 0 if self.values is None else len(self.values)

    def __str__(self):
        tmp = self.depth * '\t' + self.__class__.__name__
        tmp += "\n" + (1+self.depth) * "\t" + "Size: " + str(self.size)
        for i in self.values:
            tmp += "\n" + (1+self.depth)*'\t' + str(i)
        return tmp
