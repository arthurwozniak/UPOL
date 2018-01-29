from collections import OrderedDict


class Enviroment(OrderedDict):

    def __init__(self, parent, offset=0):
        self.parent = parent
        self.offset = offset
        super(Enviroment, self).__init__()




    def add(self, variable, size):
        if variable not in self.keys():
            self.offset += size
            self[variable] = self.offset - size + 8
        else:
            raise Exception(
                "{0} already defined in this scope".format(variable))
