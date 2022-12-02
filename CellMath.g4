grammar CellMath;

equation : expr EOF;

expr 
    :  '-'expr                  #UnaryNegation      // unary minus
    |   expr op=('*'|'/') expr  #MultiplicativeOp   // MultiplicativeOperation
    |   expr op=('+'|'-') expr  #AdditiveOp         // AdditiveOperation
    |   FLOAT                   #Float              // Floating Point Number
    |   INT                     #Integer            // Integer Number
    |   '(' expr ')'            #ParenExpr          // Parenthesized Expression
    ;

MUL :   '*' ;
DIV :   '/' ;
ADD :   '+' ;
SUB :   '-' ;

FLOAT
    :   DIGIT+ '.' DIGIT*
    |   '.' DIGIT+ 
    ;

INT :    DIGIT+ ;

fragment
DIGIT : [0-9] ; // match single digit

//fragment
//ATSIGN : [@];

WS :     [ \t\r\n]+ -> skip ;

ERRORCHAR : . ;
