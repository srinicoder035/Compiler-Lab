%{
	#include<stdio.h>
	#include "y.tab.h"
%}

%%

"("		return LP;
")"		return RP;
"+"		return ADD;
"-"		return SUB;
"*"		return MUL;
"/"		return DIV;
"="		return ASSIGN;
"sqrt" 	return SQRT;
"%"		return MOD;

[0-9]+ 	yylval.a=atoi(yytext); return ID;
[\n \t] ;

%%

int yywrap(void)
{
	return 1;
}
