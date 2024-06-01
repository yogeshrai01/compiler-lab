%{
  #include<stdio.h>
  #include<stdlib.h>

%}

%s A B C DEAD

%%
<INITIAL>[0-9]+ BEGIN A;
<INITIAL>[0-9]+[.][0-9]+ BEGIN B;
<INITIAL>[a-zA-Z_][a-zA-Z0-9]* BEGIN C;
<INITIAL>[^\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; printf("not accepted\n");
<A>\n BEGIN INITIAL; printf("Integer\n");
<A>[^\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; printf("Float\n");
<B>[^\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; printf("Identifier\n");
<C>[^\n] BEGIN DEAD;
%%

int yywrap()
{
    return 1;
}

int main()
{
     printf("enter the string : ");
     yylex();
    return  0;
}