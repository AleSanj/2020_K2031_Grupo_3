%option noyywrap

%{
    #include <stdio.h>
%}
%{ 
    // no quedo bien "/""*".*"*""/"  {printf("Encontre el comentario compuesto : %s \n",yytext);}
%}
PALABRAS_RESERVADAS auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|return|short|signed|sizeof|static|struct|typedef|union|unsigned|void|volatile|while

%%
"//".*$ {printf("Encontre el comentario simple : %s \n",yytext);}


[1-9][0-9]* {printf("Encontre una constante decimal : %s \n" , yytext);}
0[0-7]* {printf("Encontre una constante octal : %s \n" , yytext);}
0[xX][0-9a-fA-F]+ {printf("Encontre una constante hexadecimal : %s \n" , yytext);}
\".*\" {printf("Se encontre el literal cadena: %s \n", yytext);}
{PALABRAS_RESERVADAS} {printf("encontre una palabra reservada : %s \n", yytext);}


%%

int main(){

    yyin = fopen("entrada.c" , "r");
    yyout = fopen("salida.c" , "w");
    yylex();

    return 0;
}