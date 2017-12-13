from . import Node
import re

class String(Node):

    def __init__(self, text, parent=None):
        super(String, self).__init__(parent)
        self.text = text

    def __str__(self):
        tmp = self.depth * "\t" + self.__class__.__name__ + ": " + str(self.text)

        return tmp
