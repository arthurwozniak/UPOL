Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

Help on ExclusiveOrExpressionContext in module HeroCParser object:

class ExclusiveOrExpressionContext(antlr4.ParserRuleContext.ParserRuleContext)
 |  Method resolution order:
 |      ExclusiveOrExpressionContext
 |      antlr4.ParserRuleContext.ParserRuleContext
 |      antlr4.RuleContext.RuleContext
 |      antlr4.tree.Tree.RuleNode
 |      antlr4.tree.Tree.ParseTree
 |      antlr4.tree.Tree.SyntaxTree
 |      antlr4.tree.Tree.Tree
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __init__(self, parser, parent:antlr4.ParserRuleContext.ParserRuleContext=None, invokingState:int=-1)
 |  
 |  accept(self, visitor:antlr4.tree.Tree.ParseTreeVisitor)
 |  
 |  andExpression(self)
 |  
 |  exclusiveOrExpression(self)
 |  
 |  getRuleIndex(self)
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.ParserRuleContext.ParserRuleContext:
 |  
 |  addChild(self, child:antlr4.tree.Tree.ParseTree)
 |      #* Does not set parent link; other add methods do that#/
 |  
 |  addErrorNode(self, badToken:antlr4.Token.Token)
 |  
 |  addTokenNode(self, token:antlr4.Token.Token)
 |  
 |  copyFrom(self, ctx:None)
 |      #* COPY a ctx (I'm deliberately not using copy constructor)#/
 |      #
 |      # This is used in the generated parser code to flip a generic XContext
 |      # node for rule X to a YContext for alt label Y. In that sense, it is
 |      # not really a generic copy function.
 |      #
 |      # If we do an error sync() at start of a rule, we might add error nodes
 |      # to the generic XContext so this function must copy those nodes to
 |      # the YContext as well else they are lost!
 |      #/
 |  
 |  enterRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |      # Double dispatch methods for listeners
 |  
 |  exitRule(self, listener:antlr4.tree.Tree.ParseTreeListener)
 |  
 |  getChild(self, i:int, ttype:type=None)
 |  
 |  getChildCount(self)
 |  
 |  getChildren(self, predicate=None)
 |  
 |  getSourceInterval(self)
 |  
 |  getToken(self, ttype:int, i:int)
 |  
 |  getTokens(self, ttype:int)
 |  
 |  getTypedRuleContext(self, ctxType:type, i:int)
 |  
 |  getTypedRuleContexts(self, ctxType:type)
 |  
 |  removeLastChild(self)
 |      #* Used by enterOuterAlt to toss out a RuleContext previously added as
 |      #  we entered a rule. If we have # label, we will need to remove
 |      #  generic ruleContext object.
 |      #/
 |  
 |  ----------------------------------------------------------------------
 |  Methods inherited from antlr4.RuleContext.RuleContext:
 |  
 |  __str__(self)
 |  
 |  depth(self)
 |  
 |  getAltNumber(self)
 |      # For rule associated with this parse tree internal node, return
 |      # the outer alternative number used to match the input. Default
 |      # implementation does not compute nor store this alt num. Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |      # to set it.
 |  
 |  getPayload(self)
 |  
 |  getRuleContext(self)
 |  
 |  getText(self)
 |      #  tokens which have been added to the parse tree.
 |      #  <p>
 |      #  Since tokens on hidden channels (e.g. whitespace or comments) are not
 |      #  added to the parse trees, they will not appear in the output of this
 |      #  method.
 |      #/
 |  
 |  isEmpty(self)
 |      # A context is empty if there is no invoking state; meaning nobody call
 |      #  current context.
 |  
 |  setAltNumber(self, altNumber:int)
 |      # Set the outer alternative number for this context node. Default
 |      # implementation does nothing to avoid backing field overhead for
 |      # trees that don't need it.  Create
 |      # a subclass of ParserRuleContext with backing field and set
 |      # option contextSuperClass.
 |  
 |  toString(self, ruleNames:list, stop:None) -> str
 |  
 |  toStringTree(self, ruleNames:list=None, recog:None=None)
 |  
 |  ----------------------------------------------------------------------
 |  Data and other attributes inherited from antlr4.RuleContext.RuleContext:
 |  
 |  EMPTY = <antlr4.ParserRuleContext.ParserRuleContext object>
 |  
 |  ----------------------------------------------------------------------
 |  Data descriptors inherited from antlr4.tree.Tree.Tree:
 |  
 |  __dict__
 |      dictionary for instance variables (if defined)
 |  
 |  __weakref__
 |      list of weak references to the object (if defined)

    .text
            .global main

            .type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0, %rsp
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$1, %rax

	pushq	%rax
	movq	$2, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	movq	$3, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	movq	$4, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$65535, %rax

	pushq	%rax
	movq	$65280, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	shld	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	shld	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$891010, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	shld	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$891010, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	shld	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9

	pushq	%rax
	movq	$891010, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	shld	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9

	pushq	%rax
	movq	$891010, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$12345, %rax

	pushq	%rax
	movq	$678, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$9, %rax
	movq	%rax, %rcx
	popq	%rax
	shld	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$20, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fbe8f23b6d8

COMP_TRUE_BinaryExpression_7fbe8f23b6d8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fbe8f23b6d8

COMP_FALSE_BinaryExpression_7fbe8f23b6d8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fbe8f23b6d8:

	pushq	%rax
	movq	$40, %rax

	pushq	%rax
	movq	$40, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jg	COMP_FALSE_BinaryExpression_7fbe8f23b9e8

COMP_TRUE_BinaryExpression_7fbe8f23b9e8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fbe8f23b9e8

COMP_FALSE_BinaryExpression_7fbe8f23b9e8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fbe8f23b9e8:
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	movq	$10, %rax

	pushq	%rax
	movq	$10, %rax

	pushq	%rax
	movq	$20, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jge	COMP_FALSE_BinaryExpression_7fbe8f23bac8

COMP_TRUE_BinaryExpression_7fbe8f23bac8:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fbe8f23bac8

COMP_FALSE_BinaryExpression_7fbe8f23bac8:
	movq	$0, %rax
COMP_END_BinaryExpression_7fbe8f23bac8:

	pushq	%rax
	movq	$40, %rax

	pushq	%rax
	movq	$40, %rax
	movq	%rax, %rcx
	popq	%rax
	cmp	%rcx, %rax
	jl	COMP_FALSE_BinaryExpression_7fbe8f23bb38

COMP_TRUE_BinaryExpression_7fbe8f23bb38:
	movq	$1, %rax
	jmp	COMP_END_BinaryExpression_7fbe8f23bb38

COMP_FALSE_BinaryExpression_7fbe8f23bb38:
	movq	$0, %rax
COMP_END_BinaryExpression_7fbe8f23bb38:
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax

	pushq	%rax
	movq	$333, %rax
	movq	%rax, %rcx
	popq	%rax
	orq	%rcx, %rax
	movq	%rax, %rcx
	popq	%rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	print_long
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi

	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	call	print_nl
	popq	%r9
	popq	%r8
	popq	%rcx
	popq	%rdx
	popq	%rsi
	popq	%rdi


	leave	
	ret	
