#include <iostream>
#include <stdio.h>
#include <string.h>
using namespace std;


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
	string vector[100];
	int contadorDePalabras=0;
	

int posCol (char);
// void cargarVector(int,string[],int);
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
							
					
            

			
		   




				} 	while (c != ',' && !feof(f)) ;
						contadorDePalabras++;

            cargarArchivo(estado,e);
						
            // cargarVector(estado,vector,contadorDePalabras-1); //-1 porq empieza en 1
						estado=0;
						
					
					
		}
		// for (int p=0;p<contadorDePalabras;p++){
			// cout<<endl<<vector[p];
			
		// }
		
		// for (int p=0;p<contadorDePalabras;p++){
			// fwrite(&vector[p],sizeof(string),1,e);
			
		// }

	} else {

		printf("No se pudo leer el archivo de entrada");	
	
	}

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

//void cargarVector(int estado, string vector[], int n) {
//	switch(estado){
//		case 1:
//			vector[n]= "Decimal,";
//		break;
//		
//		case 2:
//			vector[n]= "Octal,";
//		break;
//	
//		case 4:
//			vector[n]= "Hexadecimal,";
//		break;
//		
//		case 5:
//			vector[n]= "Octal,";
//		break;
//		
//		case 6:                   
//			vector[n]= "No reconocida,";
//		break;
//
//	}
//
//
//}

	



  void cargarArchivo(int estado, FILE* archivo) { 
    string f;
	switch(estado){
		case 1:
      f = "Decimal";
			fwrite(&f,sizeof(f),1,archivo);
		break;
		
		case 2:
			   f = "Octal";
			fwrite(&f,sizeof(f),1,archivo);
		break;
	
		case 4:
			   f = "Hexadecimal";
			fwrite(&f,sizeof(f),1,archivo);
      break;
		
		case 5:
       f = "Octal";
			fwrite(&f,sizeof(f),1,archivo);
      break;
		
		case 6:                   
		  f = "No reconocida";
			fwrite(&f,sizeof(f),1,archivo);
		break;

	}
  }                                       
