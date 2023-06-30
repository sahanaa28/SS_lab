%{
/* a. Write a LEX program to recognize valid arithmetic expression. Identifiers in the expression
could be only integers and operators could be + and *. Count the identifiers & operators present
and print them separately. */
#include<stdio.h>
int count1=0,count2=0,bracket=0,count3=0;
%}
%%
[+] { printf("operator: +"); count1++; count2++;}
[-] { printf("operator: -"); count1++; count2++;}
[*] { printf("operator: *"); count1++; count2++;}
[/] { printf("operator: /"); count1++; count2++;}
[0-9]+ {printf("identifier: %s",yytext);count2++;count3++;}
[(] {bracket++;}
[)] {bracket--;}
%%
main()
{
printf("ENTER THE EXPRESSION : ");
yylex();
printf("number of operators = %d",count1);
printf("\nnumber of identifiers = %d",count3);
if(count2%2==0||bracket!=0||count2==0)
printf("\nInvalid Expression\n");
else
printf("\nValid Expression\n");
}
