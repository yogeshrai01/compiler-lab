%{
    #include<stdio.h>
int ccount =0,wcount=0,scount=0,line=0,tab=0;
%}

%%
\n  line++;
\t {tab++; ccount+=yyleng;}
[ \t] {scount++;}
[^\t\n ]+ {wcount++; ccount +=yyleng;}
. {ccount++;}
%%

int main(void)
{
 yylex();
 printf("lines = %d  \nwhitespace = %d \n tabs = %d \nword =%d \ntotal char = %d \n",line,scount,tab,wcount,ccount+scount);
 return 0;
 
}

int yywrap(){return 1;}