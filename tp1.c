#include <stdio.h>
#include <string.h>


	#define Q0 0
	#define Q1 1
	#define Q2 2
	#define Q3 3
	#define Q4 4
	#define Q5 5
	#define Q6 6
	
	char c;
	char matriz[7][6] = {
							{2,1,1,6,6,6}, //q0
							{1,1,1,6,6,6}, //q1
							{5,5,6,3,6,6}, //q2
							{4,4,4,6,4,6}, //q3
							{4,4,4,6,4,6}, //q4
							{5,5,6,6,6,6}, //q5
							{6,6,6,6,6,6}, //q6
						};
						
	int estado=Q0;
	int contadorDePalabras=0;
	

	int posCol (char);
	void cargarArchivo(int,FILE*);

int main() {
	
	FILE *f = fopen("entrada.txt","rt");
	FILE *e = fopen("salida.txt","w+");
	
	if (f != NULL) {
			while (!feof(f)) {
				
				do{

					c = fgetc(f);
				if (estado!=6 && c!= ',') {
					switch (estado){
						
						case Q0:
							estado = matriz[estado][posCol(c)];
							
						break;
						
						case Q1:
							estado = matriz[estado][posCol(c)];
						break;
						
						case Q2:
							estado = matriz[estado][posCol(c)];
						break;
						
						case Q3:
							estado = matriz[estado][posCol(c)];
						break;	
						
						case Q4:
							estado = matriz[estado][posCol(c)];
						break;
						
						case Q5:
							estado = matriz[estado][posCol(c)];
						break;
						default: 
							estado=Q6;
							
							break;
									}
											} 
							
					printf("%c",c);
            

				} 	while (c != ',' && !feof(f)) ;
						contadorDePalabras++;

            cargarArchivo(estado,e);
						estado=0;
						
					
					
		}

	} else {

		printf("No se pudo leer el archivo de entrada");	
	
	}

//	getch();	
	return 0;
}

int posCol (char numero) {
		switch (numero){
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
				return 1;
			break;
			
			case '8':
			case '9':
				return 2;
			break;
			
			case 'x':
			case 'X':
				return 3;
			break;
			
			case 'a':
			case 'b':
			case 'c':
			case 'd':
			case 'e':
			case 'f':
			case 'A':
			case 'B':
			case 'C':
			case 'D':
			case 'E':
			case 'F':
				return 4;
			break;
			
			default:
				return 5;			
		}
	}

  void cargarArchivo(int estado, FILE* archivo) { 
    
	switch(estado){
		case 1:
			{
      			char str[] = "Decimal,";
      			fwrite(&str,sizeof(char),sizeof(str),archivo);
      		}

		break;
		
		case 2:
			 {
      			char str[] = "Octal,";
      			fwrite(&str,sizeof(char),sizeof(str),archivo);
      		 }
		break;
	
		case 4:
			   {
      			char str[] = "Hexadecimal,";
      			fwrite(&str,sizeof(char),sizeof(str),archivo);
				}
      break;
		
		case 5:
      		 	{
      			char str[] = "Octal,";
      			fwrite(&str,sizeof(char),sizeof(str),archivo);
      		};
      break;
		
		case 6:                   
		 		{
      			char str[] = "No reconocida,";
      			fwrite(&str,sizeof(char),sizeof(str),archivo);
      			}
		break;

	}
  }                                       
