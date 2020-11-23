%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern FILE* yyin;
extern int yylineno;

int yylex();
void yyerror (char *s){
    printf("ERROR SINTACTICO EN LA LINEA: %d \n",yylineno);
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

typedef struct ListaDeListas{
    NODO* Parametros;
    char* TipoFuncion;
    char* NombreFuncion;
    struct ListaDeListas* sgte;

}LISTADELISTAS;


NODO* CrearNodo(char*,char*,int);
void RecorrerListaVariables(NODO*); 
void RecorrerListaFunciones(NODO*); 
int VerificarSiEstaVacia(NODO*);    
int EstaLaVar(NODO*, char*);
int EstaElElemento(NODO*, char*,char*);
void InsertarAlPpio(NODO** , char*,char*,int);
void insertarAlFinal(NODO**,char*,char*,int);


void recorrerLL(LISTADELISTAS*l);
LISTADELISTAS* CrearNodoLL(NODO*,char*,char*);
void insertarAlFinalLL(LISTADELISTAS**,NODO*, char*, char*);
void RecorrerListaParametros(NODO*);
int CantidadDeNodos(NODO*);
int EstaLaFun(LISTADELISTAS*, char*);
char* tipoDeDatoLaEstructura(char* ,NODO*, char*,LISTADELISTAS*);
int cantidadParametros(LISTADELISTAS*, char*);
void compararParametros(LISTADELISTAS*, char*,NODO*);

NODO* listaVars = NULL;
LISTADELISTAS* listaFunciones = NULL;
NODO* listaParametros2 = NULL;
char* tipoId;
char* tipoFun;

int flagTipo;
int contadorParametros;
char* buscarFuncion;
NODO* acumuladorParametros;

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

sentencia:      /* vacio */
                |';' 
                |declaracion
                |sentenciaComp
                |sentenciaSeleccion 
                |sentenciaIteracion 
                |sentenciaCorte
                |expresion
                |error corte
                
                
;

corte:          ';'
                |'\n'
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
;
idONo:                  /*vacio*/
                        |ID
;

funcionovar:             listaIds ';'
                        |funcion  
;
funcion:                ID '(' listaParametros ')' sentenciaComp {if (flagTipo){insertarAlFinalLL(&listaFunciones,listaParametros2,tipoFun, $<cadena>1);} else { insertarAlFinalLL(&listaFunciones,listaParametros2,tipoId, $<cadena>1);listaParametros2=NULL;}}
                        |prototipo 

;
prototipo:              ID '(' listaParametros ')' ';' {if (flagTipo){insertarAlFinalLL(&listaFunciones,listaParametros2,tipoFun, $<cadena>1);} else { insertarAlFinalLL(&listaFunciones,listaParametros2,tipoId, $<cadena>1);listaParametros2=NULL;}}
;
listaParametros:        /* vacio */
                        |parametroSuelto
                        |parametroSuelto',' listaParametros
;

parametroSuelto:        TIPO_DE_DATO idONo     {insertarAlFinal(&listaParametros2,"sin parametro",$<cadena>1,1);}
;
listaIds:                identificador  
                        |identificador ',' listaIds

;

identificador:           ID      { if(EstaLaVar(listaVars,$<cadena>1)) {printf("ERROR SEMANTICO: DOBLE DECLARACION DE LA VARIABLE: %s, en la linea:  %d",$<cadena>1,yylineno);} else {insertarAlFinal(&listaVars,$<cadena>1,tipoId,yylineno);} }    
                        |ID '=' expresionSelecc { if(EstaLaVar(listaVars,$<cadena>1)) {printf("ERROR SEMANTICO: DOBLE DECLARACION DE LA VARIABLE: %s, en la linea: %d",$<cadena>1,yylineno);exit(1);} else {insertarAlFinal(&listaVars,$<cadena>1,tipoId,yylineno);} }
;

tipoDato:                TIPO_DE_DATO {tipoId = $<cadena>1; flagTipo=0;}
;                                                                       
tipoFuncion:             TIPO_DE_FUNCION {tipoFun = $<cadena>1;flagTipo=1; /*El flag nos dice si es de algun tipo escpecial de funcion (void por ejemplo) o no */}
;
num:         CTEDEC      
            |CTEOCT
            |CTEHEX
            |CTEREAL
            |CARACTER
;   
       
expresion: 		expAsignacion ';' {printf("ENCONTRE UNA EXPRESION\n");}
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
expMultiplicativa: 	 expUnaria                                   {printf("wa:%s \n",$<cadena>1);}
                    |expMultiplicativa '*' expUnaria             {printf("1:%s y 3:%s \n",$<cadena>1,$<cadena>3);if(strcmp(tipoDeDatoLaEstructura($<cadena>1,listaVars, NULL,NULL),tipoDeDatoLaEstructura($<cadena>3,listaVars,NULL,NULL))==0){}else {printf("ERROR SEMANTICO: LOS TIPOS SON INCOMPATIBLES en la linea %d\n", yylineno);}}
                    |expMultiplicativa '/' expUnaria               
;
expUnaria:        	expPostfijo                                  {$<cadena>$ = $<cadena>1;}
                    |INCREMENTO expUnaria 
                    |operUnario expUnaria 
                    |SIZEOF'('TIPO_DE_DATO')'
;
operUnario:     '&' 
                |'*' 
                |'–' 
                |'!'
;
expPostfijo:	     expPrimaria                {$<cadena>$ = $<cadena>1;}
                    |ID '[' expresionSelecc ']' 
                    |ID {buscarFuncion= $<cadena>1;} '(' listaArgumentos ')' validacionCantidadParametros {if(EstaLaFun(listaFunciones,$<cadena>1)==0){printf("ERROR, La funcion %s NO esta declarada\n",$<cadena>1);}else {contadorParametros=0;}}
                    |ID {buscarFuncion= $<cadena>1;} '(' ')' validacionCantidadParametros                 {if(EstaLaFun(listaFunciones,$<cadena>1)==0){printf("ERROR, La funcion %s NO esta declarada\n",$<cadena>1);}else {contadorParametros=0;}}
;
listaArgumentos:    	 expPrimaria                            {contadorParametros++;InsertarAlPpio(&acumuladorParametros,"nada",tipoDeDatoLaEstructura($<cadena>1,listaVars,NULL,NULL),1);}
	           		    |listaArgumentos ',' expPrimaria        {contadorParametros++;insertarAlFinal(&acumuladorParametros,"nada",tipoDeDatoLaEstructura($<cadena>3,listaVars,NULL,NULL),1);} 
;
validacionCantidadParametros:         /*vacio*/                 {if(contadorParametros != cantidadParametros(listaFunciones,buscarFuncion) ){ printf("ERROR SEMANTICO: PROBLEMA CON LA CANTIDAD DE PARAMETROS\n");} else if(contadorParametros!=0) {compararParametros(listaFunciones,buscarFuncion,acumuladorParametros);} acumuladorParametros = NULL;}  
;
                    
expPrimaria:	   ID                                           {if(EstaLaVar(listaVars,$<cadena>1)==0){printf("ERROR, La variable %s NO esta declarada\n",$<cadena>1); $<cadena>$ = $<cadena>1;}}
		          |num                                          {}
		          |LITCAD
		          |'(' expresionSelecc')'
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
          recorrerLL(listaFunciones);
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

LISTADELISTAS* CrearNodoLL(NODO* lista, char* tipoFuncion, char* nombreFuncion){
    LISTADELISTAS* nuevo_nodo = NULL;
    nuevo_nodo = (LISTADELISTAS*) malloc(sizeof(LISTADELISTAS));
    nuevo_nodo->Parametros= lista;
    nuevo_nodo->TipoFuncion = tipoFuncion;
    nuevo_nodo->NombreFuncion = nombreFuncion;
    nuevo_nodo->sgte = NULL;   

}
void insertarAlFinalLL(LISTADELISTAS** ldel,NODO* lista ,char* tipoFuncion, char* nombreFuncion){
    LISTADELISTAS* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodoLL(lista,tipoFuncion,nombreFuncion);
    LISTADELISTAS* aux1 =*ldel;
    if (*ldel==NULL) {
        nuevo_nodo->sgte=NULL;
        *ldel=nuevo_nodo;

    } else {

        while(aux1->sgte != NULL) {
            aux1=aux1->sgte;
        }

        nuevo_nodo->sgte=NULL;
        aux1->sgte=nuevo_nodo;

    }

}


void recorrerLL(LISTADELISTAS*l) {
        LISTADELISTAS*aux1 = l;
        printf("\n----LISTA DE FUNCIONES---- \n");
        while (aux1 != NULL) {     
        printf("\nNOMBRE DE LA FUNCION: %s \n",aux1->NombreFuncion);
        printf("VALOR QUE RETORNA: %s \n",aux1->TipoFuncion);    
        RecorrerListaParametros(aux1->Parametros);
         
        aux1 = aux1->sgte; 
    }
}


void RecorrerListaParametros(NODO *l) {
    NODO *aux = l;
    printf("Cantidad de parametros: %d\n",CantidadDeNodos(aux));

    while (aux != NULL) {
        printf("%s\n",aux->Tipo);
        aux = aux->sgte; 
    }
}
int cantidadParametros (LISTADELISTAS*l, char* funcion){
    LISTADELISTAS* aux = l;
    while(aux != NULL){
        if(strcmp(funcion,aux->NombreFuncion)==0){
            return (CantidadDeNodos(aux->Parametros));
        }
        aux= aux->sgte;
    }
}

int CantidadDeNodos(NODO*l){
    int cantidad = 0;
    NODO* aux = l;
    while (aux != NULL) {
        cantidad++;
        aux = aux->sgte; 
    }
    return cantidad;

}

char* tipoDeDatoLaEstructura(char* Variable,NODO*listaV, char* Funcion,LISTADELISTAS* listaF){
        if (Variable != NULL) {
            NODO* aux = listaV;
            while(aux!= NULL ){
                if(strcmp(aux->Palabra,Variable) == 0) {
                    return (aux->Tipo);
                }
                aux = aux->sgte;

            }
        } else {
            LISTADELISTAS* aux = listaF;

            while(aux != NULL ){
                if(strcmp(aux->NombreFuncion,Funcion) == 0) {
                    return (aux->TipoFuncion);
                }
                aux = aux->sgte;

            }


        }

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

int EstaLaVar(NODO*l, char* palabra){
    NODO* aux = l;
        if (VerificarSiEstaVacia(aux)){
            return 0;
        } else {
        do {
            if(strcmp(aux->Palabra,palabra) == 0){
                return 1;
            } else {
            aux = aux->sgte; }
        } while (aux != NULL);
        
        return 0;
        }
}

void compararParametros(LISTADELISTAS* l, char* funcion,NODO* listaAComparar){
    LISTADELISTAS* aux1 = l;
    int flag;
    while(aux1 != NULL) {
        if(strcmp(funcion,aux1->NombreFuncion)==0) {
            NODO* aux2 = listaAComparar;
            NODO* aux3 = aux1->Parametros;
            while(aux2 != NULL) {
                if(strcmp(aux2->Tipo,aux3->Tipo)==0){
                    flag = 1;
                    
                } else{ 
                    flag = 0;
                    printf("ERROR SEMANTICO: SE ESPERABA UN PARAMETRO DE TIPO %s\n",aux3->Tipo);
                    break;
                    
                }
                
                aux2= aux2->sgte;
                aux3= aux3->sgte;
            }
        }
        aux1= aux1->sgte;
    }

}

int EstaLaFun(LISTADELISTAS*l, char* palabra){
    LISTADELISTAS* aux = l;
        if (aux== NULL) {
            return 0;
        } else {
                do {
                if(strcmp(aux->NombreFuncion,palabra) == 0){
                    return 1;
                } else {
                aux = aux->sgte; }
            } while (aux != NULL);
        } 
        
        return 0;
        
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





