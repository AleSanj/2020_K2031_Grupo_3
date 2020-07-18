%option noyywrap

%{
    #include <stdio.h>
%}


PALABRAS_RESERVADAS auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
CARACTER_DE_PUNTUACION "("|")"|"["|"]"|"{"|"}"|"*"|","|":"|"="|";"|"..."|"#"
CONSTANTE_DECIMAL [1-9][0-9]*
CONSTANTE_OCTAL 0[0-7]*
CONSTANTE_HEXADECIMAL 0[xX][0-9a-fA-F]+
CONSTANTE_REAL [1-9][0-9]*"."[0-9]*"E"?[\+\-]?[0-9]*
LITERAL_CADENA \".*\"
CARACTER_SIMPLE "'"."'"
IDENTIFICADOR ([a-zA-Z]|_)([a-zA-Z]|[0-9]|_)*
OPERADOR "+"|"-"|"/"|"*"|"%"|"&&"|"||"|"¬"|">"|">="|"<"|"<="|"=="|"!="
NUMERO [0-9]
DIRECTIVAALPRECOMPILADOR "#"(define|elif|else|endif|error|if|ifdef|ifndef|include|message|undef)
COMENTARIOS ("//".*)|("/*"(\n|.)*"*/")

%%
{COMENTARIOS} {printf("Encontre el comentario : %s \n",yytext);}
{CONSTANTE_DECIMAL} {printf("Encontre una constante decimal : %s \n" , yytext);}
{CONSTANTE_OCTAL} {printf("Encontre una constante octal : %s \n" , yytext);}
{CONSTANTE_HEXADECIMAL} {printf("Encontre una constante hexadecimal : %s \n" , yytext);}
{CONSTANTE_REAL} {printf("Encontre una constante real : %s\n",yytext);}
{LITERAL_CADENA} {printf("Se encontre el literal cadena: %s \n", yytext);}
{PALABRAS_RESERVADAS} {printf("encontre una palabra reservada : %s \n", yytext);}
{CARACTER_SIMPLE} {printf("encontre el caracter: %s \n", yytext);}
{IDENTIFICADOR} {printf("encontre un identificador: %s \n", yytext);}
{DIRECTIVAALPRECOMPILADOR} {printf("Encontre la directiva al precompilador: %s \n ",yytext);}
{CARACTER_DE_PUNTUACION} {printf("encontre el caracter de puntuacion: %s \n", yytext);}
{OPERADOR}/{NUMERO} {printf("encontre el operador: %s \n", yytext);}

%%


int main(){

    yyin = fopen("entrada.c" , "r");
    yyout = fopen("salida.c" , "w");
    yylex();

 
    

    return 0;
}
