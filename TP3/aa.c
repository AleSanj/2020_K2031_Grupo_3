#include<stdio.h>
#include<stdlib.h>
#include<string.h>
struct Id
{
    char* identificador;
    int vecesQAparece;
};

struct Nodo
{
    struct Id info;
    struct Nodo*sig;
};


void insertar(struct Id n,struct Nodo*lista);
void ordenar(struct Nodo*lista);
void listar(struct Nodo*lista);

int main()
{
  //  Listado de identificadores encontrados indicando la cantidad de veces que aparece cada uno de ellos.
  // El listado debe estar ordenado alfabéticamente.
    struct Nodo*lista=NULL;
  struct Id ab,bb,cb;
  
    ab.identificador="h";
    ab.vecesQAparece=2;
    bb.identificador="b";
    bb.vecesQAparece=3;
    cb.identificador="x";
    cb.vecesQAparece=7;
    insertar(ab,lista);
    insertar(bb,lista);
    insertar(cb,lista);
    ordenar(lista);
    listar(lista);

    return 0;
}

void insertar(struct Id n,struct Nodo*lista)
{
    struct Nodo*nuevo=(struct Nodo*) malloc(sizeof(struct Nodo));
    nuevo->info=n;
    nuevo->sig=lista;
    lista=nuevo;
    printf("insertado");
}
void listar(struct Nodo*lista)
{
    while(lista!=NULL){
        printf("%d %i",lista->info.identificador,lista->info.vecesQAparece);
        lista=lista->sig;
    }
}

void ordenar(struct Nodo* lista)
{
     struct Nodo*actual , *siguiente,*aux;
    
     
     actual = lista;
     while(actual->sig!= NULL)
     {
          siguiente = actual->sig;
          
          while(siguiente!=NULL)
          {
               if(actual->info.identificador > siguiente->info.identificador)
               {
                    aux->info = siguiente->info;
                    siguiente->info = actual->info;
                    actual->info = aux->info;          
               }
               siguiente = siguiente->sig;                    
          }    
          actual = actual->sig;
          siguiente = actual->sig;     
     }
     printf("ordenado");
     }