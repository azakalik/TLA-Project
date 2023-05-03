%{

#include "bison-actions.h"

%}

// Tipos de dato utilizados en las variables semánticas ($$, $1, $2, etc.).
%union {
	// No-terminales (backend).
	/*
	Program program;
	...
	*/

	// No-terminales (frontend).
	int program;
	int expression;
	int directive;
	int expressions;

	// Terminales
	token token;
}

// IDs y tipos de los tokens terminales generados desde Flex.
%token <token> DIRECTIVE1 
%token <token> DIRECTIVE2
%token <token> DIRECTIVE3
%token <token> CURLYOPEN 
%token <token> CURLYCLOSE
%token <token> USERTEXT 



// Tipos de dato para los no-terminales generados desde Bison.
%type <program> program
%type <expression> expression
%type <directive> directive
%type <expressions> expressions

// El símbolo inicial de la gramatica.
%start program

%%

program: expressions { $$ = ProgramGrammarAction(1);}
	;

expressions: expression expressions { printf("expressions --> expression expressions"); $$ = 0; }
| USERTEXT { printf("expressions --> USERTEXT");  $$ = 0; } 
|
;

expression: USERTEXT directive { printf("expression --> USERTEXT directive"); $$ = 0; }
| directive { printf("expression --> directive"); $$ = 0;}
| USERTEXT { printf("expression --> USERTEXT"); $$ = 0; }
;

directive: DIRECTIVE1 CURLYOPEN expression CURLYCLOSE { printf("directive --> d1"); $$ = 0; }
| DIRECTIVE3 expression { printf("directive --> d2"); $$ = 0; }
;


%%
