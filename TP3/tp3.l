%option noyywrap

PALABRAS_RESERVADAS auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
CARACTER_DE_PUNTUACION "("|")"|"["|"]"|"{"|"}"|"*"|","|":"|"="|";"|"..."|"#"
CONSTANTE_DECIMAL [1-9][0-9]*
CONSTANTE_OCTAL 0[0-7]*
CONSTANTE_HEXADECIMAL 0[xX][0-9a-fA-F]+
CONSTANTE_REAL [1-9][0-9]*"."[0-9]*"E"?[\+\-]?[0-9]*
LITERAL_CADENA \".*\"
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
    struct Nodo* sgte;
}NODO;


NODO* CrearNodo(char[]);
void RecorrerLista(NODO*); 
int VerificarSiEstaVacia(NODO*);
int EstaElElemento(NODO*, char[]);
void InsertarAlPpio(NODO** l, char[]);
void insertarOrdenado(NODO**, char[]);

    
%}

%{
    char ids[20];
    // char* ids;
    NODO* listaIdentificadores = NULL;
    int contadorIdentificadores = 0;
%}

%%

{COMENTARIOS} {printf("Encontre el comentario : %s \n",yytext);}
{CONSTANTE_DECIMAL} {printf("Encontre una constante decimal : %s \n" , yytext);}
{CONSTANTE_OCTAL} {printf("Encontre una constante octal : %s \n" , yytext);}
{CONSTANTE_HEXADECIMAL} {printf("Encontre una constante hexadecimal : %s \n" , yytext);}
{CONSTANTE_REAL} {printf("Encontre una constante real : %s\n",yytext);}
{LITERAL_CADENA} {  cad=yytext;
                    longg=yyleng;
                    printf("---%s---%i",cad,longg);
                    insertarLitCad(&listaLitCadena,cad,longg);
}
{PALABRAS_RESERVADAS} {printf("encontre una palabra reservada : %s \n", yytext);}
{CARACTER_SIMPLE} {printf("encontre el caracter: %s \n", yytext);}
{IDENTIFICADOR} {
                strcpy(ids,yytext);
            if (VerificarSiEstaVacia(listaIdentificadores)==1) {

                insertarOrdenado(&listaIdentificadores,ids);
                contadorIdentificadores++;
            } else if (EstaElElemento(listaIdentificadores,ids)==1) {
                contadorIdentificadores++;
                

            } else {
                insertarOrdenado(&listaIdentificadores,ids);
                contadorIdentificadores++;
            }
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
//mostrar literales cadena
RecorrerListaLitCad(listaLitCadena);
   	if (contadorIdentificadores != 0 ) {
           printf("Se encontraron %d identificadores\nLista de identificadores: \n",contadorIdentificadores);
           RecorrerLista(listaIdentificadores);
       } else {
           printf("La lista esta vacia");
       }
    

    return 0;
}


NODO* CrearNodo(char palabra[]) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    strcpy(nuevo_nodo->Palabra, palabra);
    nuevo_nodo->sgte = NULL;    
}

void RecorrerLista(NODO *l) {
    NODO *aux = l;
    while (aux != NULL) {
        printf("%s \n",aux->Palabra);
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

void insertarOrdenado(NODO** l, char palabra[]){
        NODO* aux1 = *l; 
        if(VerificarSiEstaVacia(aux1) == 1 || strcmp(palabra,aux1->Palabra)<0) {
            InsertarAlPpio(l,palabra);

        } 
        else {
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
    printf("Lista de literales cadena\n\n");
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