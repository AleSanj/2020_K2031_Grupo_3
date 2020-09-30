//seccion de definiciones
%{

#include<stdio.h>
%}

%union {
char* cadena;
char car;
int nro;
float nrocoma;
}

%token <nro> CTEDEC CTEOCT CTEHEX 
%token <nrocoma> CTEREAL
%token <cadena>  BREAK CASE CHAR CONST DEFAULT DO DOUBLE ELSE ENUM FLOAT FOR IF INT LONG RETURN 
%token <cadena> SHORT SIGNED SIZEOF STRUCT SWITCH TYPEDEF UNION UNSIGNED VOID WHILE
%token <cadena> LITCAD ID AND OR MAYORIGUAL MENORIGUAL IGUALDAD DESIGUALDAD INCREMENTO DECREMENTO 
%token <cadena> PUNTERO MULTIPLICAR DIVIDIR SUMAR RESTAR
%token <car> CARACTER

//seccion reglas
%% 


%%

//seccion funciones de usuario










