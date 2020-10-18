%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern FILE* yyin;
extern int yylineno;

int yylex();
void yyerror (char *s){
    printf("ERROR SINTACTICO EN LA LINEA: %d",yylineno);
}

%}
%union {
    char* cadena;
    char car;
    int nro;
    float nrocoma;
}

%{
 typedef struct Nodo {
    char* Palabra;
    char* Tipo;
    int Linea; 
    struct Nodo* sgte;
}NODO;


NODO* CrearNodo(char*,char*,int);
void RecorrerListaVariables(NODO*); 
void RecorrerListaFunciones(NODO*); 
int VerificarSiEstaVacia(NODO*);    
int EstaElElemento(NODO*, char*,char*);
void InsertarAlPpio(NODO** , char*,char*,int);
void insertarAlFinal(NODO**,char*,char*,int);

NODO* listaVars = NULL;
NODO* listaFunciones = NULL;
char* tipoId;
char* tipoFun;
int flagTipo;
%}

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
%token <cadena> VOID
%token <cadena> TIPO_DE_FUNCION
%token STRUCT UNION
%token TYPEDEF

%type <cadena> identificador
%type <cadena> listaIds
%type <cadena> tipoDato
%type <cadena> sentenciaSeleccion

%%


input:      
                        |input line
;
line:                   '\n'
                        |sentencia 
                        |sentencia '\n'
            
;


declaracion:             tipoDato funcionovar
                        |tipoFuncion funcion
                        |TYPEDEF struct 
                        |struct
;

struct:            structOunion ID'{' TIPO_DE_DATO muchosIds ';' masDeclaraciones '}' idONo ';' { printf( "se declaro un strcut en la linea: %d\n",yylineno);}
;     

muchosIds:          ID
                    |ID ',' muchosIds
;

masDeclaraciones:   /*vacio*/
                    |TIPO_DE_DATO muchosIds ';' masDeclaraciones
;
structOunion:       STRUCT
                    |UNION

idONo:                  /*vacio*/
                        |ID
;

funcionovar:             listaIds ';'
                        |funcion  
;
funcion:                ID '(' listaParametros ')' sentenciaComp {if (flagTipo){insertarAlFinal(&listaFunciones,$<cadena>1,tipoFun,yylineno);} else{insertarAlFinal(&listaFunciones,$<cadena>1,tipoId,yylineno);}}
                        |prototipo 

;
prototipo:              ID '(' listaParametros ')' ';' {if (flagTipo){insertarAlFinal(&listaFunciones,$<cadena>1,tipoFun,yylineno);} else{insertarAlFinal(&listaFunciones,$<cadena>1,tipoId,yylineno);}}
                       |ID '(' listaSoloTipos ')' ';' {if (flagTipo){insertarAlFinal(&listaFunciones,$<cadena>1,tipoFun,yylineno);} else{insertarAlFinal(&listaFunciones,$<cadena>1,tipoId,yylineno);}}
;
listaSoloTipos:         tipoDato ',' listaSoloTipos
                       | tipoDato
;
listaParametros:        /* vacio */
                        |parametroSuelto
                        |parametroSuelto',' listaParametros
;

parametroSuelto:        TIPO_DE_DATO ID
;
listaIds:                identificador  
                        |identificador ',' listaIds

;

identificador:           ID      {insertarAlFinal(&listaVars,$<cadena>1,tipoId,yylineno);}    
                        |ID '=' expresionSelecc {insertarAlFinal(&listaVars,$<cadena>1,tipoId,yylineno);}
;

tipoDato:                TIPO_DE_DATO {tipoId = $<cadena>1; flagTipo=0;}
                        |TIPO_DE_DATO '*' {tipoId = strcat($<cadena>1,"*"); flagTipo=0;}
;                                                                       
tipoFuncion:             TIPO_DE_FUNCION {tipoFun = $<cadena>1;flagTipo=1; /*El flag nos dice si es de algun tipo escpecial de funcion (void por ejemplo) o no */}
;
num:         CTEDEC      
            |CTEOCT
            |CTEHEX
            |CTEREAL
            |CARACTER
;   
       
expresion: 		expAsignacion ';' {} 
;
expresionSelecc: expAsignacion {} 
;
expAsignacion:	       expCondicional 
			          |expUnaria operAsignacion expAsignacion 
;
operAsignacion: '='
                |SUMAR
;
expCondicional: expOr 
;
expOr:               expAnd 
 		            |expOr OR expAnd
;
expAnd:         expIgualdad 
                |expAnd AND expIgualdad
;
expIgualdad:  	       expRelacional 
		 	          |expIgualdad IGUALDAD expRelacional
		    	      |expIgualdad DISTINTO expRelacional
;                
expRelacional:	     expAditiva 
		       	    |expRelacional MAYORIGUAL expAditiva
		       	    |expRelacional '>' expAditiva
		       	    |expRelacional MENORIGUAL expAditiva
		       	    |expRelacional '<' expAditiva

;
expAditiva:    	 expMultiplicativa 
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
                    |SIZEOF'('tipoDato')'
;
operUnario:     '&' 
                |'*' 
                |'–' 
                |'!'
;
expPostfijo:	      expPrimaria 
                    |expPostfijo '[' expresion ']' 
                    |expPostfijo '(' listaArgumentos ')' 
                    |expPostfijo '(' ')' 
;
listaArgumentos:    	 expAsignacion 
	           		    |listaArgumentos ',' expAsignacion
;
                    
expPrimaria:	   ID
		          |num 
		          |LITCAD 
		          |'(' expresion')'
;
sentencia:      /* vacio */
                |';' 
                |expresion
                |declaracion
                |sentenciaComp
                |sentenciaSeleccion 
                |sentenciaIteracion 
                |sentenciaCorte
                
                
;

sentenciaComp:   '{' listaSentencias '}' 
;
listaSentencias:      sentencia
                      |listaSentencias sentencia
;
sentenciaSeleccion:    IF {printf("se encontro una sentencia IF en la linea : %d \n",yylineno);} '(' expresionSelecc ')' sentenciaComp sentenciaElse 
                       |SWITCH {printf("se encontro una sentencia SWITCH en la linea : %d \n", yylineno);} '(' expresionSelecc ')' sentenciaDelSwitch 
;

sentenciaDelSwitch:     '{' sentenciaEtiquetada '}'
;
sentenciaElse:         /*vacio*/
                       |ELSE sentenciaComp 

;
sentenciaEtiquetada:    CASE expresionSelecc ':' sentencia sentenciaEtiquetada sentenciaCorte
                        |ID expresionSelecc ':' sentencia sentenciaEtiquetada sentenciaCorte
                        |DEFAULT ':' sentencia sentenciaCorte
;                        
sentenciaCorte:     /*vacio*/
                    |BREAK ';'
                    |RETURN ';'
                    |RETURN expresion

;
sentenciaIteracion:   WHILE {printf("se encontro una sentencia WHILE en la linea : %d \n", yylineno);} '(' expresionSelecc ')' sentenciaComp 
                    | DO  {printf("se encontro una sentencia DO WHILE en la linea : %d \n", yylineno);} sentenciaComp WHILE '(' expresionSelecc ')' ';' 
                    | FOR {printf("se encontro una sentencia FOR en la linea : %d \n", yylineno);} sentenciaFor 
;
sentenciaFor:       '(' expresionSelecc ';' expresionSelecc ';' expresionSelecc ')' sentenciaComp
                    |'('  ';'  ';'  ')' sentenciaComp



%%

int main ()
{

  int flag;
  yyin=fopen("entrada.c","r");
  flag=yyparse();
          printf("\n");
          RecorrerListaVariables(listaVars);
          RecorrerListaFunciones(listaFunciones);
  fclose(yyin);
  return flag;
}

NODO* CrearNodo(char* palabra,char* tipo,int linea) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    nuevo_nodo->Palabra = strdup(palabra);
    nuevo_nodo->Tipo = strdup(tipo);
    nuevo_nodo->Linea = linea;
    nuevo_nodo->sgte = NULL;    
}


int VerificarSiEstaVacia(NODO* l){
    if (l == NULL){
    return 1;
    } else {
        return 0;
    }
    }
void InsertarAlPpio(NODO** l, char* palabra,char* tipo,int linea){
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra,tipo,linea);
    nuevo_nodo->sgte = *l;
    *l = nuevo_nodo;

}
void insertarAlFinal(NODO** l,char* palabra,char* tipo,int linea){
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra,tipo,linea);
    NODO* aux1 = *l;
    if (aux1 != NULL){

    while(aux1->sgte != NULL ){
        aux1 = aux1->sgte;
    }
    nuevo_nodo -> sgte = aux1->sgte;
    aux1 ->sgte = nuevo_nodo;
    } else {
        InsertarAlPpio(l,palabra,tipo,linea);
    }
}

int EstaElElemento(NODO*l, char* palabra,char* tipo){
    NODO* aux = l;
        do {
            if((strcmp(aux->Palabra,palabra) == 0) && (strcmp(aux->Tipo,tipo)== 0)){
                return 1;
            } 
            aux = aux->sgte;
        } while (aux != NULL);
        
        return 0;
}

void RecorrerListaVariables(NODO *l) {
    NODO *aux = l;
    printf("---- LISTA DE VARIABLES ----\n");
    while (aux != NULL) {
        printf("se declaro la variable \"%s\", de tipo %s, en la linea: %d \n",aux->Palabra,aux->Tipo,aux->Linea);
        aux = aux->sgte; 
    }
}
void RecorrerListaFunciones(NODO *l) {
    NODO *aux = l;
    printf("---- LISTA DE FUNCIONES ----\n");
    while (aux != NULL) {
        printf("se declaro la funcion \"%s\", de tipo %s, en la linea: %d \n",aux->Palabra,aux->Tipo,aux->Linea);
        aux = aux->sgte; 
    }
}

