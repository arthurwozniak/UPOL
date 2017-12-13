
/* compile with:
   flex example.l
   gcc -Wall -pedantic -ansi -o example lex.yy.c -lfl */

/* sekce definic, konci prvnim vyskytem %% */
/* komentare se pisou normalne jako v C */

%{

/* pomoci %{ a %} vkladame kod v C jak je */

#include <math.h>
#include <stdlib.h>

long
hex_to_long (const char *str)
{
    int i;
    long value, result = 0;

    for (i = 2; i < strlen (str); i ++) {
	if ((str [i] >= '0') && (str [i] <= '9')) {
	    value = str [i] - '0';
	}
	else {
	    if (str [i] >= 'a') {
		value = (str [i] - 'a') + 10;
	    }
	    else {
		value = (str [i] - 'A') + 10;
	    }
	}
	result = (result << 4) + value;
    }
    return result;
}

%}

/* chceme, aby lex pocital prectene radky (kvuli hlaseni chyb) */
%option yylineno

/* regularni definice ve tvaru JMENO VYRAZ */

DIGIT     [0-9]
LETTER    [a-zA-Z]
HEXDIGIT  {DIGIT}|[a-fA-F]
ID        ("_"|{LETTER})({DIGIT}|"_"|{LETTER})*

FIXNUM    {DIGIT}{1,20}
HEXFIXNUM "0"[xX]{HEXDIGIT}{1,16}

DIGITS    {DIGIT}+
EXP       [eE][+-]?{DIGITS}
FRAC      ({DIGITS}?"."{DIGITS})|{DIGITS}"."
FLOAT     ({FRAC}{EXP}?)|({DIGITS}{EXP})

/* definice `exkluzivni' start-condition (kvuli komentarum) */
/* implicitni start condition se jmenuje `INITIAL' */
%x COMMENT

/* za nasledujicim vyskytem %% zacina sekce pravidel */
/* primo do sekce pravidel nelze psat komentare (do akci pro pravidla ano) */

%%

{FIXNUM} {
    /* pro uchovani hodnot yytext je potreba je kopirovat */
    /* dokud nezadame return, lex pokracuje dal v praci */
    printf ("Integer: %s (%li)\n", yytext, atol (yytext));
}

{HEXFIXNUM} {
    printf ("Integer: %s (%li)\n", yytext, hex_to_long (yytext));
}

{FLOAT} {
    printf ("Float: %s (%g)\n", yytext, atof (yytext));
}

if|else|while|do|repeat|until|function|return|break|continue|switch|case {
    printf ("Keyword: %s\n", yytext);
}

{ID} {
    printf ("Indentifier: %s\n", yytext);
}

"+"|"++"|"-"|"*"|"/"|"<"|"<<"|"<="|"<<=" {
    printf ("Operator: %s\n", yytext);
}

"/*" {
    /* zacatek komentare, prejdi ze start condition INITIAL do COMMENT */
    BEGIN (COMMENT);
}

<COMMENT>[^*]+|"*"+[^/] {
    /* vnitrni cast komentare je pozrena */
}

<COMMENT>"*"+"/" {
    /* rozpoznali jsme konec komentare, prepnuti zpet do INITIAL */
    BEGIN (INITIAL);
}

"/"(\\\n)*"/"[^\n]* {
    /* ignoruj komentare ve stylu C++ */
}

[ \t\n]+ {
    /* ignoruj whitespace */
}

. {
    printf ("Lexical error: %s, %i\n", yytext, yylineno);
}

<<EOF>> {
    printf ("End of input\n");
    /* nasledujici je pouze zakuklene pouziti `return', ukonci yylex () */
    yyterminate ();
}

%%

/* predchozi %% indikuje zacatek uzivatelskeho kodu v C */

int
main (int argc, char **argv)
{
    yyin = stdin;
    yylex ();
    printf ("Quitting, ...\n");
    return 0;
}
