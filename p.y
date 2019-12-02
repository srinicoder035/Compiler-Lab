%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int k=0;
void gencode(char* first,char op,char* second, char* rtn)
{
    char temp[100];
    char start[100] = "t";
    printf("t%d = %s %c %s", k, first, op, second);
    int t = k;
    k++;
    printf("\n");
    sprintf(temp,"%d",t);
    strcat(start,temp);
    strcpy(rtn, start);
}
char ind[100];
int c=0;
int v=1;
int i=0;
int a[]={2,3};
void gencodeUnary(char op,char* second, char* rtn)
{
    char temp[100];
    char start[100] = "t";
    printf("t%d = %c %s", k, op, second);
    int t = k;
    k++;
    printf("\n");
    sprintf(temp,"%d",t);
    strcat(start,temp);
    strcpy(rtn, start);

}
void genarray(char* id,char* rtn)
{
	if(c==1)
		v=4;
	else
	{
		v=1;
		for(i=1;i<2;i++)
		{
			v*=a[i];	
		}
		v=v*4;
	}	
	char t[100];
    char start[100] = "t";
	
    printf("t%d = %s*%d", k, id, v);

    printf("\n");
    sprintf(t,"%d",k);
    strcat(start,t);
    strcpy(rtn, start);
	k++;
	if(c==1)
		
	strcpy(ind,rtn);
	else
	{
		strcat(ind,"+");
		strcat(ind,rtn);
	}
}
%}

%union{
    char* str;
}

%token <str> ID ADD SUB MUL DIV ASSIGN LP RP MOD OS CS 
%type <str> TEXT1 TEXT E
%%
S : ID ASSIGN E { printf("\n%s = %s \n", $1, $3); }
E : E ADD E {char temp[100]; gencode($1,'+',$3,temp); strcpy($$,temp);}
  | E SUB E {char temp[100]; gencode($1,'-',$3,temp); strcpy($$,temp);}
  | E MUL E {char temp[100]; gencode($1,'*',$3,temp); strcpy($$,temp);}
  | E DIV E {char temp[100]; gencode($1,'/',$3,temp); strcpy($$,temp);}
  | E MOD E {char temp[100]; gencode($1,'%',$3,temp); strcpy($$,temp);}
  | SUB E {char temp[100]; gencodeUnary('-',$2,temp); strcpy($$,temp);}
  | LP E RP {$$=$2;}
  | TEXT {$$=$1;}
  ;

TEXT:ID TEXT1{printf("t%d = %s[%s]",k,$1,$2);}
;
TEXT1:OS ID CS TEXT1{char temp[100]; c++;genarray($2,temp); strcpy($$,temp);} 
|
;
%%
