%{
#include "punto3.tab.h"
%}

digito	[0-9]
%%
{digito}+(\.{digito})?		{yylval=atof(yytext); return NUM;} 
"("							{return APS;} 
")"							{return CPS;} 
\*							{return MUL;}
\/							{return DIV;}
\+							{return MAS;}
\-							{return MEN;}
\n							{return EOL;}
[ \t]						{/*Ignora Espacios*/}
.							{printf("Error lexico: %s\n", yytext);} 
%%
/** Sección código de usuario **/