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

 typedef struct listaParam{
    char*name_param;
    char*tipo_param;
    struct listaParam*sgte;
}SUBNODO;


 typedef struct Nodo {
    char* id;
    char varOfc;
    char* tipo;
    struct listaParam* param; 
    int linea;
    struct Nodo* sgte;
}NODO;

void insertarOrdenado(NODO** l, char* palabra,char*tipo,char varOfc,int linea);
NODO* CrearNodo(char*,char*,char,int);
void InsertarAlPpio(NODO** , char*,char*,char,int);
int VerificarSiEstaVacia(NODO*);
int EstaElElemento(NODO*, char*,char);
void agregarParametros(NODO**l,char* nombreFC,char*tipoFun,char*tipo_param,char*idparam);
NODO* buscar(NODO**l,char*nombreFC,char*tipoFun);
/*

void RecorrerListaVariables(NODO*); 
void RecorrerListaFunciones(NODO*); 
    
void insertarAlFinal(NODO**,char*,char*,int);
*/
NODO* listaVars = NULL;
NODO* listaFunciones = NULL;
char* tipoId;
char* tipoFun;
int flagTipo;
char*nombreFC;
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
;
idONo:                  /*vacio*/
                        |ID
;

funcionovar:             listaIds ';'
                        |funcion  
;

funcion:                ID '(' listaParametros ')' sentenciaComp {if (flagTipo){insertarOrdenado(&listaFunciones,$<cadena>1,tipoFun,'F',yylineno);} else{insertarOrdenado(&listaFunciones,$<cadena>1,tipoId,'F',yylineno);}}
                        |prototipo 

;
prototipo:              ID '(' listaParametros ')' ';' {nombreFC=$<cadena>1; if (flagTipo){insertarOrdenado(&listaFunciones,$<cadena>1,tipoFun,'F',yylineno);} else{insertarOrdenado(&listaFunciones,$<cadena>1,tipoId,'F',yylineno);}}
                       |ID '(' listaSoloTipos ')' ';' {nombreFC=$<cadena>1; if (flagTipo){insertarOrdenado(&listaFunciones,$<cadena>1,tipoFun,'F',yylineno);} else{insertarOrdenado(&listaFunciones,$<cadena>1,tipoId,'F',yylineno);}}
;
listaSoloTipos:         tipoDato ',' listaSoloTipos
                       | tipoDato
;
listaParametros:        /* vacio */
                        |parametroSuelto
                        |parametroSuelto ',' listaParametros
;

parametroSuelto:        TIPO_DE_DATO ID {agregarParametros(&listaFunciones,nombreFC,tipoFun,$<cadena>1,$<cadena>2);}
;
listaIds:                identificador  
                        |identificador ',' listaIds

;

identificador:           ID      {insertarOrdenado(&listaFunciones,$<cadena>1,tipoId,'V',yylineno);}    
                        |ID '=' expresionSelecc {insertarOrdenado(&listaFunciones,$<cadena>1,tipoId,'V',yylineno);}
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
    //      RecorrerListaVariables(listaVars);
      //    RecorrerListaFunciones(listaFunciones);
  fclose(yyin);
  return flag;
}

void insertarOrdenado(NODO** l, char* palabra,char*tipo,char varOfc,int linea){
        NODO* aux1 = *l;
        if (VerificarSiEstaVacia(aux1)){
            InsertarAlPpio(l,palabra,tipo,varOfc,linea);
        } else if (EstaElElemento(aux1,palabra,varOfc)==0) {
                printf("se hallo una doble declaracion de variables del identificador %s en la linea %d",palabra,linea);
            } else {
                    NODO* aux2 = aux1->sgte;
                    while(aux1->sgte != NULL && (strcasecmp(palabra,aux1->sgte->id)>0)) {
                        aux1 = aux1->sgte;
                        aux2 = aux2->sgte;
                    }
                    if (aux2==NULL) {
                        NODO* nuevo_nodo = NULL;
                        nuevo_nodo = CrearNodo(palabra,tipo,varOfc,linea);
                        aux1->sgte=nuevo_nodo;
                    } else {
                    NODO* nuevo_nodo = NULL;
                    nuevo_nodo = CrearNodo(palabra,tipo,varOfc,linea);
                    nuevo_nodo->sgte = aux2;
                    aux1->sgte = nuevo_nodo;
                    }
        }
         /*else {
            while (strcasecmp(aux1->id,palabra)!=0){
                aux1 = aux1->sgte;
            } aux1->cantidad++;
        }*/
}


NODO* CrearNodo(char* palabra,char* tipo,char varOfc,int linea) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    nuevo_nodo->id = strdup(palabra);
    nuevo_nodo->tipo = strdup(tipo);
    nuevo_nodo->varOfc = varOfc;
    nuevo_nodo->linea=linea;
    nuevo_nodo->sgte = NULL;    
}

void InsertarAlPpio(NODO** l, char* palabra,char* tipo,char varOfc,int linea){
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra,tipo,varOfc,linea);
    nuevo_nodo->sgte = *l;
    *l = nuevo_nodo;

}
int EstaElElemento(NODO*l, char* palabra,char varOfc){
    NODO* aux = l;
        do {
            if((strcmp(aux->id,palabra) == 0) && (aux->varOfc==varOfc)){
                return 1;
            } 
            aux = aux->sgte;
        } while (aux != NULL);
        
        return 0;
}


int VerificarSiEstaVacia(NODO* l){
    if (l == NULL){
    return 1;
    } else {
        return 0;
    }
    }

void agregarParametros(NODO**l,char* nombreFC,char*tipoFun,char*tipo_param,char*idparam){
    NODO* aux =buscar(l,nombreFC,tipoFun);
    if(aux!=NULL){
        while(aux->param!=NULL){
            aux->param=aux->param->sgte;
        }
            if(aux->param==NULL){
            aux->param->name_param=idparam;
            aux->param->tipo_param=tipo_param;
            aux->param->sgte=NULL;
        }        
    }    
} 

NODO* buscar(NODO**l,char*nombreFC,char*tipoFun){
    NODO*p=*l;
    while(p!=NULL && p->id<nombreFC){
        p=p->sgte;
    }
    if(p!=NULL && nombreFC==p->id && p->tipo==tipoFun){
        return p;
    }
    else return NULL;
}