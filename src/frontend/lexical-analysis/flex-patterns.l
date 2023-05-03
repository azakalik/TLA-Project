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



"$"					   { return DolarSignPatternAction(yytext); }
"("                    { return OpenParenthesisPatternAction(yytext); }
")"                    { return CloseParenthesisPatternAction(yytext); }
"{"                    { return CurlyOpenPatternAction(yytext); }
"}"                    { return CurlyClosePatternAction(yytext); }
","                    { return ArgumentsSeparatorAction(yytext); }
[^$]*                  { return UserTextPatternAction(yytext, yyleng); }

"$TITLE"                {}
"$BOLD"
"$ITALIC"

{endline}              { EndlinePatternAttribute(yytext, yyleng); }
{whitespace}		   { IgnoredPatternAction(yytext, yyleng); }
.		               { return UnknownPatternAction(yytext, yyleng); }
%%


