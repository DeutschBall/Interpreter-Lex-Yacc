
%option noyywrap
%{
#include <stdio.h>
#include <math.h>
#include "y.tab.h"
#include "token.h"
int line_o=0;
extern Token token;
%}

%%

"--".*         
"//".*           
"/*"([^*]|\n)*"*/"  
[ \t]
[\r]  
[\n]  {line_o++; }  
[0-9]+(\.[0-9]+)? {token.value=atof(yytext); return CONST;} 

"origin" {return ORIGIN;}
"scale"  {return SCALE;}
"rot"  {return ROT;}
"is"  {return IS;}
"for"  {return FOR;}
"from"  {return FROM;}
"to"  {return TO;}
"step"  {return STEP;}
"draw"  {return DRAW;}
"t"  {return T;}
"T"  {return T;}

"pi"  {token.value=3.1415926; return CONST;}
"e"  {token.value=2.7;return CONST;}

"sin"  {token.FuncPtr=sin;return FUNC;}
"cos"  {token.FuncPtr=cos;return FUNC;}
"tan"  {token.FuncPtr=tan;return FUNC;}
"exp"  {token.FuncPtr=exp;return FUNC;}
"ln"  {token.FuncPtr=log;return FUNC;}
"sqrt"  {token.FuncPtr=sqrt;return FUNC;}

"-"  {return MINUS;}
"+"  {return PLUS;}
"*"  {return MUL;}
"/"  {return DIV;}
","  {return COMMA;}
";"  { return SEMICO;}
"("  {return L_BACK;}
")"  {return R_BACK;}
"**"  {return POWER;}

[a-zA-Z_][a-zA-Z0-9_]*   {  return NAME;}
. {return ERROR;}
%%

