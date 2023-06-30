%{
/* Write YACC program to evaluate arithmetic expression involving operators: +, -, *, and /. */
#include "y.tab.h"
extern yylval;
%}
%%
[0-9]+ {yylval=atoi(yytext);return num;}
[ \t] ;
. {return yytext[0];}
\n {return 0;}
%%