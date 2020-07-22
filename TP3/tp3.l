%option noyywrap

%{
    #include <stdio.h>

    //agregue insertar y buscar  para lista de dentificadores (PD no se si esta bien)
%}


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
COMENTARIOS ("//".*)|("/*"(\n|.)*"*/")

%%
{COMENTARIOS} {printf("Encontre el comentario : %s \n",yytext);}
{CONSTANTE_DECIMAL} {printf("Encontre una constante decimal : %s \n" , yytext);}
{CONSTANTE_OCTAL} {printf("Encontre una constante octal : %s \n" , yytext);}
{CONSTANTE_HEXADECIMAL} {printf("Encontre una constante hexadecimal : %s \n" , yytext);}
{CONSTANTE_REAL} {printf("Encontre una constante real : %s\n",yytext);}
{LITERAL_CADENA} {printf("Se encontre el literal cadena: %s \n", yytext);}
{PALABRAS_RESERVADAS} {printf("encontre una palabra reservada : %s \n", yytext);}
{CARACTER_SIMPLE} {printf("encontre el caracter: %s \n", yytext);}
{IDENTIFICADOR} {printf("encontre un identificador: %s \n", yytext); i.identificador=yytext;
 i.vecesQAparece=1; insertar(i,lista); ordenar(lista);}
{DIRECTIVAALPRECOMPILADOR} {printf("Encontre la directiva al precompilador: %s \n ",yytext);}
{CARACTER_DE_PUNTUACION} {printf("encontre el caracter de puntuacion: %s \n", yytext);}
{OPERADOR}/{NUMERO} {printf("encontre el operador: %s \n", yytext);}

%%
struct Id
{
    char identificador[50];
    int vecesQAparece;
}i;

struct Nodo
{
    struct Id info;
    struct Nodo*sig;
};


void insertar(struct Id n,struct Nodo*lista);
void buscar(struct Nodo*lista,struct Id n.identificador); 
void ordenar(struct Nodo*lista);
void listar(struct Nodo*lista);


int main(){

    yyin = fopen("entrada.c" , "r");
    yyout = fopen("salida.c" , "w");
    yylex();
    struct Nodo*lista=NULL;
    

    return 0;
}

void insertar(struct Id n,struct Nodo*lista)
{
    struct Nodo*nuevo=(struct Nodo*) malloc(sizeof(struct Nodo));
    struct Nodo*p=buscar(lista,n.identificador);
    nuevo->info=n;
    if(nuevo->info.identificador!=p->info.identificador){
        nuevo->sig=lista;
        lista=nuevo;
    }
    else
        p->info.vecesQAparece+=nuevo->info.vecesQAparece;   
    
}

buscar(struct Nodo*lista,struct Id n.identificador)
{
    Nodo p*=lista;
    while(p!=NULL && p->info.identificador!=n.identificador)
    {
        p=p->sig;
    }
    if(p!=NULL && p->info.identificador==n.identificador)
    {
        return p;
    }
    else
        return NULL;
}