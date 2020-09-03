/*
* Programa elaborado para la actividad Evidencia de Aprendizaje, 
* encargado de calcular areas de distintas figuras geometricas.
*/
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#define PI 3.14159265358979323846

short respuestaValida;
char entrada[10];


/* -------------------------------------------------------------------
* Funcion secundaria auxiliar para imprimir el encabezado del programa
------------------------------------------------------------------- */
void imprimeEncabezado() {
	system("cls");
	printf("======================================================================\n");
	printf("          Programa para calcular areas de figuras geometricas\n");
	printf("======================================================================\n");
	printf("\n                           Menu de opciones:\n");
	printf("\n   [t] trapecio [h] hexagono [p] pentagono [c] circulo [e] elipse\n");
	printf("                        [x] salir del programa\n");
}


/* ------------------------------------------------------
* Funcion auxiliar para obtener la respuesta del usuario
------------------------------------------------------ */
void obtenCadena(char *cadena, int longitud) {
	int i = 0;
	fgets(cadena, longitud, stdin);
	while (*cadena) {
		if (*cadena == '\n') {
			*cadena = '\0';
			return;
		}
		i++;
	
		if (i == longitud) {
			*cadena = '\0';
			return;
		}
		cadena++;
	}
}

/* -------------------------------------------------------------------
* Funcion auxiliar que realiza las validaciones para entrada de datos.
------------------------------------------------------------------- */
short esOpcionValida(char entrada)
{
	short valido = 0;
	
	if (entrada==0) return 0;

	entrada = toupper(entrada);
    if(entrada == 'T' || entrada == 'H' || entrada == 'P' 
    || entrada == 'C' || entrada == 'E' || entrada == 'X')
        valido = 1;
    else
        printf("\n\t\tOpcion invalida, intenta nuevamente: ");

	return valido;
}

/* --------------------------------------------------------------------
* Funcion auxiliar que indica si el dato ingresado es un numero valido.
-------------------------------------------------------------------- */
short esNumeroValido(char *entrada) {
    short valido = 0;
    int i;
    for (i = 0; i < strlen(entrada); i++) {
        if(!isdigit(entrada[i]) && entrada[i] != '.') {
            printf("\n\t\tSolo puedes ingresar numeros y decimales: ");
            valido = 0;
            break;
        } else {
            valido = 1;
        }
    }
    if (valido == 1 && atof(entrada) <= 0) {
    	printf("\n\t\tEl valor tiene que ser mayor a 0: ");
    	valido = 0;
	}
    return valido;
}

/* ------------------------------------------------------
Funcion para calcular el area de un trapecio.
------------------------------------------------------ */
void areaTrapecio() {
    float baseMayor;
    float baseMenor;
    float altura;

    printf("\n\t\tIngresa la base mayor: ");
    while(respuestaValida != 1) {
	    scanf(" %s", entrada);
	    respuestaValida = esNumeroValido(entrada);
        if(respuestaValida == 1) baseMayor = atof(entrada);
	}
    respuestaValida = 0;

    printf("\n\t\tIngresa la base menor: ");
    while(respuestaValida != 1) {
	    scanf(" %s", entrada);
	    respuestaValida = esNumeroValido(entrada);
        if(respuestaValida == 1) baseMenor = atof(entrada);
	}
    respuestaValida = 0;

    printf("\n\t\tIngresa la altura: ");
    while(respuestaValida != 1) {
	    scanf(" %s", entrada);
	    respuestaValida = esNumeroValido(entrada);
        if(respuestaValida == 1) altura = atof(entrada);
	}
    respuestaValida = 0;

    imprimeEncabezado();
    printf("\n\t\tEl area del trapecio es:");
	printf("\n\t\t------------------------");
	printf("\n\t\t%.1f unidades cuadradas.\n", ((baseMayor + baseMenor) * altura) / 2 );
}

/* ------------------------------------------------------
Funcion para calcular el area de un hexagono o pentagono.
------------------------------------------------------ */
void areaPoligonoRegular(char figura) {
    float perimetro = 0;
    float apotema = 0;

    printf("\n\t\tIngresa el perimetro: ");
    while(respuestaValida != 1) {
	    scanf(" %s", entrada);
	    respuestaValida = esNumeroValido(entrada);
        if(respuestaValida == 1) perimetro = atof(entrada);
	}
    respuestaValida = 0;

    printf("\n\t\tIngresa el apotema: ");
    while(respuestaValida != 1) {
	    scanf(" %s", entrada);
	    respuestaValida = esNumeroValido(entrada);
        if(respuestaValida == 1) apotema = atof(entrada);
	}
    respuestaValida = 0;

    imprimeEncabezado();
    printf("\n\t\tEl area del ");
    if (figura == 'P')
        printf("pentagono");
    else
        printf("hexagono");
    printf(" es:");
    printf("\n\t\t-------------------------");
	printf("\n\t\t%.1f unidades cuadradas.\n", (perimetro * apotema) / 2);
}

/* ------------------------------------------------------
Funcion para calcular el area de un circulo.
------------------------------------------------------ */
void areaCirculo() {
    float radio;
    printf("\n\t\tIngresa el radio: ");
    while(respuestaValida != 1) {
	    scanf(" %s", entrada);
	    respuestaValida = esNumeroValido(entrada);
        if(respuestaValida == 1) radio = atof(entrada);
	}
    respuestaValida = 0;

    imprimeEncabezado();
    printf("\n\n\t\tEl area del circulo es:");
	printf("\n\t\t-------------------------");
	printf("\n\t\t%.1f unidades cuadradas.\n", PI * (radio * radio));
}

/* ------------------------------------------------------
Funcion para calcular el area de una elipse.
------------------------------------------------------ */
void areaElipse() {
    float semiejeMenor, semiejeMayor;
    printf("\n\t\tIngresa el semieje menor: ");
    while(respuestaValida != 1) {
	    scanf(" %s", entrada);
	    respuestaValida = esNumeroValido(entrada);
        if(respuestaValida == 1) semiejeMenor = atof(entrada);
	}
    respuestaValida = 0;

    printf("\n\t\tIngresa el semieje mayor: ");
    while(respuestaValida != 1) {
	    scanf(" %s", entrada);
	    respuestaValida = esNumeroValido(entrada);
        if(respuestaValida == 1) semiejeMayor = atof(entrada);
	}
    respuestaValida = 0;

    imprimeEncabezado();
    printf("\n\t\tEl area de la elipse es:");
	printf("\n\t\t-------------------------");
	printf("\n\t\t%.1f unidades cuadradas.\n",  PI * semiejeMenor * semiejeMayor);
}

// Funcion principal
int main() {
    short continuar = 1;

    imprimeEncabezado();

    while (continuar == 1) {
		respuestaValida = 0;
		
		printf("\n\t\tElige una opcion del menu: ");

		while (respuestaValida != 1) {
			//scanf("%c", &opcion);
			obtenCadena(entrada,2);
			respuestaValida = esOpcionValida(entrada[0]);
		}
        respuestaValida = 0;

        imprimeEncabezado();

        switch (toupper(entrada[0])) {
            case 'T':
            	printf("\n\t\tFigura seleccionada - Trapecio\n");
                areaTrapecio();
                break;
            case 'H':
            	printf("\n\t\tFigura seleccionada - Hexagono\n");
                areaPoligonoRegular(toupper(entrada[0]));
                break;
            case 'P':
            	printf("\n\t\tFigura seleccionada - Pentagono\n");
                areaPoligonoRegular(toupper(entrada[0]));
                break;
            case 'C':
            	printf("\n\t\tFigura seleccionada - Circulo\n");
                areaCirculo();
                break;
            case 'E':
            	printf("\n\t\tFigura seleccionada - Elipse\n");
                areaElipse();
                break;
            case 'X':
                printf("\n\t\tAdios...\n\n");
                continuar = 0;
        }
    }

	system("pause");

    return 0;
}

