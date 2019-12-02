%{
  #include<stdio.h>
  #include "switch.hh"
%}

%%


"+"                     yylval.str = strdup(yytext); return ADD;
"="                     yylval.str = strdup(yytext); return ASS;
"{"                     yylval.str = strdup(yytext); return OB;
"}"                     yylval.str = strdup(yytext); return CB;
"("                     yylval.str = strdup(yytext); return OP;
")"                     yylval.str = strdup(yytext); return CP;
"switch"                yylval.str = strdup(yytext); return SWITCH;
"case"                  yylval.str = strdup(yytext); return CASE;
"default"               yylval.str = strdup(yytext); return DEFAULT;
";"                     yylval.str = strdup(yytext); return SEMI;
"break"                 yylval.str = strdup(yytext); return BREAK;
":"                     yylval.str = strdup(yytext); return COLON;
(\'[a-zA-Z]\')          yylval.str = strdup(yytext); return CHAR;


[a-zA-Z_][a-zA-Z_0-9]*  yylval.str = strdup(yytext); return ID;
[0-9]+                  yylval.str = strdup(yytext); return VAL;
[\n\t ]                 ;
.                       ;

%%
