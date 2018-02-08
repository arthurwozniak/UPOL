
class SemanticException(Exception):

    message = ""

    def __init__(self, msg):
        super(SemanticException, self).__init__()
        self.message = msg

