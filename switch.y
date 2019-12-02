%{
  #include<bits/stdc++.h>
  #include<stdio.h>
  #include<string.h>
  using namespace std;
  
  extern char* yytext;
  extern "C" {
    int yylex(void);
    int yywrap(void)
    {
      return 1;
    }
    void yyerror(const char* str)
    {
      cout<<"error: "<<str<<endl;
    }
  }
  
  int k=0;
  int l=0;
  
  void gencode( char* first, char* op, char* second, char* temp)
  {
    strcpy(temp,"t");
    cout<<"t"<<k<<" = "<<first<<" "<<op<<" "<<second<<endl;
    char start[100];
    sprintf(start,"%d",k);
    strcat(temp,start);
    k++;
  }
  
  int beg,def;
  
  vector<string> values;
  vector<int> labels;
  
  void printTest()
  {
    for(int i=0;i<values.size();i++)
    {
      cout<<"if t"<<beg<<" = "<<values[i]<<" goto(L"<<labels[i]<<")"<<endl;
    }
    cout<<"goto(L"<<def<<")"<<endl; 
  }
  
%}

%token<str> ID ADD ASS OB CB OP CP SWITCH CASE DEFAULT VAL SEMI BREAK COLON CHAR 
%type<str> switch_stmt case_list default assignment_stmt E expr value

%union {
  char* str;
}

%%

switch_stmt
  : SWITCH OP expr {beg = k-1;} CP { cout<<"goto(test);"<<endl;} OB case_list CB {cout<<"test:"<<endl; printTest(); cout<<"next:"<<endl;}
  ;
  
case_list
  : CASE value  { labels.push_back(l); cout<<"L"<<l<<": "; l++; } COLON assignment_stmt BREAK { cout<<"goto(next);"<<endl; }SEMI case_list
  | DEFAULT COLON {def = l; cout<<"L"<<l<<": "; l++;} assignment_stmt SEMI 
  |
  ;

value
  : VAL   { string s($1); values.push_back(s); }
  | CHAR  { string s($1); values.push_back(s); }
  ;  
    
assignment_stmt
  : ID ASS E SEMI assignment_stmt {printf("%s = %s\n",$1,$3);}
  |
  ;
  
expr
  : E {printf("t%d = %s\n",k,$1); k++;}
  ;
   
E
  : E ADD E { char temp[100]; gencode($1,$2,$3,temp); strcpy($$,temp); } 
  | OP E CP { strcpy($$,$2); }
  | ID      { strcpy($$,$1); }
  ;
   
%%
int main()
{
  yyparse();
  return 0;
}
