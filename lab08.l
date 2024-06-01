%{
   #include<stdio.h>
%}

%%
\<[^>]*\> fprintf(yyout,"%s\n",yytext);
.|\n ;
%%

int yywrap(){return 1;}

int main()
{
    yyin=fopen("input3.html","r");
    yyout= fopen("output3.txt","w");
    yylex();
    return 0;
}