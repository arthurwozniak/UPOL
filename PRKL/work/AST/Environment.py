from collections import OrderedDict


class Environment(OrderedDict):

    def __init__(self, parent, offset=0):
        super(Environment, self).__init__()
        self.parent = parent
        self.offset = offset

    def add(self, variable, size):
        if variable not in self.keys():
            #self[variable] = self.offset
            self.offset += size
            self[variable] = self.offset
            return self.offset
        else:
            raise Exception(
                "{0} already defined in this scope".format(variable))
