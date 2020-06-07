#include <stdio.h>
#include<stdlib.h>
#include<malloc.h>
#include<string.h>

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
void sintaxis(int estado,char caracter,char cadena[50]);

 struct EST matriz[4][2][6]={
{{{3,"$"},{1,"$"},{3,"$"},{0,"R$"},{3,"$"},{3,"$"}},
{{3,"R"},{1,"R"},{3,"R"},{0,"RR"},{3,"R"},{3,"R"}}},
{{{1,"$"},{1,"$"},{0,"$"},{3,"$"},{3,"$"},{3,"$"}},
{{1,"R"},{1,"R"},{0,"R"},{3,"R"},{2,"E"},{3,"R"}}},
{{{3,"$"},{3,"$"},{0,"$"},{3,"$"},{3,"$"},{3,"$"}},
{{3,"R"},{3,"R"},{0,"R"},{3,"R"},{2,"E"},{3,"R"}}}
                            };


int main() {


int opc;
char caracter;
char cadena[50];

do{
  struct Nodo *pila = NULL;
  int i=0;
 int ESTADO_ACTUAL=0;
 printf("ingrese una cadena: ");
 scanf("%s",cadena);
 char c='$';
 push(&pila,c);
char car;

 while ( ESTADO_ACTUAL != 3 && cadena[i]!='\0' )
 { 
    caracter=pop(&pila); //para pasarselo a cimapila
    push(&pila,caracter);
    a = matriz  [ESTADO_ACTUAL][cimapila(caracter)][posCol(cadena[i])] ;

    ESTADO_ACTUAL= a.Estado_sig;
  
    if(a.cadpush[0]=='E')
    { 
      a.cadpush[0]='R';
      car=pop(&pila); //con epsilon se cierra un parentesis
    }
    if(strcmp(a.cadpush,"R$")) //compara si son iguales,entra
    {
      push(&pila,a.cadpush[0]); //se abre parentesis
    }
    if(strcmp(a.cadpush,"RR"))
    {
      push(&pila,a.cadpush[0]); //se abre parentesis
    }
    if(strcmp(a.cadpush,"R"))
    {
      push(&pila,a.cadpush[0]);
    }
    
   i++;
  }
  if(pop(&pila)=='R')
  {
    ESTADO_ACTUAL=3;
  }
  sintaxis(ESTADO_ACTUAL,car,cadena);
  if(ESTADO_ACTUAL==3 || ESTADO_ACTUAL==0)
  { if(pop(&pila)=='R')
    printf("el error es que le falta cerrar parentesis\n");
    else
    printf("el error se encontro en %c, caracter en posicion %i\n",cadena[i-1],i);
  }
  
  fflush(stdin);
  printf("otra cadena?1/0: ");
  scanf("%i",&opc);

}while(opc);

  return 0;
}



int posCol (char caracter){
  switch (caracter){

      case '0':
      return 0;
      break;

      case '1':
      case '2':
      case '3':
      case '4': 
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':

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
    case 'R': return 1; 
        break;
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


void sintaxis(int estado,char caracter,char cadena[50])
{
switch(estado){
  case 1:
  case 2:
  if(strcmp(&caracter,"$"))
  {
    printf("La cadena %s es sintacticamente correcta\n",cadena);
  }
  else
    printf("La cadena %s es sintacticamente incorrecta\n",cadena); 
  break;
  case 0:
  case 3:
    printf("La cadena %s es sintacticamente incorrecta\n",cadena); 
  break;
  }
}

