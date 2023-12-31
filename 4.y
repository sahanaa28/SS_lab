%{
#include<stdio.h>
#include<stdlib.h>
extern char stack[];
extern char in[];
extern int st_ptr;
extern int ip_ptr;
extern FILE *yyin;
%}
%token id 
%% 
e:e'+' {stack[++st_ptr]='+';
        in[ip_ptr++]=' '; 
	printf("%s\t%s\tshift +\n",stack,in);} t {stack[st_ptr--]=' ';
						  stack[st_ptr--]=' ';
                                                  printf("%s\t%s\treduce e->e+t\n",stack,in);}
|t {stack[st_ptr]='e';
    printf("%s\t%s\treduce e->t\n",stack,in);}
t:t'*' {stack[++st_ptr]='*';
	in[ip_ptr++]=' '; 
	printf("%s\t%s\tshift *\n",stack,in);} f {stack[st_ptr--]=' ';
						  stack[st_ptr--]=' ';
						  printf("%s\t%s\treduce t->t*f\n",stack,in);}
|f {stack[st_ptr]='t';
    printf("%s\t%s\treduce t->f\n",stack,in);}
f:'(' {stack[++st_ptr]='(';
       in[ip_ptr++]=' '; 
       printf("%s\t%s\tshift (\n",stack,in);} e')' {stack[++st_ptr]=')';
                                                     in[ip_ptr++]=' '; 
                                                     printf("%s\t%s\tshift )\n",stack,in);
                                                     stack[st_ptr--]=' ';
                                                     stack[st_ptr--]=' ';  
                                                     stack[st_ptr]='f';
                                                     printf("%s\t%s\treduced f->(e)\n",stack,in);}
|id {stack[st_ptr--]=' ';
     stack[st_ptr]='f';
     printf("%s\t%s\treduce f->id\n",stack,in);}
;
%% 
main(int argc,char *argv[]) 
{ 
stack[ip_ptr]='$';
FILE *fp1;
fp1=fopen(argv[1],"r");
while(!feof(fp1))
fscanf(fp1,"%s",in);
fclose(fp1);
yyin=fopen(argv[1],"r");
printf("stack\tinput\taction\n");
while(!feof(yyin))
{
if(!yyparse()) 
printf("\nValid simple exp \n"); 
} 
}
yyerror() 
{ 
printf("\nInvalid simple expression \n"); 
exit(0); 
}
