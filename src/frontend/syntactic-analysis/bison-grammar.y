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

	//terminales
	token token;

	//terminales y no terminales
	int program;
	int data;
}

// IDs y tipos de los tokens terminales generados desde Flex.
%token <token> DOLLARSIGN
%token <token> CURLYOPEN
%token <token> CURLYCLOSE
%token <token> PARENTHESISOPEN
%token <token> COMMA
%token <token> PARENTHESISCLOSE
%token <token> NUMBER
%token <token> COLOR 
%token <token> BULLETSTYLE
%token <token> TEXT 



// Tipos de dato para los no-terminales generados desde Bison.
%type <program> program
%type <data> texto
%type <data> platasomething
%type <data> something
%type <data> tagname2
%type <data> tagname
%type <data> fontsize
%type <data> bulletstyle
%type <data> fontcolor
%type <data> bulletcolor
// El símbolo inicial de la gramatica.
%start program

%%

program: something {$$ = 0;}/*lambda*/
	;

something: texto something  { $$ = 0; } 
	| platasomething something {$$ = 0; }
	| texto { $$ = 0; }
	| platasomething { $$ = 0; }
	;


platasomething: DOLLARSIGN tagname PARENTHESISOPEN fontsize COMMA fontcolor PARENTHESISCLOSE CURLYOPEN something CURLYCLOSE { $$ = 0; }
	| DOLLARSIGN tagname2 PARENTHESISOPEN bulletcolor COMMA bulletstyle PARENTHESISCLOSE CURLYOPEN something CURLYCLOSE { $$ = 0; } 
	;

texto: TEXT  { $$ = 0; };
fontsize: NUMBER { $$ = 0; };
fontcolor: COLOR { $$ = 0; };
bulletcolor: COLOR {$$ = 0; };
bulletstyle:  BULLETSTYLE { $$ = 0; };
tagname: TEXT { $$ = 0; };
tagname2: TEXT { $$ = 0; };


%%
