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


%%



"$"											{  return DolarSignPatternAction(yytext); BEGIN(EASYNOTESDIRECTIVE); }
<EASYNOTESDIRECTIVE>"("                    { return OpenParenthesisPatternAction(yytext); }
<EASYNOTESDIRECTIVE>")"                    { return CloseParenthesisPatternAction(yytext); }
<EASYNOTESDIRECTIVE>"{"                      { return CurlyOpenPatternAction(yytext); }
<EASYNOTESDIRECTIVE>"}"                      { return CurlyClosePatternAction(yytext); BEGIN(INITIAL); }
<EASYNOTESDIRECTIVE>","                      { return ArgumentsSeparatorAction(yytext); }
[^$]*                                        { return UserTextPatternAction(yytext, yyleng); }
.											{ return UnknownPatternAction(yytext, yyleng); }
%%


