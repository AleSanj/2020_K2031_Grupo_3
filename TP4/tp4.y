%{

#include<stdio.h>
extern FILE* yyin;
char* sentencia;
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
expAsignacion:        expCondicional
                    | expUnaria operadorAsignacion expAsignacion
;
expCondicional:       expOLogico
                    | expOLogico '?' exp ':' expCondicional
;
operadorAsignacion:  '='
                    | MULTIPLICAR
                    | DIVIDIR
                    | PORCENTAJE
                    | SUMAR
                    | RESTAR
;
expOLogico:           expYLogico
                    | expOLogico OR expYLogico
;
expYLogico:           expIgualdad
                    | expYLogico AND expIgualdad
;
expIgualdad:          expRelacional
                    | expIgualdad IGUALDAD expRelacional
                    | expIgualdad DESIGUALDAD expRelacional
;
expRelacional:        expAdd
                    | expRelacional '<' expAdd
                    | expRelacional '>' expAdd 
                    | expRelacional MENORIGUAL expAdd 
                    | expRelacional MAYORIGUAL expAdd
;
expAdd:               expMultipl
                    | expAdd '+' expMultipl 
                    | expAdd '-' expMultipl
;
expMultipl:           expConversion 
                    | expMultipl '*' expConversion 
                    | expMultipl '/' expConversion 
                    | expMultipl '%' expConversion
;
expConversion:        expUnaria 
                    | '(' nameTipo ')' expConversion
;
expUnaria:            expSufijo 
                    | INCREMENTO expUnaria 
                    | DECREMENTO expUnaria 
                    | opUnario expConversion
                    | SIZEOF expUnaria
                    | SIZEOF '(' nameTipo ')'
;
opUnario:            '&'|'*'|'+'|'-'|'!'
;
expSufijo:            expPrim 
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
                    | CTEDEC
                    | CTEHEX
                    | CTEOCT
                    | CTEREAL
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
                    | decla '=' inicializador
;
inicializador:        expAsignacion                 /* Inicialización de tipos escalares */
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
  
     return flag;
 }