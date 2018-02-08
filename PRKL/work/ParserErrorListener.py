from antlr4.error.ErrorListener import ErrorListener


class ParserErrorListener(ErrorListener):
    hasError = False
    errors = []

    def __init__(self):
        super(ParserErrorListener, self).__init__()

    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        self.hasError = True
        message = "line: {0}, column: {1}; SYNTAX ERROR\n{2}\n".format(line, column, msg)
        self.errors.append(message)
