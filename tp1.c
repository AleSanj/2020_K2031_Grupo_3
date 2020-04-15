#include<stdio.h>

#define ESTADO0 0
#define ESTADO1 1
#define ESTADO2 2
#define ESTADO3 3
#define ESTADO4 4
#define ESTADO5 5
#define  ERROR 6

  char c0=0,c1[]={1,2,3,4,5,6,7},c2[]={8,9},c3[]={'x','X'},
         c4[]={'a','b','c','d','e','f','A','B','C','D','E','F'},c5=ERROR;  //contenido de cada columna
     

char colum(int n,char nro);  //funcion
int main()
{
    FILE*arch=fopen("entrada.txt","r");
    char estado=ESTADO0;
    
    
    char TT[6][5]={{2,1,1,6,6,6},
                   {1,1,1,6,6,6},
                   {5,5,6,3,6,6},
                   {4,4,4,6,4,6},
                   {4,4,4,6,4,6},
                   {5,5,6,6,6,6},
                   {6,6,6,6,6,6}};   //es la tabla de transicion
    char delimitador[]=",";
    char columna[5]={c0,c1,c2,c3,c4,c5};   //columnas
  char nro;           

    nro=fgetc(arch);  //a nro le asigno el caracter
    while(!feof(arch)){
        
        while(nro!=delimitador && estado!=ERROR)
        {
             for(int i=0;i<=6;i++)
                {
<<<<<<< HEAD
                    if(estado==i)
                    {
                        for(int j=0;j<=5;j++)
                     {
                        if(nro==colum(columna[j],nro))   //si el nro es un nro o letra de la columna
                          {
                              
                        estado=TT[i][j];    //a estado le asigno el estado q le sigue
                        j=9;     // para que finalice el for
                          }
=======
                    printf("es un nro decimal");
                }

                break;
                case ESTADO2: if(nro=='x' || nro=='X')
                {
                    estado=ESTADO3;
                }
                else if(nro<=7)
                {
                    estado=ESTADO5;
                }
                else
                {
                    estado=ERROR;
                }
                break;
                case ESTADO3;
                int i=0;
                while(nro!=letras[i] && i<13)
                {
                    i++;
                }
                if(nro==letras[i] || nro<=9)
                {
                    estado=ESTADO4;
                }
                else
                {
                    estado=ERROR;
                }
                break;
                case ESTADO4:
                int i=0;
               while(nro!=delimitador || estado!=ERROR){
                while(nro!=letras[i] && i<13)
                {
                    i++;
                }
>>>>>>> 0f7256e7d726222f8c374ef92e467344a4efa9fe

                       }
                     i=9;   //para que finalice el for
                     }
                    
                }
                if(nro!=TT[10][10])    //si nro NO ES TT[10][10] es xq no entro al if nunca, x lo que el nro no es reconocido   
                 {
                     printf("el numero no es una palabra reconocida");
                     while(nro!=delimitador)  //el nro ya no es reconocido, entonces lo llevo hasta la coma
                     {
                         nro=fgetc(arch);
                     }

                 }   
                
                 
        }
       nro=fgetc(arch);

    }

    return 0;
}


char colum(int n,char nro)
{
    switch(n)
    {
        case 0: return 0;
        break;
        case 1: for(int i=1;i<=7;i++)
        {
            if(nro==c1[i])
            {
                return c1[i];
            }
            else
            {
                return -1;
            }
            
        }
        break;
        case 2: for(int i=8;i<=9;i++)
        {
            if(nro==c2[i])
            {
                return c2[i];
            }
            else
            {
                return -1;
            }}
        break;
        case 3: for(int i=0;i<2;i++)
        {
            if(nro==c3[i])
            {
                return c3[i];
            }
            else
            {
                return -1;
            }}
        break;
        case 4: for(int i=0;i<12;i++)
          {
            if(nro==c4[i])
            {
                return c4[i];
            }
            else
            {
                return -1;
          }
        break;
        case 5: return -1;
        break; 

        }

    }
}

