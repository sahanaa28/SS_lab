%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B
%%
input:s '\n' {printf("Successful Grammar\n");exit(0);}
s: a B
a: A a|  ;
%%
main()
{
printf("Enter A String\n");
yyparse();
}
int yyerror()
{
printf("Error \n");
exit(0);
}
