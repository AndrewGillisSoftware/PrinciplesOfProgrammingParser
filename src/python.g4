grammar python;

comment: '#' ANYCHAR* ~('\r'|'\n');
assignment: VARCHAR* '=' VALUE*;
fragment VALUE: '1'..'9';
fragment ANYCHAR: .;
fragment VARCHAR: 'a' .. 'z' | '_';



