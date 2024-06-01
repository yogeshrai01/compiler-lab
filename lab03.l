%{
#include<stdio.h>
int valid_int =0 ,valid_float=0;
%}

%%
^[-+]?[0-9]* valid_int++;
^[-+]?[0-9]*[.][0-9]+$ valid_float++;
. ;
%%
int yywrap(){ return 1;}

int main()
{
    yylex();
    if(valid_int != 0) printf("Valid Interger");
    else if(valid_float !=0) printf("Valid Float");
    else printf("Not valid int/float ");
    return 0;
}