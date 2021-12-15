grammar python;

pythonLanguage: (arith | assignment | comment | unknown)+;

arith: (CALL | VAR | TYPE) OP (CALL | VAR | TYPE);
assignment: VAR ' '*? OP_EQ ' '*? (CALL | VAR | TYPE) NEWLINE;
comment: '#' .*? NEWLINE;
unknown: .;

OP_EQ: OP? EQ;
OP: ('+' | '-' | '*' | '/' | '^' | '%');
EQ: '=';

CALL: VAR'('TYPE*?')';
VAR: (LETTER | '_')+ (LETTER | DIGIT |'_')*;
TYPE: STRING | INT;

INT: DIGIT+;
DIGIT: [0-9];

LETTER: ('a'..'z') | ('A'..'Z');

NEWLINE: '\r'? '\n';

STRING: '"' .*? '"';

ANYCHAR: .;


