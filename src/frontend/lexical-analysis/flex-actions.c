#include "../../backend/support/logger.h"
#include "flex-actions.h"
#include <stdlib.h>

/**
 * Implementación de "flex-actions.h".
 *
 * Cada función debe realizar 2 operaciones básicas para lograr el streaming
 * de tokens hacia Bison:
 *
 *	1) Computar los atributos del token y almacenarlos donde sea conveniente
 *		(en la tabla de símbolos, en "yylval", o en ambos).
 *	2) Retornar el token que identifica el terminal identificado.
 *
 * Bison utilizará el token retornado en el punto (2) para matchear dicho
 * terminal en la gramática. Por otro lado, el valor almacenado en "yylval" es
 * el que Bison proveerá como valor semántico al realizar una reducción
 * (mediante $1, $2, $3, etc.).
 */
token DolarSignPatternAction(const char * lexeme) {
	LogDebug("DolarSignPatternAction: '%s'.", lexeme);
	yylval.token = DOLLARSIGN;
	return DOLLARSIGN;
}

token CurlyOpenPatternAction(const char * lexeme) {
	LogDebug("CurlyOpenPatternAction: '%s'.", lexeme);
	yylval.token = CURLYOPEN;
	return CURLYOPEN;
}

token CurlyClosePatternAction(const char * lexeme) {
	LogDebug("CurlyClosePatternAction: '%s'.", lexeme);
	yylval.token = CURLYCLOSE;
	return CURLYCLOSE;
}


token OpenParenthesisPatternAction(const char * lexeme) {
	LogDebug("OpenParenthesisPatternAction: '%s'.", lexeme);
	yylval.token = PARENTHESISOPEN;
	return PARENTHESISOPEN;
}

token CloseParenthesisPatternAction(const char * lexeme){
	LogDebug("CloseParenthesisPatternAction: '%s'.", lexeme);
	yylval.token = PARENTHESISCLOSE;
	return PARENTHESISCLOSE;
}

token ArgumentsSeparatorAction(const char * lexeme) {
	LogDebug("ArgumentsSeparatorAction: '%s'.", lexeme);
	yylval.token = COMMA;
	return COMMA;
}



token UserTextPatternAction(const char * yytext,const int yyleng){
	//cuando compile deberia andar
	yylval.token = TEXT;
	return TEXT;
}



token UnknownPatternAction(const char * lexeme, const int length) {
	LogDebug("UnknownPatternAction: '%s' (length = %d).", lexeme, length);
	yylval.token = YYUNDEF;
	// Al emitir este token, el compilador aborta la ejecución.
	return YYUNDEF;
}