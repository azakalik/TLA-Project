%{

#include "flex-actions.h"

%}

/* Obliga a crear una regla explícita para manejar lexemas desconocidos. */
%option nodefault

/* Escanea un único archivo y se detiene. */
%option noyywrap

/* Dispone una variable global "yylineno" con el número de línea actual. */
%option yylineno

/* Contextos de Flex. */
%x EASYNOTESDIRECTIVE

/* Patrones reutilizables. */
endline			\n
whitespace		[ \f\n\r\t\v]
crlf			\r\n
color           (black|red|blue|yellow|green|orange|purple)
font            (Arial|Times|Calibri|Helvetica)
number          [0-9]+


%%




\$(TITLE|BOLD|ITALIC)\(\s*(\d+)\s*,\s*(blue|red)\s*\)   { return Directive1PatternAction(yytext); }
\$(UL|OL)\(\s*(square|circle)\s*,\s*(red|blue)\s*\)     { return Directive2PatternAction(yytext); }
\$HR\(\s*(\d+)\s*,\s*(circle|square)\s*\)               { return Directive3PatternAction(yytext); }
"{"                                                     { return CurlyOpenPatternAction(yytext); }
"}"                                                     { return CurlyClosePatternAction(yytext); }
[^${};]*                                                { return UserTextPatternAction(yytext); }                             
.                                                       { return UnknownPatternAction(yytext,yyleng); }
%%

