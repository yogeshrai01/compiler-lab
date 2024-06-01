%{
#include<stdio.h>
%}

%%
^[a-zA-Z_][a-zA-Z0-9_]*  printf("Valid identifier");
^[^a-zA-Z_] printf("Invalid identifier");
. ;
%%

int yywrap(){return 1;}
int main()
{
    yylex();
}