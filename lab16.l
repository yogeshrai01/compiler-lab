%{
#include "y.tab.h"
int yylval;
%}
%%
[a-z] {yylval = *yytext - 'a'; return id;}
[0-9]+ {yylval = atoi(yytext); return digit;}
[-+()=/*\n] {return *yytext;}
[ \t];
%%
int yywrap()
{
 return 1;
}