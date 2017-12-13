grammar HeroC;

options {
    language = Python3;
}

prog
    :   program
    ;

program
    :   declaration+ functionDefinition+
    |   functionDefinition+
    ;


/** Deklarace proměnných **/

declaration
    :   Long initDeclaratorList? ';'
    ;

initDeclaratorList
    :   initDeclarator
    |   initDeclarator ',' initDeclaratorList
    ;

initDeclarator
    :   pointer? initLongListDeclarator
    |   pointer? initLongDeclarator
    ;

initLongDeclarator
    :   ID '=' expression
    |   ID
    ;

initLongListDeclarator
    :   ID ('[' expression ']')+
    |   ID '=' '{' initializerList? '}'
    |   ID ('[' expression ']')+ '=' '{' initializerList? '}'
    ;

initializer
    :   expression
    |   '{' initializerList '}'
    |   '{' initializerList ',' '}'
    ;

initializerList
    :  initializer (',' initializer)*

    ;

pointer
    :   '*'+
    ;

/** Deklarace fuknce **/
functionDefinition
    :   ID '(' declarationList? ')' compoundStatement
    ;

declarationList
    :   ID
    |   ID ',' declarationList
    ;

/** Blok kódu **/
statement
    :   compoundStatement
    |   expressionStatement
    |   selectionStatement
    |   iterationStatement
    |   jumpStatement
    ;

compoundStatement
    :   '{' blockItemList? '}'
    ;

blockItemList
    :   blockItem
    |   blockItem blockItemList
    ;

blockItem
    :   declaration
    |   statement
    ;

expressionStatement
    :   expression? ';'
    ;

selectionStatement
    :   'if' '(' expression ')' statement ('else' statement)?
    ;

iterationStatement
    :   'while' '(' expression ')' statement
    |   'do' statement 'while' '(' expression ')' ';'
    |   'for' '(' expression? ';' expression? ';' expression? ')' statement
    |   'for' '(' declaration expression? ';' expression? ')' statement
    ;

jumpStatement
    :   'continue' ';'
    |   'break' ';'
    |   'return' expression? ';'
    ;

/** Výrazy **/


primaryExpression
    :   ID
    |   Constant
    |   String+
    |   '(' expression ')'
    ;


unaryOperator
    :   '&' | '*' | '+' | '-' | '~' | '!' | '--' | '++'
    ;

unaryExpression
    :   postfixExpression
    |   functionCallExpression
    |   unaryOperator unaryExpression
    |   'sizeof' '(' Long ')'
    ;

postfixExpression
    :   primaryExpression
    |   postfixExpression '[' expression ']'
    //|   postfixExpression '(' argumentExpressionList? ')'
    |   postfixExpression '++'
    |   postfixExpression '--'
    |   '{' initializerList '}'
    |   '{' initializerList ',' '}'
    ;

argumentExpressionList
    :   assignmentExpression
    |   argumentExpressionList ',' assignmentExpression
    ;

multiplicativeExpression
    :   unaryExpression
    |   multiplicativeExpression '*' unaryExpression
    |   multiplicativeExpression '/' unaryExpression
    |   multiplicativeExpression '%' unaryExpression
    ;

additiveExpression
    :   multiplicativeExpression
    |   additiveExpression '+' multiplicativeExpression
    |   additiveExpression '-' multiplicativeExpression
    ;

shiftExpression
    :   additiveExpression
    |   shiftExpression '<<' additiveExpression
    |   shiftExpression '>>' additiveExpression
    ;

relationalExpression
    :   shiftExpression
    |   relationalExpression '<' shiftExpression
    |   relationalExpression '>' shiftExpression
    |   relationalExpression '<=' shiftExpression
    |   relationalExpression '>=' shiftExpression
    ;

equalityExpression
    :   relationalExpression
    |   equalityExpression '==' relationalExpression
    |   equalityExpression '!=' relationalExpression
    ;

andExpression
    :   equalityExpression
    |   andExpression '&' equalityExpression
    ;

exclusiveOrExpression
    :   andExpression
    |   exclusiveOrExpression '^' andExpression
    ;

inclusiveOrExpression
    :   exclusiveOrExpression
    |   inclusiveOrExpression '|' exclusiveOrExpression
    ;

logicalAndExpression
    :   inclusiveOrExpression
    |   logicalAndExpression '&&' inclusiveOrExpression
    ;

logicalOrExpression
    :   logicalAndExpression
    |   logicalOrExpression '||' logicalAndExpression
    ;

conditionalExpression
    :   logicalOrExpression ('?' expression ':' conditionalExpression)?
    ;

assignmentExpression
    :   conditionalExpression
    |   unaryExpression assignmentOperator assignmentExpression
    ;

assignmentOperator
    :   '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
    ;

functionCallExpression
    :   ID '(' functionParameterList? ')'
    |   ID '(' Char ')'
    ;

functionParameterList
    :   expression
    |   expression ',' functionParameterList
    ;

expression
    :   assignmentExpression
    ;



/** Klíčová slova */
Break   : 'break';
Continue: 'continue';
Do      : 'do';
Else    : 'else';
For     : 'for';
If      : 'if';
Long    : 'long';
Return  : 'return';
Sizeof  : 'sizeof';
While   : 'while';


/** Operátory */
Not :           '!';
NotEqual :      '!=';

Mod :           '%';
ModAssign :     '%=';

And :           '&';
AndAnd :        '&&';
AndAssign :     '&=';

Star :          '*';
StarAssign :    '*=';

Plus :          '+';
PlusPlus :      '++';
PlusAssign :    '+=';

Minus :         '-';
MinusMinus :    '--';
MinusAssign :   '-=';

Div :           '/';
DivAssign :     '/=';

Colon :         ':';

Less :          '<';
LeftShift :     '<<';
LeftShiftAssign :   '<<=';
LessEqual :     '<=';

Assign :        '=';
Equal :         '==';

Greater :       '>';
GreaterEqual :  '>=';
RightShift :    '>>';
RightShiftAssign :  '>>=';

Question :      '?';

Caret :         '^';
XorAssign :     '^=';

Or :            '|';
OrAssign :      '|=';
OrOr :          '||';

Tilde :         '~';


/** Pomocné znaky */
LeftParen :     '(';
RightParen :    ')';
LeftBracket :   '[';
RightBracket :  ']';
LeftBrace :     '{';
RightBrace :    '}';
Semi :          ';';
Comma:          ',';


/** Identifikátory */
ID :                    IdPrefix (IdPrefix | Digit)*;
fragment IdPrefix:      ('_' | Letter);
fragment Letter :       [a-zA-Z];


/** Čísla */
Constant:               OctalConstant | DecConstant | HexConstant;
OctalConstant:          '0' OctalDigit+;
DecConstant:            Digit+;
HexConstant:            HexPrefix HexDigit+;
fragment HexPrefix:     '0' [xX];

fragment Digit:         [0-9];
fragment NonzeroDigit:  [1-9];
fragment OctalDigit:    [0-7];
fragment HexDigit:      [0-9a-fA-F];


/** ASCII a string */
Char:                   '\'' CharSymbol '\'';
String:                 '"' (CharSymbol | Escape)* '"';
fragment Escape:        '\\' ['"?abfnrtv\\];
fragment CharSymbol:    '\u0000' .. '\u007F';



/** Ignorované whitespacy a komentáře */
Whitespace:             [ \t]+ -> skip;
Newline:                ('\r' '\n'?|'\n') -> skip;
BlockComment:           '/*' .*? '*/' -> skip;
