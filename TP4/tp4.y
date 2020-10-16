%{
#include <stdio.h>
extern FILE* yyin;

    int yylex();
    int yyerror (char *s);
%}
%union {
char* cadena;
char car;
int nro;
float nrocoma;
}

%token <nro> CTEDEC   
%token <nro> CTEOCT
%token <nro> CTEHEX
%token <nrocoma> CTEREAL
%token <cadena> ID
%token <cadena> TIPO_DE_DATO
%token <cadena>  SIZEOF
%token <cadena> LITCAD AND OR MAYORIGUAL MENORIGUAL PORCENTAJE IGUALDAD DISTINTO INCREMENTO 
%token <cadena> PUNTERO MULTIPLICAR DIVIDIR SUMAR RESTAR
%token <car> CARACTER
%token <cadena> SWITCH
%token <cadena> CASE
%token <cadena> ELSE
%token <cadena> BREAK
%token <cadena> DEFAULT
%token <cadena> RETURN
%token <cadena> IF
%token <cadena> DO
%token <cadena> FOR
%token <cadena> WHILE
%%


input:      
            |input line
;
line:       '\n'
            |sentencia 
            |sentencia '\n' 


;
declaracion:  TIPO_DE_DATO listaIds {printf("se declaro una variable\n");} 
;
listaIds:     identificador
              |identificador ',' listaIds

;

identificador:    ID ';'
                  |ID '=' expresion {printf("Se le asigno una expresion correectamente \n");}
;

num:        CTEDEC
            |CTEOCT
            |CTEHEX
            |CTEREAL
;   
       
expresion: 		expAsignacion ';' {printf("se declaro una expresion\n");} 
;
expresionSelecc: expAsignacion {printf("se declaro una expresion\n");} 
;
expAsignacion:	expCondicional 
			          |expUnaria operAsignacion expAsignacion 
;
operAsignacion: '='
                |SUMAR
;
expCondicional: expOr 
;
expOr:          expAnd 
 		            |expOr OR expAnd
;
expAnd:         expIgualdad 
                |expAnd AND expIgualdad
;
expIgualdad:  	expRelacional 
		 	          |expIgualdad IGUALDAD expRelacional
		    	      |expIgualdad DISTINTO expRelacional
;                
expRelacional:	expAditiva 
		       	    |expRelacional MAYORIGUAL expAditiva
		       	    |expRelacional '>' expAditiva
		       	    |expRelacional MENORIGUAL expAditiva
		       	    |expRelacional '<' expAditiva

;
expAditiva:    	expMultiplicativa 
                |expAditiva '+' expMultiplicativa
                |expAditiva '-' expMultiplicativa
;
expMultiplicativa: 	expUnaria 
                    |expMultiplicativa '*' expUnaria
                    |expMultiplicativa '/' expUnaria
;
expUnaria:        	expPostfijo 
                    |INCREMENTO expUnaria 
                    |operUnario expUnaria 
                    |SIZEOF'('TIPO_DE_DATO')'
;
operUnario: 	'&' 
              |'*' 
              |'–' 
              |'!'
;
expPostfijo:	      expPrimaria 
                    |expPostfijo '[' expresion ']' 
                    |expPostfijo '(' listaArgumentos ')' 
                    |expPostfijo '(' ')' 
;
listaArgumentos:	  expAsignacion 
	           		    |listaArgumentos ',' expAsignacion
;
                    
expPrimaria:	ID
		          |num 
		          |LITCAD 
		          |'(' expresion')'
;
sentencia:      /* vacio */
                |';' {printf("hay una sentencia vacia\n");} 
                |expresion
                |declaracion
                |sentenciaComp
                |sentenciaSeleccion {printf("se hallo una sentencia de seleccion \n");}
                |sentenciaIteracion {printf("se hallo una sentencia de iteracion\n");}
                |sentenciaCorte
;

sentenciaComp:   '{' listaSentencias '}' {printf("hay una sentencia vsimple\n");}
;
listaSentencias:      sentencia
                      |listaSentencias sentencia
;
sentenciaSeleccion:   IF '(' expresionSelecc ')' sentenciaComp
                      |IF '(' expresionSelecc ')' sentenciaComp ELSE sentenciaComp
                      |SWITCH '(' expresionSelecc ')' '{' sentenciaEtiquetada '}'
                      |SWITCH '(' expresionSelecc ')' '{' sentenciaEtiquetada sentenciaCorte '}'
;
sentenciaEtiquetada:  CASE expresionSelecc ':' sentencia
                    | DEFAULT ':' sentencia
                    | ID ':' sentencia
;

sentenciaCorte:     BREAK ';'
                    |RETURN ';'
                    |RETURN expresion

;
sentenciaIteracion:   WHILE '(' expresionSelecc ')' sentenciaComp 
                    | DO sentenciaComp WHILE '(' expresionSelecc ')' ';'
                    | FOR '(' expresionSelecc ';' expresionSelecc ';' expresionSelecc ')' sentenciaComp
                    | FOR '('  ';'  ';'  ')' sentenciaComp
;




%%

int main ()
{

  int flag;
  yyin=fopen("entrada.c","r");

  // printf("Declare su sentencia: \n");
  flag=yyparse();
  fclose(yyin);
  return flag;
}


