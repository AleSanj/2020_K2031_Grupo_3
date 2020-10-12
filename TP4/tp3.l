%option lex-compat
%option noyywrap


%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "tp4.tab.h"
    #include <string.h>
%}

SALTO_DE_LINEA \n
CONSTANTE_DECIMAL [1-9][0-9]*
CONSTANTE_OCTAL 0[0-7]*
CONSTANTE_HEXADECIMAL 0[xX][0-9a-fA-F]+
CONSTANTE_REAL [1-9][0-9]*"."[0-9]*"E"?[\+\-]?[0-9]*
LITERAL_CADENA \"[^\"]*\"
CARACTER_SIMPLE "'"."'"
IDENTIFICADOR ([a-zA-Z]|_)([a-zA-Z]|[0-9]|_)*
COMENTARIO_LINEA "//".*
COMENTARIO_MULTIPLE \/\*(\*+[^\*\/]|[^\*])*\*+\/

%%

"break"    {yylval.cadena=yytext;return BREAK;}
"case"     {yylval.cadena=yytext;return CASE;}
"char"     {yylval.cadena=yytext;return CHAR;}
"const"    {yylval.cadena=yytext;return CONST;}
"default"  {yylval.cadena=yytext;return DEFAULT;}
"do"       {yylval.cadena=yytext;return DO;}
"double"   {yylval.cadena=yytext;return DOUBLE;}
"else"     {yylval.cadena=yytext;return ELSE;}
"enum"     {yylval.cadena=yytext;return ENUM;}
"float"    {yylval.cadena=yytext;return FLOAT;}
"for"      {yylval.cadena=yytext;return FOR;}
"if"       {yylval.cadena=yytext;return IF;}
"int"      {yylval.cadena=yytext;return INT;}
"long"     {yylval.cadena=yytext;return LONG;}
"return"   {yylval.cadena=yytext;return RETURN;}
"short"    {yylval.cadena=yytext;return SHORT;}
"signed"   {yylval.cadena=yytext;return SIGNED;}
"sizeof"   {yylval.cadena=yytext;return SIZEOF;}
"struct"   {yylval.cadena=yytext;return STRUCT;}
"switch"   {yylval.cadena=yytext;return SWITCH;}
"typedef"  {yylval.cadena=yytext;return TYPEDEF;}
"union"    {yylval.cadena=yytext;return UNION;}
"unsigned" {yylval.cadena=yytext;return UNSIGNED;}
"void"     {yylval.cadena=yytext;return VOID;}
"while"    {yylval.cadena=yytext;return WHILE;}
"extern"   {yylval.cadena=yytext;return EXTERN;}
"volatile" {yylval.cadena=yytext;return VOLATILE;}

")"        {return ')';}
"["        {return '[';}
"}"        {return '}';}
"]"        {return ']';}
","        {return ',';}
":"        {return ':';}
"="        {return '=';}
";"        {return ';';}
"("        {return '(';}
"{"        {return '{';}



{CONSTANTE_DECIMAL}       {yylval.nro = strtol(yytext,NULL,10);return CTEDEC;}
{CONSTANTE_OCTAL}         {yylval.nro = strtol(yytext,NULL,8);return CTEOCT;}
{CONSTANTE_REAL}          {yylval.nrocoma = atof(yytext);return CTEREAL;}
{CONSTANTE_HEXADECIMAL}   {yylval.nro = strtol(yytext,NULL,16);return CTEHEX;}
{LITERAL_CADENA}          {return LITCAD;}
{CARACTER_SIMPLE}         {return CARACTER;}
{IDENTIFICADOR}           {yylval.cadena=yytext;return ID;}


"+"      {return '+';}
"-"      {return '-';}
"/"      {return '/';}
"*"      {return '*';}
"%"      {return '%';}
"&&"     {return AND;}
"||"     {return OR;}
">"      {return '>';}
">="     {return MAYORIGUAL;}
"<"      {return '<';}
"<="     {return MENORIGUAL;}
"=="     {return IGUALDAD;}
"!="     {return DESIGUALDAD;}
"++"     {return INCREMENTO;}
"--"     {return DECREMENTO;}
"->"     {return PUNTERO;}
"."      {return '.';}
"!"      {return '!';}
"*="     {return MULTIPLICAR;}
"/="     {return DIVIDIR;}
"+="     {return SUMAR;}
"-="     {return RESTAR;}
"%="     {return PORCENTAJE;}

{COMENTARIO_LINEA}
{COMENTARIO_MULTIPLE}

{SALTO_DE_LINEA} {}
%%

