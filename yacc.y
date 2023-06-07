
%{
#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "token.h"
#define YYSTYPE Node*
extern int yylex();
extern FILE* yyin;
Token token;
double rot;
double scalex,scaley;
double originx,originy;
double t;
void yyerror(char *s);
void init();
void draw(double x,double y);
void close();
enum Node_type
{
	MINUS1,
	PLUS1,
	MUL1,
	DIV1,
	POWER1,
	FUNC1,
	CONST1,
	T1
};


struct Node

{
	enum Node_type type;
	union
	{
		struct
		{
			struct Node *left, *right;
		} op;
		struct
		{
			struct Node *left;
			double(*Func)(double) ;
		} Func;
		double Const;
		double *T;

	} data;

};


Node* createNode_Op(enum Node_type type, Node* left, Node* right)
{

	Node* temp = (Node*)malloc(sizeof(struct Node));
	temp->type = type;
	temp->data.op.left = left;
	temp->data.op.right = right;
	return temp;
}

Node* createNode_Func(  double(*Func)(double), Node* left)
{
	Node* temp = (Node*)malloc(sizeof(struct Node));
	temp->type = FUNC1;
	temp->data.Func.Func = Func;
	temp->data.Func.left = left;
	return temp;
}

Node* createNode_Const( double value)
{
	Node* temp = (Node*)malloc(sizeof(struct Node));
	temp->data.Const = value;
	temp->type = CONST1;
	return temp;
}
Node* createNode_T()
{
   	Node* temp = (Node*)malloc(sizeof(struct Node));
	temp->data.T = &t;
	temp->type = T1;
	return temp;
}
double evalExpr(Node* Node)
{
     switch(Node->type)
     {
     	case T1:
     		return t;
     		break;
     	case CONST1:
     		return Node->data.Const;
     		break;
     	case FUNC1:
     		return Node->data.Func.Func(evalExpr(Node->data.Func.left));
     		break;
     	case MINUS1:
     		return evalExpr(Node->data.op.left)-evalExpr(Node->data.op.right);
     		break;
     	case PLUS1:
     		return evalExpr(Node->data.op.left)+evalExpr(Node->data.op.right);
     		break;
     	case MUL1:
     		return evalExpr(Node->data.op.left)*evalExpr(Node->data.op.right);
     		break;
     	case DIV1:
     		return evalExpr(Node->data.op.left)/evalExpr(Node->data.op.right);
     		break;
     	case POWER1:
     		return pow(evalExpr(Node->data.op.left),evalExpr(Node->data.op.right));
     		break;
     	default:
     		break;
	 }
	return 0.0;
}
%}


%token  ORIGIN SCALE ROT IS FOR FROM TO STEP DRAW T CONST FUNC ERROR NAME; 

%token  COMMA SEMICO L_BACK R_BACK POWER;

%left PLUS MINUS;

%left MUL DIV;

%right UNSUB;

%right POWER;

%start Program;

%%

Program:
	|Program Stament SEMICO 
		{
		
		}
	;
Stament 
	:FOR T FROM Expr TO Expr STEP Expr DRAW L_BACK Expr COMMA Expr R_BACK
		{
		   double start=evalExpr($4);
		   double end=evalExpr($6);
		   double step=evalExpr($8);
		   for(;start<=end;start+=step)
		   {
		     t=start;
		     double drawx=evalExpr($11);
		     double drawy=evalExpr($13);
		     double x = (drawx * scalex);
       		     double y = (drawy * scaley);
		     double xx = cos(rot) * x - sin(rot) * y;
        	     double yy = cos(rot) * y + sin(rot) * x;
		     

        	     x = xx+originx;
        	     y = yy+originy;
        	     draw(x,y);	     
        	    
        	     
      		     
		    
		   }

		} 
	|ORIGIN IS L_BACK Expr COMMA Expr R_BACK 
		{
		   originx = evalExpr($4);
		   originy = evalExpr($6);
		}
	|SCALE IS L_BACK Expr COMMA Expr R_BACK 
		{
		   scalex = evalExpr($4);
		   scaley = evalExpr($6);
		}
	|ROT IS Expr
		{
		   rot = evalExpr($3);
		}
	;

Expr:T    {$$=createNode_T();}
    |CONST{$$=createNode_Const(token.value);}
    |Expr PLUS Expr {$$=createNode_Op(PLUS1,$1,$3);}
    |Expr MINUS Expr  {$$=createNode_Op(MINUS1,$1,$3);}
    |Expr MUL Expr  {$$=createNode_Op(MUL1,$1,$3);}
    |Expr DIV Expr  {$$=createNode_Op(DIV1,$1,$3);}
    |Expr POWER Expr  {$$=createNode_Op(POWER1,$1,$3);}
    |L_BACK Expr R_BACK  {$$=$2;}
    |MINUS Expr %prec  UNSUB{$$=$2;$$->data.Const=$$->data.Const*-1;}
    |PLUS Expr %prec UNSUB{$$=$2; }
    |FUNC L_BACK Expr R_BACK {$$=createNode_Func(token.FuncPtr,$3);}
    |ERROR {yyerror("invalid token\n");}
    ;


%%

void yyerror(char *s) {
  printf("Error: %s\n", s);
}

 
