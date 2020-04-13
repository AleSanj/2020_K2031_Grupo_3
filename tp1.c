#include<stdio.h>

#define ESTADO0 0
#define ESTADO1 1
#define ESTADO2 2
#define ESTADO3 3
#define ESTADO4 4
#define ESTADO5 5
#define  ERROR 6

int main()
{
    FILE*arch=fopen("entrada.txt","r");
    char estado=ESTADO0;
    char nro=0;
    char letras[]={'A','B','C','D','E','F','a','b','c','d','e','f'};
    char delimitador[]=",";
    nro=fgetc(arch);
    while(!feof(arch)){
        if(nro==delimitador)
        {
            estado=ESTADO0;
        }
        while(nro!=delimitador)
        {
            switch(estado)
            {
                case ESTADO0: if(nro==0)
                {
                    estado=ESTADO2;
                    nro=fgetc(arch);
                }
                else if(nro<=9)
                {
                    estado=ESTADO1;
                    nro=fgetc(arch);
                }
                else
                {
                    estado=ERROR;
                }
                break;
                case ESTADO1: while(nro<=9 && nro!=delimitador)
                {
                    nro=fgetc(arch);
                }
                if(nro!=delimitador)
                {
                    estado=ERROR;
                }
                else
                {
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

               if(nro==letras[i] || nro<=9 && nro!=delimitador)
                {
                    nro=fgetc(arch);
                }
            }
                if(nro!=delimitador)
                {
                    estado=ERROR;
                }

                break;
               // case ESTADO5:
                //break;
                //case ERROR:
                  //  printf("palabra no reconocida\n");
               // break;
            }
         nro=fgetc(arch);
        }
       nro=fgetc(arch);

    }

    return 0;
}
