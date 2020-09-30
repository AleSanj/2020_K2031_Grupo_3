%option lex-compat
%option noyywrap

SALTO_DE_LINEA \n
PALABRAS_RESERVADAS auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
CARACTER_DE_PUNTUACION "("|")"|"["|"]"|"{"|"}"|","|":"|"="|";"|"..."|"#"
CONSTANTE_DECIMAL [1-9][0-9]*
CONSTANTE_OCTAL 0[0-7]*
CONSTANTE_HEXADECIMAL 0[xX][0-9a-fA-F]+
CONSTANTE_REAL [1-9][0-9]*"."[0-9]*"E"?[\+\-]?[0-9]*
LITERAL_CADENA \"[^\"]*\"
CARACTER_SIMPLE "'"."'"
IDENTIFICADOR ([a-zA-Z]|_)([a-zA-Z]|[0-9]|_)*
OPERADOR "+"|"-"|"/"|"*"|"%"|"&&"|\&|"||"|"¬"|">"|">="|"<"|"<="|"=="|"!="
NUMERO [0-9]
COMENTARIO_LINEA "//".*
COMENTARIO_MULTIPLE \/\*(\*+[^\*\/]|[^\*])*\*+\/

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "tp4.tab.h"
//    typedef struct Nodo {
//     char* Palabra;
//     int cantidad; //la usamos guardar la cantida de identificadores y para guardar la linea en la que estan los 
//     struct Nodo* sgte;
// }NODO;
// //literales cadena
// NODO* CrearNodoLitCad(char*,int);
//  void InsertarAlPpioLitCad(NODO**,char*,int);
//  void insertarLitCad(NODO**,char*,int);

//     char* cad;
//     int longg;
//     NODO* listaLitCadena = NULL;
// //funciones para identificadores y comunes a otros tokens


// NODO* CrearNodo(char*);
// void RecorrerLista(NODO*,char); 
// int VerificarSiEstaVacia(NODO*);    
// int EstaElElemento(NODO*, char*);
// void InsertarAlPpio(NODO** l, char*);
// void insertarIdentOrdenado(NODO**, char*);

// void insertarAlFinal(NODO**,char*);
// void recorrerListaPalReserv(NODO*);


// NODO* CrearNodoNoRec(char*,int);
// void insertarAlFinalNoRec(NODO**,char*,int);

// //funciones para constantes
// typedef struct constantes {
//     long constante;
//     float constanteF;
//     struct constantes* sgte;
// }NODOCONST;

// NODOCONST* CrearNodoConst(long,float,char);
// int VerificarSiEstaVaciaConst(NODOCONST*);
// void InsertarAlFinalConst(NODOCONST**, long,float,char);

// void mostrarctes(NODOCONST*,char);
// void mostrarCarac (NODOCONST*);

// NODOCONST* listaConstantesOct = NULL;
// NODOCONST* listaConstantesHex = NULL;
// NODOCONST* listaConstantesDec = NULL;
// NODOCONST* listaConstantesFloat = NULL;
// NODO* listaConstantesCarac = NULL;
// long AuxConst;
// float AuxConstF;

// //funciones para operadores y caracteres de puntuacion
// char* op;
// char *carPunt;
// NODO*listaOpYCarPunt=NULL;
// //funciones para comentarios

// char *comentarioLinea;
// char *comentarioMultiple;

// NODO*listaComentLinea=NULL;
// NODO*listaComentMult=NULL;
// NODO*listaNoRec=NULL;
// //Numero de linea
// int numeroDeLinea = 1; 


%}

%{
    // char* ids;
    // char *palR;
    // NODO* listaIdentificadores = NULL;
    // int contadorIdentificadores = 0;
    // NODO* listaPalReserv = NULL;

%}

%%
%{
//PALABRAS RESERVADAS
%}
"break"    {return BREAK;}
"case"     {return CASE;}
"char"     {return CHAR;}
"const"    {return CONST;}
"default"  {return DEFAULT;}
"do"       {return DO;}
"double"   {return DOUBLE;}
"else"     {return ELSE;}
"enum"     {return ENUM;}
"goto"     {return GOTO;}
"float"    {return FLOAT;}
"for"      {return FOR;}
"if"       {return IF;}
"int"      {return INT;}
"long"     {return LONG;}
"return"   {return RETURN;}
"short"    {return SHORT;}
"signed"   {return SIGNED;}
"sizeof"   {return SIZEOF;}
"struct"   {return STRUCT;}
"switch"   {return SWITCH;}
"typedef"  {return TYPEDEF;}
"union"    {return UNION;}
"unsigned" {return UNSIGNED;}
"void"     {return VOID;}
"while"    {return WHILE;}
"static"   {return STATIC;}
"auto"     {return AUTO;}
"register" {return REGISTER;}
"extern"   {return EXTERN;}
"volatile" {return VOLATILE;}


")"        {return ')';}
"["        {return '[';}
"}"        {return '}';}
"]"        {return ']';}
","        {return ',';}
":"        {return ':';}
"="        {return '=';}
";"        {return ';';}
"("        {return '(';}
"{"        {return '{';}



{CONSTANTE_DECIMAL}       {return CTEDEC;}
{CONSTANTE_OCTAL}         {return CTEOCT;}
{CONSTANTE_HEXADECIMAL}   {return CTEHEX;}
{CONSTANTE_REAL}          {return CTEREAL;}
{LITERAL_CADENA}          {return LITCAD;}
{CARACTER_SIMPLE}         {return CARACTER;}
{IDENTIFICADOR}           {return ID;}


"+"      {return '+';}
"-"      {return '-';}
"/"      {return '/';}
"*"      {return '*';}
"%"      {return '%';}
"&&"     {return AND;}
"||"     {return OR;}
">"      {return '>';}
">="     {return MAYORIGUAL;}
"<"      {return '<';}
"<="     {return MENORIGUAL;}
"=="     {return IGUALDAD;}
"!="     {return DESIGUALDAD;}
"++"     {return INCREMENTO;}
"--"     {return DECREMENTO;}
"->"     {return PUNTERO}
"."      {return '.';}
"!"      {return '!';}
"*="     {return MULTIPLICAR;}
"/="     {return DIVIDIR;}
"+="     {return SUMAR;}
"-="     {return RESTAR;}
"%="     {return PORCENTAJE;}
"|"      {return '|';}
"^"      {return '^';}
"<<"     {return DESPLAZIZQ;}
">>"     {return DESPLAZDER;}


{COMENTARIO_LINEA}
{COMENTARIO_MULTIPLE}

{SALTO_DE_LINEA} {}

%%

int main(){
    
    yyin = fopen("entrada.c" , "r");
    yyout = fopen("salida.c" , "w");
    yylex();

    //mostrar identificadores
    if (VerificarSiEstaVacia(listaIdentificadores)==0) {
    RecorrerLista(listaIdentificadores,'A');
    }
    //mostrar literales cadena
    if (VerificarSiEstaVacia(listaLitCadena)==0) {
    RecorrerLista(listaLitCadena,'B');
    }
    //mostrar palabras reservadas
    if (VerificarSiEstaVacia(listaPalReserv)==0){
        RecorrerLista(listaPalReserv,'C');
    }
    //mostrar octales
    if(VerificarSiEstaVaciaConst(listaConstantesOct)==0) {
        mostrarctes(listaConstantesOct,'O');
    }
    //mostrar Hexadecimales
    if(VerificarSiEstaVaciaConst(listaConstantesHex)==0) {
        mostrarctes(listaConstantesHex,'H');}
    //mostrar decimales
    if(VerificarSiEstaVaciaConst(listaConstantesDec)==0){
        mostrarctes(listaConstantesDec,'D');
    }
    //mostrar REALES
    if(VerificarSiEstaVaciaConst(listaConstantesFloat)==0){
        mostrarctes(listaConstantesFloat,'F');
        
    }

    //mostrar op y caracteres de punt
    if (VerificarSiEstaVacia(listaOpYCarPunt)==0) {
    RecorrerLista(listaOpYCarPunt,'D');
    }
     //mostrar comentarios
    if (VerificarSiEstaVacia(listaComentLinea)==0) {
    RecorrerLista(listaComentLinea,'E');
    }
    if (VerificarSiEstaVacia(listaComentMult)==0) {
    RecorrerLista(listaComentMult,'F');
    }
    //mostrar constantes caracter
    if (VerificarSiEstaVacia(listaConstantesCarac)==0) {
    RecorrerLista(listaConstantesCarac,'G');
    }
    //mostrar caracteres no reconocidos
    if (VerificarSiEstaVacia(listaNoRec)==0){
        RecorrerLista(listaNoRec,'H');
    }
return 0;
}

// Funciones para identificadores
NODO* CrearNodo(char* palabra) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    nuevo_nodo->Palabra=strdup(palabra);
    nuevo_nodo->cantidad = 1;
    nuevo_nodo->sgte = NULL;    
}

void RecorrerLista(NODO *l,char titulo) {
    NODO *aux = l;
    switch(titulo){
        case 'A':
        printf("---- LISTA DE IDENTIFICADORES----\n");
    while (aux != NULL) {
        printf("el id: %s aparece: %d veces\n",aux->Palabra,aux->cantidad);
        aux = aux->sgte; 
    } break;
    case 'B':printf("---- LISTA DE LITERALES CADENA----\n");
    while (aux != NULL) {
        printf("lit cadena: %s , longitud: %i \n",aux->Palabra,aux->cantidad);
        aux = aux->sgte; 
    } break;
    case 'C':printf("---- LISTA DE PALABRAS RESERVADAS----\n");
     while(aux != NULL) {
        printf("%s \n",aux->Palabra);
        aux = aux->sgte;
    } break;
    case 'D':printf("---- LISTA DE OPERADORES/CARACTERES DE PUNTUACION----\n");
    while (aux != NULL) {
        printf(" %s aparece: %d veces\n",aux->Palabra,aux->cantidad);
        aux = aux->sgte; 
    } break;
    case 'E':printf("---- LISTA DE COMENTARIOS DE LINEA----\n");
    while(aux != NULL) {
        printf("%s \n",aux->Palabra);
        aux = aux->sgte; 
    } break;

    case 'F':printf("---- LISTA DE COMENTARIOS DE MULTIPLES LINEAS----\n");
    while(aux != NULL) {
        printf("%s \n",aux->Palabra);
        aux = aux->sgte; 
    }break;
    case 'G': printf("---LISTA DE CARACTERES SIMPLES---\n");
    int i=1;
    while(aux != NULL) {
        printf("%i. %s \n",i,aux->Palabra);
        i++;
        aux = aux->sgte; 
    }break;
    case 'H': printf("---LISTA DE CARACTERES NO RECONOCIDOS---\n");
    while(aux != NULL) {
        printf("caracter no reconocido: %s, linea nro: %i.  \n",aux->Palabra,aux->cantidad);
        aux = aux->sgte; 
    }break;
    }
    printf("\n");



}

int VerificarSiEstaVacia(NODO* l){
    if (l == NULL){
    return 1;
    } else {
        return 0;
    }
    }
void InsertarAlPpio(NODO** l, char* palabra){
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra);
    nuevo_nodo->sgte = *l;
    *l = nuevo_nodo;

}

void insertarIdentOrdenado(NODO** l, char* palabra){
        NODO* aux1 = *l;
        if (VerificarSiEstaVacia(aux1)){
            InsertarAlPpio(l,palabra);
        } else if (EstaElElemento(aux1,palabra)==0) {
                if( strcasecmp(palabra,aux1->Palabra)<0) {
                InsertarAlPpio(l,palabra);
            } else {
                    NODO* aux2 = aux1->sgte;
                    while(aux1->sgte != NULL && (strcasecmp(palabra,aux1->sgte->Palabra)>0)) {
                        aux1 = aux1->sgte;
                        aux2 = aux2->sgte;
                    }
                    if (aux2==NULL) {
                        NODO* nuevo_nodo = NULL;
                        nuevo_nodo = CrearNodo(palabra);
                        aux1->sgte=nuevo_nodo;
                    } else {
                    NODO* nuevo_nodo = NULL;
                    nuevo_nodo = CrearNodo(palabra);
                    nuevo_nodo->sgte = aux2;
                    aux1->sgte = nuevo_nodo;
                    }
        }
        } else {
            while (strcasecmp(aux1->Palabra,palabra)!=0){
                aux1 = aux1->sgte;
            } aux1->cantidad++;
        }
}

int EstaElElemento(NODO*l, char* palabra){
    NODO* aux = l;
        do {
            if(strcmp(aux->Palabra,palabra) == 0){
                return 1;
            
            } 
            aux = aux->sgte;
        } while (aux != NULL);
        
        return 0;
}

// Fin funciones para identificadores


//funciones para literales cadena

NODO* CrearNodoLitCad(char* cadena,int longitud) {
     NODO* nuevo_nodo = NULL;
     nuevo_nodo = (NODO*) malloc(sizeof(NODO));
     nuevo_nodo->Palabra= strdup(cadena);
     nuevo_nodo->cantidad=longitud;
     nuevo_nodo->sgte = NULL;    
 }

 void InsertarAlPpioLitCad(NODO** lista,char* cadena,int longitud){
     NODO* nuevo_nodo = NULL;
     nuevo_nodo = CrearNodoLitCad(cadena,longitud);
     nuevo_nodo->sgte = *lista;
     *lista = nuevo_nodo;

 }

 void insertarLitCad(NODO** lista,char* cadena,int longitud){
         NODO* aux1 = *lista; 
         if(VerificarSiEstaVacia(aux1) == 1) {
             InsertarAlPpioLitCad(lista,cadena,longitud);
         } 
         else {
                 NODO* aux2 = aux1->sgte;
                 while(aux1->sgte != NULL) {
                     aux1 = aux1->sgte;
                     aux2 = aux2->sgte;
                 }
                 if (aux2==NULL) {
                     NODO* nuevo_nodo = NULL;
                     nuevo_nodo = CrearNodoLitCad(cadena,longitud);
                     aux1->sgte=nuevo_nodo;
                 } 
             }
         }

//fin de literales cadena

//Func para pal reservadas
void insertarAlFinal(NODO**l, char* palabra) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra);
    NODO* aux1 = *l;
    if (aux1 == NULL) {
        InsertarAlPpio(l,palabra);
    } else{
    while(aux1->sgte != NULL) {
        aux1 = aux1->sgte;
    }
    aux1->sgte = nuevo_nodo;
    }
}


//funciones constantes
NODOCONST* CrearNodoConst(long c,float f, char titulo) {
    if (titulo == 'A') {

    NODOCONST* nuevo_nodo = NULL;
    nuevo_nodo = (NODOCONST*) malloc(sizeof(NODOCONST));
    nuevo_nodo->constante = c;
    nuevo_nodo->sgte = NULL;
    } 
    if(titulo=='B'){
    NODOCONST* nuevo_nodo = NULL;
    nuevo_nodo = (NODOCONST*) malloc(sizeof(NODOCONST));
    nuevo_nodo->constanteF = f;
    nuevo_nodo->sgte = NULL;
    }
    
}

int VerificarSiEstaVaciaConst(NODOCONST*c){
    if (c==NULL) {
        return 1;
    } else {
        return 0;
    }
}
void InsertarAlFinalConst(NODOCONST**c,long numero,float numeroF, char titulo){
    NODOCONST* aux1 = *c;
    NODOCONST* nuevo_nodo = NULL;
    switch(titulo){
            case 'A':
        nuevo_nodo = CrearNodoConst(numero,numeroF,titulo);

        if (VerificarSiEstaVaciaConst(aux1)==1){
            *c = nuevo_nodo;
        } else {
            while (aux1->sgte != NULL) {
                aux1 = aux1->sgte;
            }
            aux1->sgte = nuevo_nodo;
        } break;
        case 'B':
        nuevo_nodo = CrearNodoConst(numero,numeroF,titulo);
        if (VerificarSiEstaVaciaConst(aux1)==1){
            *c = nuevo_nodo;
        } else {
            while (aux1->sgte != NULL) {
                aux1 = aux1->sgte;
            }
            aux1->sgte = nuevo_nodo; 
        
        break;
        }
    }
}
   

void mostrarctes(NODOCONST*c,char titulo){
    NODOCONST* aux1 = c;
    switch(titulo){

        case 'O': printf("----CONSTANTES OCTALES----\n");
    while(aux1 != NULL ) {
        printf("Constante octal: %o, En decimal: %d\n",aux1->constante,aux1->constante);
        aux1= aux1->sgte;
    }break;

    case 'H':printf("----CONSTANTES HEXADECIMALES----\n");
    while(aux1 != NULL ) {
        printf("Constante hexadecimal: %X, En decimal: %d\n",aux1->constante,aux1->constante);
        aux1= aux1->sgte;
    } break;

    case 'D': 
    printf("----CONSTANTES DECIMALES----\n");
    int contador=0;
    while(aux1 != NULL ) {
        printf("Constante decimal: %d\n",aux1->constante);
        contador+=aux1->constante;
        aux1= aux1->sgte;
    }
    printf("La suma de todas las constantes decimales es: %d\n",contador);
    break;
    
    case 'F': 
    printf("----CONSTANTES FLOTANTES----\n");
    while(aux1 != NULL ) {
        float a = aux1->constanteF;
        int b = (int) a;
        float c = a-b;
        printf("Constante flotante: %f, parte entera: %d, mantisa: %f\n",aux1->constanteF,b,c);
        aux1= aux1->sgte;
    }
    break;
    }
    printf("\n");
    }
    

    void insertarAlFinalNoRec(NODO**l, char* palabra,int linea) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodoNoRec(palabra,linea);
    NODO* aux1 = *l;
    if (aux1 == NULL) {
        nuevo_nodo->sgte = *l;
        *l=nuevo_nodo;
        
    } else{
    while(aux1->sgte != NULL) {
        aux1 = aux1->sgte;
    }
    aux1->sgte = nuevo_nodo;
    }
}

NODO* CrearNodoNoRec(char* palabra,int linea) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    nuevo_nodo->Palabra=strdup(palabra);
    nuevo_nodo->cantidad = linea;
    nuevo_nodo->sgte = NULL;    
}
