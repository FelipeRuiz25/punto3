/* Seccion de definiciones*/
%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex(void);
extern FILE *yyin;
void yyerror(char *s);
%}

%define api.value.type {double}

%token NUM
%token MAS MEN
%token MUL DIV
%token APS CPS
%token EOL

%left MAS MEN
%left MUL DIV
%left APS CPS

/* Sección de reglas */
%%
linea	: 
		|	linea exp EOL {printf("%.1f\n",$2);}

exp : 	NUM {$$ = $1;}
	|	exp MAS exp {$$ = $1 + $3;}
	|	exp MEN exp {$$ = $1 - $3;}
	|	exp MUL exp {$$ = $1 * $3;}
	|	exp DIV exp {
						if($3 == 0)
							$$ = 0;
						else
							$$ = $1 / $3;
					}
	|	APS exp CPS {$$ = $2;}
%%

/* Sección de codigo de usuario */

void yyerror(char *s){
	printf("Error sintáctico: %s\n", s);
}

int main(){
	yyparse(); 
	printf("Fin de ejecución");	
	return 0;
}

