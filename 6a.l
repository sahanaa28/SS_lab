
%{
/* 6.a) Write a LEX program to eliminate comment lines in a C program and copy the resulting
program into a separate file. */
#include<stdio.h>
int c_count=0; 
%}
%%
"/*"[^*/]*"*/" {c_count++;}
"//".* {c_count++;}
%%
int main( int argc, char *argv[])
{
if(argc!=3)
{
printf("usage %s <src file> <dest file>",argv[0]);
return 0;
} 
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("Number of Comment Lines: %d\n",c_count);
return 0;
}
