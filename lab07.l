%{ 
    #include<stdio.h>
%}
  
%% 
\/\/(.*) {}; 
\/\*(.*\n)*.*\*\/  {};	  
%%  
int main(int k,char **argcv) 
{ 
yyin=fopen(argcv[1],"r"); 
yyout=fopen("out.c","w"); 
yylex(); 
return 0; 
}
int yywrap()
{ return 1; }
