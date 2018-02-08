from collections import OrderedDict
from .SemanticException import SemanticException


class Environment(OrderedDict):

    def __init__(self, parent, offset=0):
        super(Environment, self).__init__()
        self.parent = parent
        self.offset = offset
        self.start = offset

    def add(self, variable, size, type):
        if variable not in self.keys():
            # self[variable] = self.offset
            self.offset += size
            self[variable] = (self.offset, type)
            return self.offset
        else:
            raise SemanticException(
                "{0} already defined in this scope".format(variable))

    def get_offset(self, id):
        if id in self.keys():
            return self[id][0]
        else:
            raise SemanticException("Variable `{0}` is not in this scope".format(id))

    def get_type(self, id):
        if id in self.keys():
            return self[id][1]
        else:
            raise SemanticException("Variable `{0}` is not in this scope".format(id))

    def get_sub(self):
        return self.offset - self.start
