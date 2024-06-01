%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token NUM
%left '+' '-'
%left '*' '/'
%right NEGATIVE
%%
E: E '+' E {printf("+");}
 | E '*' E {printf("*");}
 | E '-' E {printf("-");}
 | E '/' E {printf("/");}
 | '(' E ')'
 | '-' E %prec NEGATIVE {printf("-");}
 | NUM {printf("%d", yylval);}
 ;
%%
int main(){
 printf("Enter Infix Expression: \n");
 yyparse();
}
void yyerror (char *msg) {
 printf (" %s : Invalid Character\n", msg);
}
