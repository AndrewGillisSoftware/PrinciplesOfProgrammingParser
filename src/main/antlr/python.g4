grammar python;

pythonLanguage: (comment |scope | assignment | arithmetic | call | ifblock | conditional | whileLoop | forLoop | newline | unknown)+;

value: (call | arithmetic | VAR | STRING | NUMBER);
call: VAR LPAR value (COMMA value)*? RPAR;

operator: MINUS | PLUS | MULTIPLY | DIVIDE | POWER | MOD;
arithmetic: (VAR | NUMBER | STRING | call) (operator (VAR | NUMBER | STRING | call))+;

assignment: VAR operator? EQ value NEWLINE;

whileLoop: WHILE conditional COLON NEWLINE scope;
forLoop: FOR VAR IN call COLON NEWLINE scope;

elseblock: ELSE COLON NEWLINE scope;
elifblock: ELIF conditional COLON NEWLINE scope;
ifblock: IF LPAR? conditional RPAR? COLON NEWLINE scope ((INDENT)*? elifblock)? ((INDENT)*? elseblock)?;
scope: ((INDENT)+ (assignment | comment | forLoop | whileLoop | ifblock | call NEWLINE | BREAK NEWLINE))+;

conditional: (comparison (LOGIC comparison)* | LPAR comparison (LOGIC comparison)* RPAR)+;
comparison: (value COMPARE value | LPAR value COMPARE value RPAR)+;

comment: COMMENT;
newline: NEWLINE;
unknown: .;

BREAK: 'break';
WHILE: 'while';
FOR: 'for';
IN: 'in';
IF: 'if';
ELIF: 'elif';
ELSE: 'else';

LOGIC: 'and' | 'or' | ('not' | NOT);
COMPARE: EQ EQ | NOT EQ | '<' EQ? | '>' EQ?;
NOT: '!';
COLON: ':';
COMMA: ',';

MULTIPLY: '*';
DIVIDE: '/';
POWER: '^';
MOD: '%';
PLUS: '+';
EQ: '=';

VAR: (LETTER | '_')+ (LETTER | DIGIT |'_')*;

LPAR: '(';
RPAR: ')';

NUMBER: MINUS? DIGIT+;
DIGIT: [0-9];
MINUS: '-';

LETTER: ('a'..'z') | ('A'..'Z');

INDENT: ('    ' | '\t')+;

COMMENT: '#' .*? NEWLINE;
STRING: '"' .*? '"';
NEWLINE: '\r'? '\n' | EOF;
WHITESPACE: ' ' -> skip;
