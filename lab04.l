%{
    #include<stdio.h>


%}

%%
auto|double|int|struct|if|else|do|for|while|long|short|float  {ECHO; printf("\nKEYWORD\n");}
[{};,()] {ECHO;printf("\tseperater\t");}
[+-/*=%]  {ECHO; printf("\toperator\t");}
([a-zA-Z][0-9])+|[a-zA-Z]* {ECHO; printf("\tIdentifier\t");}
.|\n ;
%%

int yywrap() 
{
    return 1;
}
int main()
{
    yylex();
    return 0;
}