%option noyywrap

%{
    #include <stdio.h>
%}
%{ 
    // no quedo bien "/""*".*"*""/"  {printf("Encontre el comentario compuesto : %s \n",yytext);}
%}

PALABRAS_RESERVADAS auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|return|short|signed|sizeof|static|struct|typedef|union|unsigned|void|volatile|while
LETRA [a-z][A-Z]
CARACTER_DE_PUNTUACION "("|")"|"["|"]"|"{"|"}"|"*"|","|":"|"="|";"|"..."|"#"
CONSTANTE_DECIMAL [1-9][0-9]*
CONSTANTE_OCTAL 0[0-7]*
CONSTANTE_HEXADECIMAL 0[xX][0-9a-fA-F]+
LITERAL_CADENA \".*\"
CARACTER_SIMPLE "`"."`"

OPERADORES_ARITMETICOS "+"|"-"|"/"|"*"|"%"
OPERADORES_LOGICOS "&&"|"||"|"¬"
OPERADORES_RELACIONALES ">"|">="|"<"|"<="|"=="|"!="

OPERADOR OPERADORES_ARITMETICOS|OPERADORES_LOGICOS|OPERADORES_RELACIONALES

NUMERO CONSTANTE_DECIMAL|CONSTANTE_HEXADECIMAL|CONSTANTE_OCTAL

%%
"//".*$ {printf("Encontre el comentario simple : %s \n",yytext);}


{CONSTANTE_DECIMAL} {printf("Encontre una constante decimal : %s \n" , yytext);}
{CONSTANTE_OCTAL} {printf("Encontre una constante octal : %s \n" , yytext);}
{CONSTANTE_HEXADECIMAL} {printf("Encontre una constante hexadecimal : %s \n" , yytext);}
{LITERAL_CADENA} {printf("Se encontre el literal cadena: %s \n", yytext);}
{PALABRAS_RESERVADAS} {printf("encontre una palabra reservada : %s \n", yytext);}
{CARACTER_SIMPLE} {printf("encontre el caracter: %s \n", yytext);}
({LETRA}|"_")({LETRA}|{NUMERO}|"_")* {printf("encontre un identificador: %s \n", yytext);}
{CARACTER_DE_PUNTUACION} {printf("encontre el caracter de puntuacion: %s \n", yytext);}
{OPERADOR}/{NUMERO} {printf("encontre el operador: %s \n", yytext);}


%%

int main(){

    yyin = fopen("entrada.c" , "r");
    yyout = fopen("salida.c" , "w");
    yylex();

    return 0;
}