%{
  #include<stdio.h>
  #include<stdlib.h>
%}

%s A B C D

%%
<INITIAL>a BEGIN B;
<INITIAL>b BEGIN C;
<INITIAL>\n BEGIN INITIAL; printf("accepted\n");
<INITIAL>[^ab\n] BEGIN A;
<B>a  BEGIN INITIAL;
<B>b BEGIN D;
<B>\n BEGIN INITIAL; printf("\nnot accepted\n");
<B>[^ab\n] BEGIN A;
<D>a BEGIN C;
<D>b BEGIN B;
<D>\n BEGIN INITIAL; printf("\nnot accepted\n");
<D>[^ab\n] BEGIN A;
<C>a BEGIN D;
<C>b BEGIN INITIAL;
<C>\n BEGIN INITIAL; printf("\nnot accepted\n");
<C>[^ab\n] BEGIN A;   
<A>\n BEGIN INITIAL; printf("\nnot accepted\n");
<A>[^ab\n] BEGIN A;
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("enter the string : ");
    yylex();
    return 0;
}
