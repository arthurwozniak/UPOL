class Node:
    parent = None
    _parent_block = None
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

    @property
    def parent_block(self):
        if self._parent_block is not None:
            return self._parent_block

        from .Function import Function
        from .Program import Program
        from .Block import Block

        self._parent_block = self.parent

        while True:
            if self._parent_block is None:
                break
            elif isinstance(self._parent_block, Block) or isinstance(self._parent_block, Program):
                break
            self._parent_block = self._parent_block.parent

        return self._parent_block

    def label_id(self):
        return hex(id(self))[2:]

    def label_name(self):
        return self.__class__.__name__ + "_" +  self.label_id()

    def __repr__(self):
        return self.__str__().split("\n")[0]

    def asm(self):
        return ""
