#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

short esValida(char input, short tipo);

int main() {
    char  sexo;
    char  paso_edad[3];
    int   edad;
    char  peso;
    char  diabetes;
    char  hipertension;
    char  fuma;
    char  padece_epoc;
    char  enfermedad_cardiovascular;
    char  inmunosupresion;
    int   puntos = 0;
    int   factor_riesgo;
    char  nivel_riesgo[20];
    short respuestaValida = 0;
    
    char  encabezado1[80] = "======================================================================\n";
    char  encabezado2[150] = "          Calculadora de complicacion de salud por COVID -19\n  Instrucciones: Proporcione la informacion que se vaya solicitando.\n";

	printf(encabezado1);
    printf(encabezado2);
	printf(encabezado1);
    printf("\n\n");
    
    while(respuestaValida != 1) {
    	printf("  Sexo, femenino [F] o masculino [M]: ");
	    scanf(" %c", &sexo);
	    respuestaValida = esValida(sexo, 1);
	}
    respuestaValida = 0;

	while(respuestaValida != 1) {
    	printf("\n  Edad: ");
    	scanf("%s", paso_edad);
    	int i;
    	for (i = 0; i < strlen(paso_edad); i++) {
			if(!isdigit(paso_edad[i])) {
				printf("Solo puedes ingresar numeros\n");
				respuestaValida = 0;
				break;
			} else {
		    	respuestaValida = 1;
			}
		}
	}
	edad = atoi(paso_edad);
	respuestaValida = 0;

	printf("\n  Indique su situacion de peso actual.\n");
	printf("  bajo [B], normal [N], sobrepeso [S], obesidad [O]: ");
    while(respuestaValida != 1) {
		scanf(" %c", &peso);
		respuestaValida = esValida(peso, 2);
	}
    respuestaValida = 0;

    printf("\n  Padece diabetes? (S/N) ");
    while(respuestaValida != 1) {
	    scanf(" %c", &diabetes);
	    respuestaValida = esValida(diabetes, 3);
	}
	respuestaValida = 0;
	
    printf("\n  Padece hipertension? (S/N) ");
    while(respuestaValida != 1) {
	    scanf(" %c", &hipertension);
	    respuestaValida = esValida(hipertension, 3);
	}
	respuestaValida = 0;
        
    printf("\n  Fuma? (S/N) ");
    while(respuestaValida != 1) {
	    scanf(" %c", &fuma);
	    respuestaValida = esValida(fuma, 3);
	}
	respuestaValida = 0;

    printf("\n  Padece alguna enfermedad pulmonar obstructiva cronica (EPOC)? (S/N) ");
    while(respuestaValida != 1) {
	    scanf(" %c", &padece_epoc);
	    respuestaValida = esValida(padece_epoc, 3);
	}
	respuestaValida = 0;

    printf("\n  Padece alguna enfermedad cardiovascular? (S/N) ");
    while(respuestaValida != 1) {
	    scanf(" %c", &enfermedad_cardiovascular);
	    respuestaValida = esValida(enfermedad_cardiovascular, 3);
	}
	respuestaValida = 0;


    printf("\n  Padece alguna enfermedad de inmunosupresion\n");
    printf("  (por ejemplo, cancer, lupus, etc.)? (S/N) ");
    while(respuestaValida != 1) {
	    scanf(" %c", &inmunosupresion);
	    respuestaValida = esValida(inmunosupresion, 3);
	}
	respuestaValida = 0;

    sexo = toupper(sexo);
	peso = toupper(peso);
	
    if (sexo == 'M')
        puntos += 50;
    else
        puntos += 30;
        
    if (edad >= 18 && edad <=25)
    	puntos += 10;
    else if (edad >= 26 && edad <= 34)
    	puntos += 30;
    else if (edad >= 35 && edad <= 45)
    	puntos += 50;
    else if (edad >= 46 && edad <= 59)
    	puntos += 70;
    else if (edad >= 60)
    	puntos += 100;
    	
    switch (peso) {
    	case 'B':
    		puntos += 70;
    		break;
    	case 'N':
    		puntos += 40;
    		break;
    	case 'S':
    		puntos += 70;
    		break;
    	case 'O':
    		puntos += 100;
    		break;
	}
	
	if (toupper(diabetes) == 'S')
		puntos += 100;
	if (toupper(hipertension) == 'S')
		puntos += 100;
	if (toupper(fuma) == 'S')
		puntos += 100;
	if (toupper(padece_epoc) == 'S')
		puntos += 100;
	if (toupper(enfermedad_cardiovascular) == 'S')
		puntos += 100;
	if (toupper(inmunosupresion) == 'S')
		puntos += 150;
		
	if (puntos >= 0 && puntos <= 139 )
		strcpy(nivel_riesgo, "Medio");
	else if (puntos >= 140 && puntos <= 169)
		strcpy(nivel_riesgo, "Alto");
	else if (puntos >= 170)
		strcpy(nivel_riesgo, "Muy Alto");
		
	if (puntos >= 0 && puntos <= 139)
		factor_riesgo = 1;
	else if (puntos >= 140 && puntos <= 169)
		factor_riesgo = 2;
	else if (puntos >= 170 && puntos <= 200)
		factor_riesgo = 3;
	else if (puntos >= 201 && puntos <= 300)
		factor_riesgo = 4;
	else if (puntos >= 301 && puntos <= 400)
		factor_riesgo = 5;
	else if (puntos >= 401 && puntos <= 500)
		factor_riesgo = 6;
	else if (puntos >= 501 && puntos <= 600)
		factor_riesgo = 7;
	else if (puntos >= 601 && puntos <= 700)
		factor_riesgo = 8;
	else if (puntos >= 701 && puntos <= 800)
		factor_riesgo = 9;
	else if (puntos >= 801 && puntos <= 900)
		factor_riesgo = 10;	
	
	system("cls");
	
	printf(encabezado1);
	printf(encabezado2);
	printf(encabezado1);
	printf("\n\n");
	printf("                        -- R E S U L T A D O --\n\n\n");
    printf("\tTotal puntos:.......%d\n", puntos);
	printf("\tNivel de Riesgo:....%s\n", nivel_riesgo);
	printf("\tFactor de Riesgo:...%d\n", factor_riesgo);

	return 0;
}

short esValida(char entrada, short tipo)
{
	short valido = 0;
	entrada = toupper(entrada);
	
	if(tipo == 1) {
	    if(entrada == 'F' || entrada == 'M')
	    	valido = 1;
	    else
	    	printf("Respuesta invalida, solo ingresa [F] o [M] segun sea el caso.\n");
	} else if (tipo == 2) {
	    if(entrada == 'B' || entrada == 'N' || entrada == 'S' || entrada == 'O')
	    	valido = 1;
	    else
	    	printf("Opciones permitidas: [B, N S, O]: ");
	} else if (tipo == 3) {
	    if(entrada == 'S' || entrada == 'N')
	    	valido = 1;
	    else
	    	printf("Opciones permitidas: [S, N]: ");		
	}
	
	return valido;
}
