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
%token <cadena>  BREAK CASE CHAR CONST DEFAULT DO DOUBLE ELSE ENUM FLOAT FOR IF INT LONG RETURN CONTINUE
%token <cadena>  VOLATILE STATIC AUTO REGISTER EXTERN SHORT SIGNED SIZEOF STRUCT SWITCH TYPEDEF UNION UNSIGNED VOID WHILE GOTO
%token <cadena> LITCAD ID AND OR MAYORIGUAL MENORIGUAL PORCENTAJE IGUALDAD DESIGUALDAD INCREMENTO DECREMENTO 
%token <cadena> PUNTERO DESPLAZDER DESPLAZIZQ MULTIPLICAR DIVIDIR SUMAR RESTAR
%token <car> CARACTER

//seccion reglas
%% 
/*SENTENCIAS*/
sentencia:            sentenciaExp 
                    | sentenciaCompuesta
                    | sentenciaSeleccion
                    | sentenciaIteracion
                    | sentenciaEtiquetada
                    | sentenciaSalto
;
sentenciaExp:         //vacio
                    | exp ';'
;
sentenciaCompuesta:  '{' listaDeclaraciones listaSentencias '}'
;
listaDeclaraciones:   
                    | declaracion 
                    | listaDeclaraciones declaracion
;
listaSentencias:      
                    | sentencia
                    | listaSentencias sentencia
;
sentenciaSeleccion:   IF '(' exp ')' sentencia
                    | IF '(' exp ')' sentencia ELSE sentencia
                    | SWITCH '(' exp ')' sentencia
;
sentenciaIteracion:   WHILE '(' exp ')' sentencia
                    | DO sentencia WHILE '(' exp ')' ';'
                    | FOR '(' exp ';' exp ';' exp ')' sentencia
;  
sentenciaEtiquetada:  CASE expCte ':' sentencia
                    | DEFAULT ':' sentencia
                    | ID ':' sentencia
;
sentenciaSalto:       CONTINUE ';'
                    | BREAK ';'
                    | RETURN exp ';'
                    | GOTO ID ';'
;
/*EXPRESIONES*/
exp:                  
                    | expAsignacion
                    | exp ',' expAsignacion
;
expAsignacion:        expCondicional
                    | expUnaria opAsignacion expAsignacion
;
expCondicional:       expOLogico
                    | expOLogico '?' exp ':' expCondicional
;
opAsignacion:         '='
                    | MULTIPLICAR
                    | DIVIDIR
                    | PORCENTAJE
                    | SUMAR
                    | RESTAR
;
expOLogico:           expYLogico
                    | expOLogico OR expYLogico
;
expYLogico:           expOInclusivo
                    | expYLogico AND expOInclusivo
;
expOInclusivo:        expOExcluyente
                    | expOInclusivo '|' expOExcluyente
;
expOExcluyente:       expY
                    | expOExcluyente '^' expY
;
expY:                 expIgualdad
                    | expY '&' expIgualdad
;
expIgualdad:          expRelacional
                    | expIgualdad IGUALDAD expRelacional
                    | expIgualdad DESIGUALDAD expRelacional
;
expRelacional:        expCorrimiento
                    | expRelacional '<' expCorrimiento
                    | expRelacional '>' expCorrimiento 
                    | expRelacional MENORIGUAL expCorrimiento 
                    | expRelacional MAYORIGUAL expCorrimiento
;
expCorrimiento:       expAdd 
                    | expCorrimiento DESPLAZIZQ expAdd 
                    | expCorrimiento DESPLAZDER expAdd
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
                    | expSufijo '(' listaArgum ')' /* invocación */
                    | expSufijo '.' ID 
                    | expSufijo PUNTERO ID 
                    | expSufijo INCREMENTO 
                    | expSufijo DECREMENTO
;
listaArgum:           
                    | expAsignacion 
                    | listaArgum ',' expAsignacion
;
expPrim:              ID 
                    | CTEDEC
                    | CTEHEX
                    | CTEOCT
                    | CTEREAL
                    | LITCAD
                    | '(' exp ')'
;
expCte:               
                    |expCondicional
;

/*DECLARACIONES*/

declaracion:          especificDeclaracion listaDeclaradores
;
especificDeclaracion: 
                    | especificClaseAlmacenam especificDeclaracion 
                    | especificTipo especificDeclaracion 
                    | calificTipo especificDeclaracion 
;
listaDeclaradores:    
                    | declarador 
                    | listaDeclaradores ',' declarador
;
declarador:           decla 
                    | decla '=' inicializador
;
inicializador:        expAsignacion /* Inicialización de tipos escalares */
                    | '{' listaInicializadores '}' /* Inicialización de tipos estructurados */
                    | '{' listaInicializadores ',' '}'
;
listaInicializadores: inicializador 
                    | listaInicializadores ',' inicializador
;
especificClaseAlmacenam:
                      TYPEDEF
                    | STATIC 
                    | AUTO
                    | REGISTER 
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
                    | especificStructOUnion
                    | especificEnum
                    | nameTypedef
;
calificTipo:          CONST
                    | VOLATILE 
;
especificStructOUnion: 
                      structOUnion identificador '{' listaDeclarStruct '}' 
                    | structOUnion ID
;
identificador:        
                    | ID {printf("holis");}
;
structOUnion:         STRUCT
                    | UNION 
;
listaDeclarStruct:    declaracionStruct 
                    | listaDeclarStruct declaracionStruct
;
declaracionStruct:    listaCalificadores declaradoresStruct ';'
;
listaCalificadores:   
                    | especificTipo listaCalificadores 
                    | calificTipo listaCalificadores 
;
declaradoresStruct:   declaStruct  
                    | declaradoresStruct ',' declaStruct
;
declaStruct:          decla      
                    | decla ':' expCte
;
decla:                
                    | puntero declaradorDirecto
;
puntero:              
                    | '*' listaCalificTipos 
                    | '*' listaCalificTipos puntero
;
listaCalificTipos:    
                    | calificTipo 
                    | listaCalificTipos calificTipo
;
declaradorDirecto:    ID 
                    | '(' decla ')' 
                    | declaradorDirecto '[' expCte ']' 
                    | declaradorDirecto '(' listaTiposParam ')' 
                    | declaradorDirecto '(' listaID ')'
;
listaTiposParam:      
                    | listaParam 
                    | listaParam ',' '.' '.' '.'
;
listaParam:           declaracionParam 
                    | listaParam ',' declaracionParam
;
declaracionParam:     especificDeclaracion decla 
                    | especificDeclaracion declaradorAbstracto /*parametros anonimos*/
;
listaID:              
                    | ID 
                    | listaID ',' ID
;
especificEnum:        ENUM identificador '{' listaEnum '}' 
                    | ENUM ID
;
listaEnum:            enumerador 
                    | listaEnum ',' enumerador
;
enumerador:           cteEnum 
                    | cteEnum '=' expCte
;
cteEnum:              ID
;
nameTypedef:          ID
;
nameTipo:             listaCalificadores declaradorAbstracto
;
declaradorAbstracto:  
                    | puntero 
                    | puntero declaradorAbsDirecto
;
declaradorAbsDirecto: 
                    | '(' declaradorAbstracto ')' 
                    | declaradorAbsDirecto '[' expCte ']' 
                    | declaradorAbsDirecto '(' listaTiposParam ')'







%%

//seccion funciones de usuario










