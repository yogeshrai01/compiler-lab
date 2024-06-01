%{
    #include<stdio.h>
int ccount =0,wcount=0,scount=0,line=0;
%}

%%
\n  line++;
[ \t] {scount++;}
[^\t\n ]+ {wcount++; ccount +=yyleng;}
. {ccount++;}
%%

int main(void)
{
 extern FILE *yyin;
 yyin = fopen("input.txt","r");
 yylex();
 printf("lines = %d  \nwhitespace = %d \nword =%d \ntotal char = %d \n",line,scount,wcount,ccount+scount);
 return 0;
 
}

int yywrap(){return 1;}