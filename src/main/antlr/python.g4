pythonLanguage: (scope | assignment | call | concat | arith | comment | conditional | ifblock | whileLoop | forLoop | unknown)+;

/*math: arith | assignment;
control: ifblock | whileLoop;
other:comment | unknown;*/

call: VAR LPAR value (COMMA value)*? RPAR;
value: (call | concat | arith | VAR | STRING | NUMBER);

assignment: VAR OP_EQ value NEWLINE;
concat: STRING (PLUS (STRING | call))+;
arith: NUMBER (OP NUMBER)+;

whileLoop: WHILE conditional COLON NEWLINE scope;
forLoop: FOR VAR IN call COLON NEWLINE scope;
elseblock: ELSE COLON NEWLINE scope;
elifblock: ELIF conditional NEWLINE scope;
ifblock: IF conditional COLON NEWLINE scope ((INDENT)*? elifblock)? ((INDENT)*? elseblock)?;
scope: ((INDENT)+ (assignment | comment | whileLoop | ifblock | call NEWLINE))+;
conditional: comparison (LOGIC comparison)*;
comparison: value COMPARE value;

comment: '#' .*? NEWLINE;
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

OP_EQ: (OP | PLUS)? EQ;
OP: ('-' | '*' | '/' | '^' | '%');
PLUS: '+';
EQ: '=';

//CALL: VAR'('TYPE*?')';
VAR: (LETTER | '_')+ (LETTER | DIGIT |'_')*;
//TYPE: STRING | INT;
LPAR: '(';
RPAR: ')';

NUMBER: NEGATIVE? DIGIT+;
DIGIT: [0-9];
NEGATIVE: '-';

LETTER: ('a'..'z') | ('A'..'Z');

INDENT: ('    ' | '\t')+;

NEWLINE: '\r'? '\n' | '\r';

STRING: '"' .*? '"';
WHITESPACE: ' ' -> skip;

