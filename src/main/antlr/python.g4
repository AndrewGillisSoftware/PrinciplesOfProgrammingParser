pythonLanguage: (arith | assignment | comment | conditional | ifblock | whileLoop | forLoop | unknown)+;

/*math: arith | assignment;
control: ifblock | whileLoop;
other:comment | unknown;*/

call: VAR LPAR (.*?) RPAR;
statement: call NEWLINE;

assignment: VAR ' '*? OP_EQ ' '*? (call | VAR | TYPE | arith) NEWLINE;
arith: (call | VAR | TYPE) ' '*? (OP ' '*? (call | VAR | TYPE))+ NEWLINE;

whileLoop: WHILE ' '*? conditional ' '*? NEWLINE scope;
forLoop: FOR ' '*? VAR ' '*? IN ' '*? call COLON NEWLINE scope;
elseblock: ELSE COLON NEWLINE scope;
elifblock: ELIF ' '*? conditional ' '*? NEWLINE scope;
ifblock:(INDENT)*? IF ' '*? conditional ' '*? NEWLINE scope ((INDENT)*? elifblock)? ((INDENT)*? elseblock)?;
scope: ((INDENT)+ (arith | assignment | comment | conditional | whileLoop | ifblock | statement))+;
conditional: comparison (' '*? LOGIC ' '*? comparison)* COLON;
comparison: (call | VAR | TYPE | arith) ' '*? COMPARE ' '*? (call | VAR | TYPE | arith);

comment: '#' .*? NEWLINE;
unknown: .;

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

OP_EQ: OP? EQ;
OP: ('+' | '-' | '*' | '/' | '^' | '%');
EQ: '=';

//CALL: VAR'('TYPE*?')';
VAR: (LETTER | '_')+ (LETTER | DIGIT |'_')*;
TYPE: STRING | INT;
LPAR: '(';
RPAR: ')';

INT: NEGATIVE DIGIT+ | DIGIT+;
DIGIT: [0-9];
NEGATIVE: '-';

LETTER: ('a'..'z') | ('A'..'Z');

INDENT: '    ';

NEWLINE: '\r'? '\n';

STRING: '"' .*? '"'; 

