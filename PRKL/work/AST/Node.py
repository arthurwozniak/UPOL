class Node:

    def __init__(self, parent=None):
        self.set_parent(parent)

    def set_parent(self, parent=None):
        self.parent = parent

    @property
    def depth(self):
        if self.parent is None:
            return 0
        else:
            return 1 + self.parent.depth

    def __repr__(self):
        return self.__str__().split("\n")[0]

    def asm(self):
        return ""
