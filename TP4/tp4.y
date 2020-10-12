%{

#include<stdio.h>
#include <string.h>

extern FILE* yyin;
char* sentencia;
int yylex();
int yyerror (char *s);
%}

%{
 typedef struct Nodo {
    char* Palabra;
    char* Tipo;
    int cantidad; 
    struct Nodo* sgte;
}NODO;


NODO* CrearNodo(char*,char*);
void RecorrerLista(NODO*); 
int VerificarSiEstaVacia(NODO*);    
int EstaElElemento(NODO*, char*,char*);
void InsertarAlPpio(NODO** , char*,char*);
void insertarSinRepetir(NODO**, char*,char*);
void insertarIdentOrdenado(NODO**, char*,char*);
void insertarAlFinal(NODO**,char*,char*);

NODO* listaIds = NULL;
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
%token <cadena>  VOLATILE EXTERN SHORT SIGNED SIZEOF STRUCT SWITCH TYPEDEF UNION UNSIGNED VOID WHILE
%token <cadena> LITCAD ID AND OR MAYORIGUAL MENORIGUAL PORCENTAJE IGUALDAD DESIGUALDAD INCREMENTO DECREMENTO 
%token <cadena> PUNTERO MULTIPLICAR DIVIDIR SUMAR RESTAR
%token <car> CARACTER




//seccion reglas
%% 
input:    /*vacio*/
        | input line
;
line:     '\n'
        | sentencia
        | sentencia '\n'
;
/*SENTENCIAS*/

sentencia:            sentenciaExp 
                    | sentenciaCompuesta
                    | sentenciaSeleccion {printf("se hallo una sentencia de seleccion %s \n",sentencia);}
                    | sentenciaIteracion {printf("se hallo una sentencia de iteracion %s \n",sentencia);}
                    | sentenciaEtiquetada
                    | sentenciaSalto
;
sentenciaExp:         /*vacio*/ ';'
                    | exp ';'
;
sentenciaCompuesta:   '{' listaSentencias '}'
                    | '{' listaDeclaraciones listaSentencias '}'
                    | '{' listaDeclaraciones '}'
                    | '{' /*vacio*/ '}'
;
listaDeclaraciones:   declaracion 
                    | listaDeclaraciones declaracion
;
listaSentencias:      sentencia
                    | listaSentencias sentencia
;
sentenciaSeleccion:   IF '(' exp ')' sentencia {sentencia="  if";}
                    | IF '(' exp ')' sentencia ELSE sentencia
                    | SWITCH '(' exp ')' sentencia
;
sentenciaIteracion:   WHILE '(' exp ')' sentencia {sentencia="while";}
                    | DO sentencia WHILE '(' exp ')' ';'
                    | FOR '(' exp ';' exp ';' exp ')' sentencia
;  
sentenciaEtiquetada:  CASE expCondicional ':' sentencia
                    | DEFAULT ':' sentencia
                    | ID ':' sentencia
;
sentenciaSalto:     | BREAK ';' 
                    | RETURN ';'
                    | RETURN exp ';'
;

/*EXPRESIONES*/

exp:                  expAsignacion
                    | exp ',' expAsignacion
;
expAsignacion:        expCondicional {$<nro>$=$<nro>1;}
                    | expUnaria operadorAsignacion expAsignacion {printf("1hola");}
;
expCondicional:       expOLogico {$<nro>$ = $<nro>1;}
                    | expOLogico '?' exp ':' expCondicional
;
operadorAsignacion:  '='
                    | MULTIPLICAR
                    | DIVIDIR
                    | PORCENTAJE
                    | SUMAR
                    | RESTAR
;
expOLogico:           expYLogico {$<nro>$=$<nro>1;}
                    | expOLogico OR expYLogico
;
expYLogico:           expIgualdad {$<nro>$=$<nro>1;}
                    | expYLogico AND expIgualdad
;
expIgualdad:          expRelacional {$<nro>$=$<nro>1;}
                    | expIgualdad IGUALDAD expRelacional
                    | expIgualdad DESIGUALDAD expRelacional
;
expRelacional:        expAdd
                    | expRelacional '<' expAdd
                    | expRelacional '>' expAdd 
                    | expRelacional MENORIGUAL expAdd 
                    | expRelacional MAYORIGUAL expAdd
;
expAdd:               expMultipl {$<nro>$=$<nro>1;}
                    | expAdd '+' expMultipl {$<nro>$= $<nro>1 + $<nro>2;}
                    | expAdd '-' expMultipl
;
expMultipl:           expConversion {$<nro>$=$<nro>1;}
                    | expMultipl '*' expConversion 
                    | expMultipl '/' expConversion 
                    | expMultipl '%' expConversion
;
expConversion:        expUnaria {$<nro>$=$<nro>1;}
                    | '(' nameTipo ')' expConversion
;
expUnaria:            expSufijo {$<nro>$=$<nro>1;}
                    | INCREMENTO expUnaria 
                    | DECREMENTO expUnaria 
                    | opUnario expConversion
                    | SIZEOF expUnaria
                    | SIZEOF '(' nameTipo ')'
;
opUnario:            '&'|'*'|'+'|'-'|'!'
;
expSufijo:            expPrim {$<nro>$=$<nro>1;}
                    | expSufijo '[' exp ']' /*arreglo*/
                    | expSufijo '(' /*vacio*/ ')'
                    | expSufijo '(' listaArgum ')' /* invocación */
                    | expSufijo '.' ID 
                    | expSufijo PUNTERO ID 
                    | expSufijo INCREMENTO 
                    | expSufijo DECREMENTO
;
listaArgum:           expAsignacion 
                    | listaArgum ',' expAsignacion
;
expPrim:              ID 
                    | CTEDEC {$<nro>$=$<nro>1;}
                    | CTEHEX {$<nro>$=$<nro>1;}
                    | CTEOCT {$<nro>$=$<nro>1;}
                    | CTEREAL {$<nro>$=$<nro>1;}
                    | CARACTER
                    | LITCAD
                    | '(' exp ')'
;

/*DECLARACIONES*/

declaracion:          especificDeclaracion
                    | especificDeclaracion listaDeclaradores
;
especificDeclaracion: especificClaseAlmacenam
                    | especificClaseAlmacenam especificDeclaracion 
                    | especificTipo 
                    | especificTipo especificDeclaracion 
                    | calificTipo 
                    | calificTipo especificDeclaracion 
;
listaDeclaradores:    declarador 
                    | listaDeclaradores ',' declarador
;
declarador:           decla 
                    | decla '=' inicializador {printf("2chau");}
;
inicializador:        expAsignacion                 {$<nro>$ = $<nro>1;}
                    | '{' listaInicializadores '}'  /* Inicialización de tipos estructurados */
                    | '{' listaInicializadores ',' '}'
;
listaInicializadores: inicializador 
                    | listaInicializadores ',' inicializador
;
especificClaseAlmacenam:
                      TYPEDEF
                    | EXTERN
;
especificTipo:        VOID 
                    | CHAR 
                    | SHORT 
                    | INT 
                    | LONG 
                    | FLOAT 
                    | DOUBLE 
                    | SIGNED
                    | UNSIGNED
                    | especificadorStructOUnion
                    | especificadorEnum
                    | ID
;
calificTipo:          CONST
                    | VOLATILE 
;
especificadorStructOUnion: 
                      structOUnion '{' listaDeclaracionesStruct '}'
                    | structOUnion ID '{' listaDeclaracionesStruct '}' 
                    | structOUnion ID
;
structOUnion:         STRUCT
                    | UNION 
;
listaDeclaracionesStruct:    
                      declaracionStruct 
                    | listaDeclaracionesStruct declaracionStruct
;
declaracionStruct:    listaCalificadores declaradoresStruct ';'
;
listaCalificadores:   especificTipo
                    | especificTipo listaCalificadores
                    | calificTipo 
                    | calificTipo listaCalificadores 
;
declaradoresStruct:   declaStruct  
                    | declaradoresStruct ',' declaStruct
;
declaStruct:          decla      
                    | ':' expCondicional
                    | decla ':' expCondicional
;
decla:                declaradorDirecto 
                    | puntero declaradorDirecto
;
puntero:              '*' 
                    | '*' listaCalificTipos 
                    | '*' puntero
                    | '*' listaCalificTipos puntero
;
listaCalificTipos:    calificTipo 
                    | listaCalificTipos calificTipo
;
declaradorDirecto:    ID 
                    | '(' decla ')' 
                    | declaradorDirecto '[' ']'
                    | declaradorDirecto '[' expCondicional ']' 
                    | declaradorDirecto '(' listaTiposParam ')' 
;
listaTiposParam:      listaParam 
                    | listaParam ',' '.' '.' '.'
;
listaParam:           declaracionParam 
                    | listaParam ',' declaracionParam
;
declaracionParam:     especificDeclaracion decla 
                    | especificDeclaracion
                    | especificDeclaracion declaradorAbstracto /*parametros anonimos*/
;
especificadorEnum:    ENUM '{' listaEnum '}' 
                    | ENUM ID '{' listaEnum '}' 
                    | ENUM ID
;
listaEnum:            enumerador 
                    | listaEnum ',' enumerador
;
enumerador:           ID 
                    | ID '=' expCondicional
;
nameTipo:             listaCalificadores 
                    | listaCalificadores declaradorAbstracto
;
declaradorAbstracto:  puntero 
                    | declaradorAbsDirecto
                    | puntero declaradorAbsDirecto
;
declaradorAbsDirecto: '(' declaradorAbstracto ')' 
                    | '[' ']'                                      /*sin declaradorAbsDirecto ni expCondicional*/
                    | declaradorAbsDirecto '[' ']'                 /*sin expCondicional*/
                    | '[' expCondicional ']'                       /*sin declaradorAbsDirecto*/
                    | declaradorAbsDirecto '[' expCondicional ']' 
                    | '(' ')'                                      /*sin declaradorAbsDirecto ni listaTiposParam*/
                    | '(' listaTiposParam ')'                      /*sin declaradorAbsDirecto*/
                    | declaradorAbsDirecto '(' ')'                 /*listaTiposParam*/
                    | declaradorAbsDirecto '(' listaTiposParam ')'

%%

 int main ()
 {
        int flag;
        yyin=fopen("entrada.c","r");
 
        flag=yyparse();
        fclose(yyin);
        
        printf("\n");
        insertarIdentOrdenado(&listaIds,"algo","entero");
        insertarIdentOrdenado(&listaIds,"algo","char");
        insertarIdentOrdenado(&listaIds,"algo","char");
        insertarIdentOrdenado(&listaIds,"algo","entero");
        insertarIdentOrdenado(&listaIds,"algo","entero");
        insertarIdentOrdenado(&listaIds,"algo","char");
        insertarIdentOrdenado(&listaIds,"algo","char");
        insertarIdentOrdenado(&listaIds,"algo","entero");
        insertarIdentOrdenado(&listaIds,"algo","char");
        
        RecorrerLista(listaIds);
        
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

void RecorrerLista(NODO *l) {
    NODO *aux = l;
    printf("---- LISTA DE IDENTIFICADORES ----\n");
    while (aux != NULL) {
        printf("el id: %s, de tipo %s, aparece: %d veces\n",aux->Palabra,aux->Tipo,aux->cantidad);
        aux = aux->sgte; 
    }
}

