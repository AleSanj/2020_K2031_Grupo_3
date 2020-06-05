#include <stdio.h>
#include<stdlib.h>
#include<malloc.h>

struct Nodo{
  char dato;
  struct Nodo*sig;
};

struct EST{
  int Estado_sig;
  char cadpush[3];
};

struct EST a;

void push(struct Nodo **, char);
char pop(struct Nodo **);
int posCol(char);
int cimapila(char);

 struct EST matriz[4][2][6]={
                            {{{3,"$"},{1,"$"},{3,"$"},{0,"R$"},{3,"$"},{3,"$"}},{{3,"R"},{1,"R"},{3,"R"},{0,"RR"},{3,"R"},{3,"R"}}},
                            {{{1,"$"},{1,"$"},{0,"$"},{3,"$"},{3,"$"},{3,"$"}},{{1,"R"},{1,"R"},{0,"R"},{3,"R"},{2,"E"},{3,"R"}}},
                            {{{3,"$"},{3,"$"},{0,"$"},{3,"$"},{3,"$"},{3,"$"}},{{3,"R"},{3,"R"},{0,"R"},{3,"R"},{2,"E"},{3,"R"}}}
                            };


int main() {

struct Nodo *pila = NULL;
int i=0;
int ESTADO_ACTUAL=0;
char opc;
do{char cadena[50];
printf("ingrese una cadena: ");
scanf("%c",cadena);

while ( ESTADO_ACTUAL != 3 && cadena!="/0" ){
char caracter;
caracter=pop(&pila);
push(&pila,caracter);
  a = matriz  [posCol(cadena[i])][ESTADO_ACTUAL][cimapila(caracter)] ;

  ESTADO_ACTUAL= a.Estado_sig;

if(a.cadpush[0]=='E')
{
    pop(&pila);
 //no se pushea
}
else
{
  push(&pila,a.cadpush[0]);
}

    i++;

}

 if(ESTADO_ACTUAL==3)
 {
     printf("La cadena %c, es sintacticamente incorrecta",cadena);

 }
 else
 {
     printf("La cadena %c es sintacticamente reconocida\n",cadena);
 }

 printf("otra cadena?s/n");
 scanf("%c",opc);
}while(opc=='s');

  return 0;
}



int posCol (char caracter){
  switch (caracter){

      case 0:
      return 0;
      break;

      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:

      return 1;
      break;

      case '+':
      case '-':
      case '*':
      case '/':

      return 2;
      break;

      case '(':
      return 3;
      break;

      case ')':
      return 4;
      break;

      default: return 5;
  }

}



int cimapila(char caracter)
{ 

    switch (caracter)
    {
    case '$': return 0;
        break;
    case 'R': return 1; break;
    default: return 2;
        break;
    }
}

void push(struct Nodo **topePtr, char info)
{
   struct Nodo *nuevoPtr;

   //Reserva en memoria espacio para un nuevo nodo
   nuevoPtr = (struct Nodo *)malloc(sizeof(struct Nodo));
   if (nuevoPtr != NULL) {
	  nuevoPtr->dato = info;
	  nuevoPtr->sig = *topePtr;
	  *topePtr = nuevoPtr;
   }
   else
	  printf("%d no insertado. No hay memoria disponile.\n", info);
}

/* Eliminar un nodo de la pila */
char pop(struct Nodo **topePtr)
{
   struct Nodo *tempPtr;
   char caracter;

   tempPtr = *topePtr;
   caracter = (*topePtr)->dato;
   *topePtr = (*topePtr)->sig;
   free(tempPtr);
   return caracter;
}