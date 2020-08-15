%option noyywrap

PALABRAS_RESERVADAS auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
CARACTER_DE_PUNTUACION "("|")"|"["|"]"|"{"|"}"|","|":"|"="|";"|"..."|"#"
CONSTANTE_DECIMAL [1-9][0-9]*
CONSTANTE_OCTAL 0[0-7]*
CONSTANTE_HEXADECIMAL 0[xX][0-9a-fA-F]+
CONSTANTE_REAL [1-9][0-9]*"."[0-9]*"E"?[\+\-]?[0-9]*
LITERAL_CADENA \"[^\"]*\"
CARACTER_SIMPLE "'"."'"
IDENTIFICADOR ([a-zA-Z]|_)([a-zA-Z]|[0-9]|_)*
OPERADOR "+"|"-"|"/"|"*"|"%"|"&&"|"||"|"¬"|">"|">="|"<"|"<="|"=="|"!="
NUMERO [0-9]
DIRECTIVAALPRECOMPILADOR "#"(define|elif|else|endif|error|if|ifdef|ifndef|include|message|undef)
COMENTARIO_LINEA "//".*
COMENTARIO_MULTIPLE \/\*(\*+[^\*\/]|[^\*])*\*+\/
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

   typedef struct Nodo {
    char* Palabra;
    int cantidad;
    struct Nodo* sgte;
}NODO;
//literales cadena
NODO* CrearNodoLitCad(char*,int);
 void InsertarAlPpioLitCad(NODO**,char*,int);
 void insertarLitCad(NODO**,char*,int);

    char* cad;
    int longg;
    NODO* listaLitCadena = NULL;
//funciones para identificadores y comunes a otros tokens


NODO* CrearNodo(char*);
void RecorrerLista(NODO*,char); 
int VerificarSiEstaVacia(NODO*);    
int EstaElElemento(NODO*, char*);
void InsertarAlPpio(NODO** l, char*);
void insertarIdentOrdenado(NODO**, char*);

void insertarAlFinal(NODO**,char*);
void recorrerListaPalReserv(NODO*);

//funciones para constantes
typedef struct constantes {
    long constante;
    int posicion;
    struct constantes* sgte;
}NODOCONST;

NODOCONST* CrearNodoConst(int);
int VerificarSiEstaVaciaConst(NODOCONST*);
void InsertarAlFinalConst(NODOCONST**, long);
void mostrarOctales (NODOCONST*);
void mostrarHexa (NODOCONST*);
void mostrarDecimal (NODOCONST*);
void mostrarFloat (NODOCONST*);
void mostrarCarac (NODOCONST*);

NODOCONST* listaConstantesOct = NULL;
NODOCONST* listaConstantesHex = NULL;
NODOCONST* listaConstantesDec = NULL;
NODOCONST* listaConstantesFloat = NULL;
NODOCONST* listaConstantesCarac = NULL;
long AuxConst;

//funciones para operadores y caracteres de puntuacion
char* op;
char *carPunt;
NODO*listaOpYCarPunt=NULL;
//funciones para comentarios


char *comentarioLinea;
char *comentarioMultiple;

NODO*listaComentLinea=NULL;
NODO*listaComentMult=NULL;


%}

%{
    char* ids;
    char *palR;
    NODO* listaIdentificadores = NULL;
    int contadorIdentificadores = 0;
    NODO* listaPalReserv = NULL;

%}

%%

{COMENTARIO_LINEA} {
                    comentarioLinea=yytext;
                    insertarAlFinal(&listaComentLinea,comentarioLinea);
                    fflush(stdin);

}
{COMENTARIO_MULTIPLE} {
                        comentarioMultiple=yytext;
                        insertarAlFinal(&listaComentMult,comentarioMultiple);
                        fflush(stdin);

}
{CONSTANTE_DECIMAL} {printf("Encontre una constante decimal : %s \n" , yytext);}
{CONSTANTE_OCTAL} {
                    AuxConst=strtol(yytext,NULL,8);
                    InsertarAlFinalConst(&listaConstantesOct,AuxConst);

}
{CONSTANTE_HEXADECIMAL} {
                    AuxConst = strtol(yytext,NULL,16);
                    InsertarAlFinalConst(&listaConstantesHex,AuxConst);
}
{CONSTANTE_REAL} {printf("Encontre una constante real : %s\n",yytext);}
{LITERAL_CADENA} {  
                    cad=yytext;
                    longg=yyleng-2;
                    insertarLitCad(&listaLitCadena,cad,longg);

}

{PALABRAS_RESERVADAS} {
                    palR=yytext;
                    insertarAlFinal(&listaPalReserv,palR);
                    fflush(stdin);
}
{CARACTER_SIMPLE} {printf("encontre el caracter: %s \n", yytext);}
{IDENTIFICADOR} {
                    ids=yytext;
                    insertarIdentOrdenado(&listaIdentificadores,ids);
                    fflush(stdin);
                
        
 }

{DIRECTIVAALPRECOMPILADOR} {printf("Encontre la directiva al precompilador: %s \n ",yytext);}
{CARACTER_DE_PUNTUACION} {
                            carPunt=yytext;
                            insertarIdentOrdenado(&listaOpYCarPunt,carPunt);
                            fflush(stdin);

}
{OPERADOR}/{NUMERO} {
                        op=yytext;
                        insertarIdentOrdenado(&listaOpYCarPunt,op);
                        fflush(stdin);

}

%%


int main(){
    
    yyin = fopen("entrada.c" , "r");
    yyout = fopen("salida.c" , "w");
    yylex();

    //mostrar identificadores
    if (VerificarSiEstaVacia(listaIdentificadores)==0) {
        char LISTAIDENTIFICADORES='A';
    RecorrerLista(listaIdentificadores,LISTAIDENTIFICADORES);
    }
    //mostrar literales cadena
    if (VerificarSiEstaVacia(listaLitCadena)==0) {
        char LISTALITERALESCADENA='B';
    RecorrerLista(listaLitCadena,LISTALITERALESCADENA);
    }
    //mostrar palabras reservadas
    if (VerificarSiEstaVacia(listaPalReserv)==0){
        char LISTAPALABRASRESERVADAS='C';
        RecorrerLista(listaPalReserv,LISTAPALABRASRESERVADAS);
    }
    //mostrar octales
    if(VerificarSiEstaVaciaConst(listaConstantesOct)==0) {
        mostrarOctales(listaConstantesOct);
    }
    //mostrar Hexadecimales
    if(VerificarSiEstaVaciaConst(listaConstantesHex)==0) {
        mostrarHexa(listaConstantesHex);
    
}



    //mostrar op y caracteres de punt
    if (VerificarSiEstaVacia(listaOpYCarPunt)==0) {
        char LISTAOPERADORES='D';
    RecorrerLista(listaOpYCarPunt,LISTAOPERADORES);
    }
     //mostrar comentarios
    if (VerificarSiEstaVacia(listaComentLinea)==0) {
        char LISTACOMENTARIOSLINEA='E';
    RecorrerLista(listaComentLinea,LISTACOMENTARIOSLINEA);
    }
    if (VerificarSiEstaVacia(listaComentMult)==0) {
        char LISTACOMENTARIOSMULTIPLE='F';
    RecorrerLista(listaComentMult,LISTACOMENTARIOSMULTIPLE);
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
        printf("%s , longitud: %i \n",aux->Palabra,aux->cantidad);
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
NODOCONST* CrearNodoConst(int c) {
    NODOCONST* nuevo_nodo = NULL;
    nuevo_nodo = (NODOCONST*) malloc(sizeof(NODOCONST));
    nuevo_nodo->constante = c;
    nuevo_nodo->sgte = NULL;
    
}

int VerificarSiEstaVaciaConst(NODOCONST*c){
    if (c==NULL) {
        return 1;
    } else {
        return 0;
    }
}
void InsertarAlFinalConst(NODOCONST**c,long numero){
    NODOCONST* aux1 = *c;
    NODOCONST* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodoConst(numero);

    if (VerificarSiEstaVaciaConst(aux1)==1){
        *c = nuevo_nodo;
    } else {
        while (aux1->sgte != NULL) {
            aux1 = aux1->sgte;
        }
        aux1->sgte = nuevo_nodo;
    }
}


void mostrarOctales (NODOCONST*c){
    NODOCONST* aux1 = c;
    printf("----CONSTANTES OCTALES----\n");
    while(aux1 != NULL ) {
        printf("Constante octal: %o, En decimal: %d\n",aux1->constante,aux1->constante);
        aux1= aux1->sgte;
    }
}
void mostrarHexa(NODOCONST*c){
    NODOCONST* aux1 = c;
    printf("----CONSTANTES HEXADECIMALES----\n");
    while(aux1 != NULL ) {
        printf("Constante hexadecimal: %X, En decimal: %d\n",aux1->constante,aux1->constante);
        aux1= aux1->sgte;
    }
}

