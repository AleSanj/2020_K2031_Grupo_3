%option lex-compat
%option noyywrap
%option yylineno

%{
    #include "tpi.tab.h"
    #include <string.h>

    int numeroLinea = 1;
%}
COMENTARIO_LINEA "//".*
COMENTARIO_MULTIPLE \/\*(\*+[^\*\/]|[^\*])*\*+\/
LITERAL_CADENA \"[^\"]*\"
CARACTER_SIMPLE "'"."'"
TIPO_DATO "int"|"float"|"double"|"const"|"char"|"long"|"int*"|"float*"|"double*"|"const*"|"char*"|"long*"
CONSTANTE_DECIMAL [1-9][0-9]*
CONSTANTE_OCTAL 0[0-7]*
CONSTANTE_HEXADECIMAL 0[xX][0-9a-fA-F]+
CONSTANTE_REAL [1-9][0-9]*"."[0-9]*"E"?[\+\-]?[0-9]*
IDENTIFICADOR ([a-zA-Z]|_)([a-zA-Z]|[0-9]|_)*
NUMERO [0-9]
TIPO_FUNCION "void"|"void*"



%%

{COMENTARIO_LINEA}                     {}
{COMENTARIO_MULTIPLE}                  {}
{CARACTER_SIMPLE}                      {return CARACTER;}
{LITERAL_CADENA}                       {return LITCAD;}
{TIPO_DATO}                            {yylval.cadena=strdup(yytext); return TIPO_DE_DATO;}
{TIPO_FUNCION}                         {yylval.cadena=strdup(yytext); return TIPO_DE_FUNCION;}
"sizeof"                               {return SIZEOF;}
{CONSTANTE_DECIMAL}                    {yylval.nro =strtol(yytext,NULL,10);return CTEDEC;}
{CONSTANTE_OCTAL}                      {yylval.nro =strtol(yytext,NULL,8);return CTEOCT;}
{CONSTANTE_HEXADECIMAL}                {yylval.nro =strtol(yytext,NULL,16);return CTEHEX;}
{CONSTANTE_REAL}                       {yylval.nro =atof(yytext);return CTEREAL;}
"switch"                               {return SWITCH;}
"case"                                 {return CASE;}
"else"                                 {return ELSE;}
"break"                                {return BREAK;}
"default"                              {return DEFAULT;}
"return"                               {return RETURN;}
"if"                                   {return IF;}
"do"                                   {return DO;}
"for"                                  {return FOR;}
"while"                                {yylval.cadena = yytext;return WHILE;}
"struct"                               {return STRUCT;}
"union"                                {return UNION;}
"typedef"                              {return TYPEDEF;}

{IDENTIFICADOR}                        {yylval.cadena=strdup(yytext); return ID;}

      
"="                     {return '=';}
";"                     {return ';';}
"'"                     {return 39;}
","                     {return ',';}
":"                     {return ':';}
"+"                     {return '+';}
"-"                     {return '-';}
"/"                     {return '/';}
"*"                     {return '*';}
"&&"                    {return AND;}
"||"                    {return OR;}
">"                     {return '>';}
">="                    {return MAYORIGUAL;}
"<"                     {return '<';}
"<="                    {return MENORIGUAL;}
"=="                    {return IGUALDAD;}
"!="                    {return DISTINTO;}
"++"                    {return INCREMENTO;}
"!"                     {return '!';}
"+="                    {return SUMAR;}
"("                     {return 40;}
")"                     {return 41;}
"["                     {return '[';}
"]"                     {return ']';}
\{                      {return '{';}
\}                      {return '}';}
\n                      {return '\n';}
" "                     {}
\t                      {}
.                       {printf("ERROR LEXICO: %s, EN LINEA: %d \n",yytext,yylineno);}

%%



