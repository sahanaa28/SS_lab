%{
/* Design, develop and implement YACC/C program to demonstrate Shift Reduce Parsing technique for
the grammar rules: E →E+T | T, T →T*F | F, F → (E) | id and parse the sentence: id + id * id. */
#include "y.tab.h"
char stack[20];
char in[20];
int st_ptr=0;
int ip_ptr=0;
%}
%%
[a-z]+ {stack[++st_ptr]='i';stack[++st_ptr]='d';in[ip_ptr++]=' '; in[ip_ptr++]=' ';printf("%s\t%s\tshift id\n",stack,in); return id;}
[ \t] ;
[+] { return yytext[0];}
[*] {return yytext[0];}
[(] {return yytext[0];}
[)] {return yytext[0];}
. ;
\n return 0;
%%
