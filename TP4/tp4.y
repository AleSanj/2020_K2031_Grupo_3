%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
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

%{
 typedef struct Nodo {
    char* Palabra;
    char* Tipo;
    int cantidad; 
    struct Nodo* sgte;
}NODO;


NODO* CrearNodo(char*,char*);
void RecorrerListaIdentificadores(NODO*); 
void RecorrerListaFunciones(NODO*); 
int VerificarSiEstaVacia(NODO*);    
int EstaElElemento(NODO*, char*,char*);
void InsertarAlPpio(NODO** , char*,char*);
void insertarSinRepetir(NODO**, char*,char*);
void insertarIdentOrdenado(NODO**, char*,char*);
void insertarAlFinal(NODO**,char*,char*);

NODO* listaIdentificadores = NULL;
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
%type <cadena> identificador
%type <cadena> listaIds
%type <cadena> tipoDato
%%


input:      
            |input line
;
line:       '\n'
            |sentencia 
            |sentencia '\n'
;


declaracion:            tipoDato funcionovar
                        |tipoFuncion funcion
;
funcionovar:            listaIds ';'
                        |funcion  
;
funcion:                ID '(' listaParametros ')' sentenciaComp {if (flagTipo){insertarIdentOrdenado(&listaFunciones,$<cadena>1,tipoFun);} else{insertarIdentOrdenado(&listaFunciones,$<cadena>1,tipoId);}}
;
listaParametros:        /* vacio */
                        |parametroSuelto
                        |parametroSuelto',' listaParametros
;

parametroSuelto:        TIPO_DE_DATO ID
;
listaIds:     identificador  
              |identificador ',' listaIds

;

identificador:    ID      {insertarIdentOrdenado(&listaIdentificadores,$<cadena>1,tipoId);};    
                  |ID '=' expresionSelecc {insertarIdentOrdenado(&listaIdentificadores,$<cadena>1,tipoId);}
;

tipoDato:   TIPO_DE_DATO {tipoId = $<cadena>1; flagTipo=0;}
;                                                                       
tipoFuncion: TIPO_DE_FUNCION {tipoFun = $<cadena>1;flagTipo=1; /*El flag nos dice si es de algun tipo escpecial de funcion (void por ejemplo) o no */}
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
  flag=yyparse();
          printf("\n");
          RecorrerListaIdentificadores(listaIdentificadores);
          RecorrerListaFunciones(listaFunciones);
  fclose(yyin);
  return flag;
}

NODO* CrearNodo(char* palabra,char* tipo) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    nuevo_nodo->Palabra = strdup(palabra);
    nuevo_nodo->Tipo = strdup(tipo);
    nuevo_nodo->cantidad = 1;
    nuevo_nodo->sgte = NULL;    
}


int VerificarSiEstaVacia(NODO* l){
    if (l == NULL){
    return 1;
    } else {
        return 0;
    }
    }
void InsertarAlPpio(NODO** l, char* palabra,char* tipo){
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra,tipo);
    nuevo_nodo->sgte = *l;
    *l = nuevo_nodo;

}
void insertarSinRepetir(NODO** l,char* palabra, char* tipo) {
        NODO* aux1 = *l;
        if (VerificarSiEstaVacia(aux1)){
                InsertarAlPpio(l,palabra,tipo);
        } else if (EstaElElemento(aux1,palabra,tipo)==0) {
                InsertarAlPpio(l,palabra,tipo);

        } else {
                while (aux1 != NULL){
                        if (strcmp(aux1->Palabra,palabra)==0){
                                if(strcmp(aux1->Tipo,tipo)==0){
                                        aux1->cantidad++;
                                        break;
                                }
                        }
                        aux1=aux1->sgte;
                }
        }

}
void insertarIdentOrdenado(NODO** l, char* palabra,char* tipo){
        NODO* aux1 = *l;
        if (VerificarSiEstaVacia(aux1)){
            InsertarAlPpio(l,palabra,tipo);
        } else if (EstaElElemento(aux1,palabra,tipo)==0) {
                if(strcasecmp(palabra,aux1->Palabra)<0) {
                InsertarAlPpio(l,palabra,tipo);
            } else {
                    NODO* aux2 = aux1->sgte;
                    while(aux1->sgte != NULL && (strcasecmp(palabra,aux1->sgte->Palabra)>0)) {
                        aux1 = aux1->sgte;
                        aux2 = aux2->sgte;
                    }
                    if (aux2==NULL) {
                        NODO* nuevo_nodo = NULL;
                        nuevo_nodo = CrearNodo(palabra,tipo);
                        aux1->sgte=nuevo_nodo;
                    } else {
                    NODO* nuevo_nodo = NULL;
                    nuevo_nodo = CrearNodo(palabra,tipo);
                    nuevo_nodo->sgte = aux2;
                    aux1->sgte = nuevo_nodo;
                    }
        }
        } else {
            while (aux1 != NULL){
                        if (strcasecmp(aux1->Palabra,palabra)==0){
                                if(strcmp(aux1->Tipo,tipo)==0){
                                        aux1->cantidad++;
                                        break;
                                }
                        }
                        aux1=aux1->sgte;
                }
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

void RecorrerListaIdentificadores(NODO *l) {
    NODO *aux = l;
    printf("---- LISTA DE IDENTIFICADORES ----\n");
    while (aux != NULL) {
        printf("se declaro la variable \"%s\", de tipo %s, y aparece: %d veces\n",aux->Palabra,aux->Tipo,aux->cantidad);
        aux = aux->sgte; 
    }
}
void RecorrerListaFunciones(NODO *l) {
    NODO *aux = l;
    printf("---- LISTA DE FUNCIONES ----\n");
    while (aux != NULL) {
        printf("se declaro la funcion \"%s\", de tipo %s, y aparece: %d veces\n",aux->Palabra,aux->Tipo,aux->cantidad);
        aux = aux->sgte; 
    }
}


