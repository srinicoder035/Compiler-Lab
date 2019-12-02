/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 78 "calc.yacc" /* yacc.c:1909  */


#line 47 "y.tab.h" /* yacc.c:1909  */

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IF = 258,
    ELSE = 259,
    WHILE = 260,
    RETURN = 261,
    VOID = 262,
    INT = 263,
    FLOAT = 264,
    FOR = 265,
    INC_OP = 266,
    DEC_OP = 267,
    PLUS = 268,
    MINUS = 269,
    STAR = 270,
    SLASH = 271,
    LT = 272,
    LTEQ = 273,
    GT = 274,
    GTEQ = 275,
    EQ = 276,
    NEQ = 277,
    ASSIGN = 278,
    SEMI = 279,
    COMMA = 280,
    LPAREN = 281,
    RPAREN = 282,
    LSQUAR = 283,
    RSQUAR = 284,
    LBRACE = 285,
    RBRACE = 286,
    LCOMMENT = 287,
    RCOMMENT = 288,
    ID = 289,
    NUM = 290,
    LETTER = 291,
    DIGIT = 292,
    NONTOKEN = 293,
    ERROR = 294,
    ENDFILE = 295
  };
#endif
/* Tokens.  */
#define IF 258
#define ELSE 259
#define WHILE 260
#define RETURN 261
#define VOID 262
#define INT 263
#define FLOAT 264
#define FOR 265
#define INC_OP 266
#define DEC_OP 267
#define PLUS 268
#define MINUS 269
#define STAR 270
#define SLASH 271
#define LT 272
#define LTEQ 273
#define GT 274
#define GTEQ 275
#define EQ 276
#define NEQ 277
#define ASSIGN 278
#define SEMI 279
#define COMMA 280
#define LPAREN 281
#define RPAREN 282
#define LSQUAR 283
#define RSQUAR 284
#define LBRACE 285
#define RBRACE 286
#define LCOMMENT 287
#define RCOMMENT 288
#define ID 289
#define NUM 290
#define LETTER 291
#define DIGIT 292
#define NONTOKEN 293
#define ERROR 294
#define ENDFILE 295

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 80 "calc.yacc" /* yacc.c:1909  */

    char* str;
    struct treeNode * ast;

#line 144 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
