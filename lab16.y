%{
#include<stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}
%token id digit
%left '+' '-'
%left '*' '/'
%%
P: P S '\n'
| ;
S: E {printf("Output: %d\n\n", $1);}
| id '=' E {sym[$1] = $3;}
;
E: digit {$$=$1;}
| id {$$ = sym[$1]; }
| E '+' E {$$ = $1 + $3; }
| E '-' E {$$ = $1 - $3; }
| E '*' E {$$ = $1 * $3; }
| E '/' E {$$ = $1 / $3; }
| '(' E ')' { $$ = $2; }
;
%%
void yyerror(char *msg)
{
 printf("%s : Invalid Character",msg);
}
int main()
{
 printf("Enter Expression to Evaluate: \n");
 yyparse();
 return 0;
}