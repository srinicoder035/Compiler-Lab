%{
	#include<stdio.h>
%}

%token FOR LP TEXT RP OB CB SEMI
%type<str> for_stmt stmt FOR LP TEXT RP OB CB SEMI


%union {
	char* str;
}
%%

for_stmt
	: FOR LP TEXT SEMI TEXT SEMI TEXT RP {printf("%s;\nwhile(%s)",$3,$5);} OB {printf("{");} stmt {printf("%s;\n",$7);} CB {printf("}");}
	;

	
stmt 
	: TEXT {printf("%s",$1);} SEMI {printf(";");} stmt
	|
	;

%%
int main(int argc, char** argv)
{
	FILE *file;
    file = fopen(argv[1], "r");
    yyset_in(file);
    yyparse();
}

int yyerror(char *str) {
	printf("There was an error.");
	return 0;
}
