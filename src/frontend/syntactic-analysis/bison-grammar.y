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
	int something;
	int platasomething;
	int texto;
	int fontsize;
	int fontcolor;
	int bulletcolor;
	int bulletstyle;
	int tagname;
	int tagname2;

	// Terminales
	token token;
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
%token <token> ENDLINE



// Tipos de dato para los no-terminales generados desde Bison.
%type <program> program
%type <texto> texto
%type <platasomething> platasomething
%type <something> something
%type <tagname2> tagname2
%type <tagname> tagname
%type <fontsize> fontsize
%type <bulletstyle> bulletstyle
%type <fontcolor> fontcolor
%type <bulletcolor> bulletcolor

// El símbolo inicial de la gramatica.
%start program

%%

program: something { $$ = ProgramGrammarAction(1);}
	;

something: texto something   {$$ = 0;}
	| platasomething something {$$ = 0;}
	| texto { $$ = 0; }
	| platasomething  { $$ = 0;}
	;


platasomething: DOLLARSIGN tagname PARENTHESISOPEN fontsize COMMA fontcolor PARENTHESISCLOSE CURLYOPEN something CURLYCLOSE { $$ = 0;}
	| DOLLARSIGN tagname2 PARENTHESISOPEN bulletcolor COMMA bulletstyle PARENTHESISCLOSE CURLYOPEN something CURLYCLOSE  { $$ = 0;}
	;

texto: TEXT { $$ = 0; };
fontsize: NUMBER { $$ = 0; } ;
fontcolor: COLOR { $$ = 0; };
bulletcolor: COLOR { $$ = 0; };
bulletstyle:  BULLETSTYLE { $$ = 0;};
tagname: TEXT { $$ = 0; } ;
tagname2: TEXT { $$ = 0; };


%%
