%{
/* Develop, Implement and execute a program using YACC tool to recognize all strings ending
with b preceded by n a’s using the grammar a^nb (note: input n value). */
#include "y.tab.h"
%}
%%
"a" {return A;}
"b" {return B;}
. return yytext[0];
[\n] return 0;
%%
