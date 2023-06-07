/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ORIGIN = 258,                  /* ORIGIN  */
    SCALE = 259,                   /* SCALE  */
    ROT = 260,                     /* ROT  */
    IS = 261,                      /* IS  */
    FOR = 262,                     /* FOR  */
    FROM = 263,                    /* FROM  */
    TO = 264,                      /* TO  */
    STEP = 265,                    /* STEP  */
    DRAW = 266,                    /* DRAW  */
    T = 267,                       /* T  */
    CONST = 268,                   /* CONST  */
    FUNC = 269,                    /* FUNC  */
    ERROR = 270,                   /* ERROR  */
    NAME = 271,                    /* NAME  */
    COMMA = 272,                   /* COMMA  */
    SEMICO = 273,                  /* SEMICO  */
    L_BACK = 274,                  /* L_BACK  */
    R_BACK = 275,                  /* R_BACK  */
    POWER = 276,                   /* POWER  */
    PLUS = 277,                    /* PLUS  */
    MINUS = 278,                   /* MINUS  */
    MUL = 279,                     /* MUL  */
    DIV = 280,                     /* DIV  */
    UNSUB = 281                    /* UNSUB  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ORIGIN 258
#define SCALE 259
#define ROT 260
#define IS 261
#define FOR 262
#define FROM 263
#define TO 264
#define STEP 265
#define DRAW 266
#define T 267
#define CONST 268
#define FUNC 269
#define ERROR 270
#define NAME 271
#define COMMA 272
#define SEMICO 273
#define L_BACK 274
#define R_BACK 275
#define POWER 276
#define PLUS 277
#define MINUS 278
#define MUL 279
#define DIV 280
#define UNSUB 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
