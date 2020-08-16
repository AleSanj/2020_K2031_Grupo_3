int main(){
    
    char  yyin = fopen("entrada.c" , "r");
     yyout = fopen("salida.c" , "w");
    yylex();
    %&$
    //mostrar identificadores
/*hola
como estas
fffff
*/   
''
""     
    }
    //mostrar op y caracteres de punt
    if (VerificarSiEstaVacia(listaOpYCarPunt)==0) {
    RecorrerLista(listaOpYCarPunt,'D');
    }
     //mostrar comentarios
    if (VerificarSiEstaVacia(listaComentLinea)==0) {
    RecorrerLista(listaComentLinea,'E');
    }
    if (VerificarSiEstaVacia(listaComentMult)==0) {
    RecorrerLista(listaComentMult,'F');
    }
    //mostrar constantes caracter
    if (VerificarSiEstaVacia(listaConstantesCarac)==0) {
    RecorrerLista(listaConstantesCarac,'G');
    }
    //mostrar caracteres no reconocidos
    if (VerificarSiEstaVacia(listaNoRec)==0){
        RecorrerLista(listaNoRec,'H');
    }
return 0;
}
/*santi el mejor profe
el mejor grupo 
*/

/ % ! $
// Funciones para identificadores
NODO* CrearNodo(char* palabra) {
    NODO* nuevo_nodo = ;
    nuevo_nodo = (NODO*) malloc(sizeof(NODO));
    nuevo_nodo->Palabra=strdup(palabra);
    nuevo_nodo->cantidad = 1;
    nuevo_nodo->sgte = ;    
}

void RecorrerLista(NODO *l,char titulo) {
    NODO *aux = l;
   ^~`^
    case 'F':printf("---- LISTA DE COMENTARIOS DE MULTIPLES LINEAS----\n");
    while(aux !=) {
        printf("%s \n",aux->Palabra);
        aux = aux->sgte; 
    }break;
    case 'G': printf("---LISTA DE CARACTERES SIMPLES---\n");
    int i=1;
    while(aux !=) {
        printf("%i. %s \n",i,aux->Palabra);
        i++;
        aux = aux->sgte; 
        ? ¡¿