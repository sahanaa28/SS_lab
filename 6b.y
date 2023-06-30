%{
#include <stdio.h>
#include <stdlib.h>
int id=0, dig=0, key=0, op=0;
extern FILE *yyin;
%}
%token DIGIT ID KEY OP
%%
input:
DIGIT input { dig++; }
| ID input { id++; }
| KEY input { key++; }
| OP input {op++;}
| DIGIT { dig++; }
| ID { id++; }
| KEY { key++; }
| OP { op++;}
;
%%
int main(int argc, char *argv[]) {
yyin = fopen(argv[1], "r");
do {
yyparse();
} while (!feof(yyin));
printf("numbers = %d\nKeywords = %d\nIdentifiers = %d\noperators = %d\n",
dig, key,id, op);
}
int yyerror() {
printf("parse error! Message: ");
exit(0);
}
