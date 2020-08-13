%option noyywrap


IDENTIFICADOR ([a-zA-Z]|_)([a-zA-Z]|[0-9]|_)*

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

   typedef struct Nodo {
    char *Palabra;
    struct Nodo* sgte;
}NODO;


NODO* CrearNodo(char*);
void RecorrerLista(NODO*);
int VerificarSiEstaVacia(NODO*);
int EstaElElemento(NODO*, char*);
void InsertarAlPpio(NODO** l, char* palabra);
void insertarOrdenado(NODO**, char*);

    // char ids[50];
    char* ids;
    NODO* listaIdentificadores = NULL;
    int contadorIdentificadores = 0;
    
%}

%%

{IDENTIFICADOR} {   
            
            
            // strcpy(ids,yytext);
            ids = yytext;
            printf("---%s---\n",ids);
            // insertarOrdenado(&listaIdentificadores,ids);
            insertarOrdenado(&listaIdentificadores,ids);
            // insertarOrdenado(&listaIdentificadores, "abc");
            // insertarOrdenado(&listaIdentificadores,"basd");
 

                    
                    
 }

%%


int main(){
    
    yyin = fopen("entrada.c" , "r");
    yyout = fopen("salida.c" , "w");
    yylex();

   	// if (VerificarSiEstaVacia(listaIdentificadores) == 0 ) {
    //        printf("Se encontraron %d identificadores\nLista de identificadores: \n",contadorIdentificadores);
           RecorrerLista(listaIdentificadores);
    //    } else {
    //        printf("La lista esta vacia");
    //    }
    

    return 0;
}

NODO* CrearNodo(char* palabra) {
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    nuevo_nodo->Palabra= palabra;
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
void InsertarAlPpio(NODO** l, char* palabra){
    NODO* nuevo_nodo = NULL;
    nuevo_nodo = CrearNodo(palabra);
    nuevo_nodo->sgte = *l;
    *l = nuevo_nodo;

}

void insertarOrdenado(NODO** l, char* palabra){
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
