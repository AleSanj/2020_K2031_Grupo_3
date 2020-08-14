%option noyywrap

PALABRAS_RESERVADAS auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
CARACTER_DE_PUNTUACION "("|")"|"["|"]"|"{"|"}"|"*"|","|":"|"="|";"|"..."|"#"
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
COMENTARIOS ("//".*)|"/*"([^*/"]|"/*")*"*/"
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
//funciones para literales cadena

struct NodoLitCad {
    char* cadena;
    int longitud;
    struct NodoLitCad* sgte;
};


struct NodoLitCad* CrearNodoLitCad(char*,int);
void RecorrerListaLitCad(struct NodoLitCad*);
int VerificarSiEstaVaciaLitCad(struct NodoLitCad*);
void InsertarAlPpioLitCad(struct NodoLitCad**,char*,int);
void insertarLitCad(struct NodoLitCad**,char*,int);

    char* cad;
    int longg;
    struct NodoLitCad* listaLitCadena = NULL;

//funciones para identificadores
   typedef struct Nodo {
    char Palabra[20];
    int cantidad;
    struct Nodo* sgte;
}NODO;


NODO* CrearNodo(char[]);
void RecorrerLista(NODO*); 
int VerificarSiEstaVacia(NODO*);    
int EstaElElemento(NODO*, char[]);
void InsertarAlPpio(NODO** l, char[]);
void insertarIdentOrdenado(NODO**, char[]);

void insertarAlFinal(NODO**,char[]);
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




%}

%{
    char ids[20];
    char palR[20];
    // char* ids;
    NODO* listaIdentificadores = NULL;
    int contadorIdentificadores = 0;
    NODO* listaPalReserv = NULL;

%}

%%

{COMENTARIOS} {printf("Encontre el comentario : %s \n",yytext);}
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
                    strcpy(palR,yytext);
                    insertarAlFinal(&listaPalReserv,palR);
                    fflush(stdin);
}
{CARACTER_SIMPLE} {printf("encontre el caracter: %s \n", yytext);}
{IDENTIFICADOR} {
                    strcpy(ids,yytext);
                    insertarIdentOrdenado(&listaIdentificadores,ids);
                    fflush(stdin);
                
        
 }

{DIRECTIVAALPRECOMPILADOR} {printf("Encontre la directiva al precompilador: %s \n ",yytext);}
{CARACTER_DE_PUNTUACION} {printf("encontre el caracter de puntuacion: %s \n", yytext);}
{OPERADOR}/{NUMERO} {printf("encontre el operador: %s \n", yytext);}

%%


int main(){
    
    yyin = fopen("entrada.c" , "r");
    yyout = fopen("salida.c" , "w");
    yylex();

    //mostrar identificadores
    if (VerificarSiEstaVacia(listaIdentificadores)==0) {
    RecorrerLista(listaIdentificadores);
    }
    //mostrar literales cadena
    if (VerificarSiEstaVaciaLitCad(listaLitCadena)==0) {
    RecorrerListaLitCad(listaLitCadena);
    }
    //mostrar palabras reservadas
    if (VerificarSiEstaVacia(listaPalReserv)==0){
        recorrerListaPalReserv(listaPalReserv);
    }
    //mostrar octales
    if(VerificarSiEstaVaciaConst(listaConstantesOct)==0) {
        mostrarOctales(listaConstantesOct);
    }
    //mostrar Hexadecimales
    if(VerificarSiEstaVaciaConst(listaConstantesHex)==0) {
        mostrarHexa(listaConstantesHex);
    return 0;
}
}

// Funciones para identificadores
NODO* CrearNodo(char palabra[]) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    strcpy(nuevo_nodo->Palabra, palabra);
    nuevo_nodo->cantidad = 1;
    nuevo_nodo->sgte = NULL;    
}

void RecorrerLista(NODO *l) {
    NODO *aux = l;
    printf("---- LISTA DE IDENTIFICADORES ----\n");
    while (aux != NULL) {
        printf("el id: %s aparece: %d veces\n",aux->Palabra,aux->cantidad);
        aux = aux->sgte; 
    }
}

int VerificarSiEstaVacia(NODO* l){
    if (l == NULL){
    return 1;
    } else {
        return 0;
    }
    }
void InsertarAlPpio(NODO** l, char palabra[]){
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra);
    nuevo_nodo->sgte = *l;
    *l = nuevo_nodo;

}

void insertarIdentOrdenado(NODO** l, char palabra[]){
        NODO* aux1 = *l;
        if (VerificarSiEstaVacia(aux1)){
            InsertarAlPpio(l,palabra);
        } else if (EstaElElemento(aux1,palabra)==0) {
                if(strcmp(palabra,aux1->Palabra)<0) {
                InsertarAlPpio(l,palabra);
            } else {
                    NODO* aux2 = aux1->sgte;
                    while(aux1->sgte != NULL && (strcmp(palabra,aux1->sgte->Palabra)>0)) {
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
            while (strcmp(aux1->Palabra,palabra)!=0){
                aux1 = aux1->sgte;
            } aux1->cantidad++;
        }
}

int EstaElElemento(NODO*l, char palabra[]){
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

struct NodoLitCad* CrearNodoLitCad(char* cadena,int longitud) {
    struct NodoLitCad* nuevo_nodo = NULL;
    nuevo_nodo = (struct NodoLitCad*) malloc(sizeof(struct NodoLitCad));
    nuevo_nodo->cadena= strdup(cadena);
    nuevo_nodo->longitud=longitud;
    nuevo_nodo->sgte = NULL;    
}

void RecorrerListaLitCad(struct NodoLitCad *lista) {
    struct NodoLitCad *aux = lista;
    printf("----LISTA DE LITERALES CADENA----\n");
    while (aux != NULL) {
        printf("%s , longitud: %i \n",aux->cadena,aux->longitud);
        aux = aux->sgte; 
    }
}

int VerificarSiEstaVaciaLitCad(struct NodoLitCad* lista){
    if (lista == NULL){
    return 1;
    } else {
        return 0;
    }
    }
void InsertarAlPpioLitCad(struct NodoLitCad** lista,char* cadena,int longitud){
    struct NodoLitCad* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodoLitCad(cadena,longitud);
    nuevo_nodo->sgte = *lista;
    *lista = nuevo_nodo;

}

void insertarLitCad(struct NodoLitCad** lista,char* cadena,int longitud){
        struct NodoLitCad* aux1 = *lista; 
        if(VerificarSiEstaVaciaLitCad(aux1) == 1) {
            InsertarAlPpioLitCad(lista,cadena,longitud);

        } 
        else {
                struct NodoLitCad* aux2 = aux1->sgte;
                while(aux1->sgte != NULL) {
                    aux1 = aux1->sgte;
                    aux2 = aux2->sgte;
                }
                if (aux2==NULL) {
                    struct NodoLitCad* nuevo_nodo = NULL;
                    nuevo_nodo = CrearNodoLitCad(cadena,longitud);
                    aux1->sgte=nuevo_nodo;
                } 
            }
        }

//fin de literales cadena

//Func para pal reservadas
void insertarAlFinal(NODO**l, char palabra[]) {
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

void recorrerListaPalReserv(NODO* l) {
    NODO* aux1 = l;
    printf("----LISTA DE PALABRAS RESERVADAS----\n");
    while(aux1 != NULL) {
        printf("%s \n",aux1->Palabra);
        aux1 = aux1->sgte;
    }
}
//fin de pala reservadas

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
