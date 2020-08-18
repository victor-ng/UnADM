/*
 * Programa que indica si un numero es par y si es perfecto.
*/
#include <stdio.h>
#include <stdlib.h>

/* 
 * Prototipado de funciones (en el caso de que las funciones sean de-
 * claradas antes de la funci�n main(), este paso no es necesario). 
 */
 
// Prototipo de la funci�n esPar().
int esPar(int);

// Prototipo de la funci�n esPerfecto().
int esPerfecto(int, int);

// Variable global
int suma;
	
// Funci�n principal del programa
int main() {
	int numero, divisor;
	
	divisor = 1;
	suma = 0;
	
	system("cls");
	
	printf("======================================================================\n");
	printf("         Actividad 2 - Uso de funciones en programas modulares\n");
	printf("======================================================================\n");

	printf("\n\n\tIntroduza un numero: ");
	scanf("%d", &numero);

	if(esPar(numero) == 1)
		printf("\n\t%d es numero [PAR], ", numero);
	else
		printf("\n\t%d es impar, ", numero);
		
	if(esPerfecto(numero, divisor) == numero)
		printf("y es numero [PERFECTO].");
	else
		printf("y NO es numero perfecto.");
	printf("\n\n");
	
	system("pause");

	return 0;
}

// Funci�n que dermina si el numero es par o impar.
int esPar(numero) {
	if (numero % 2 == 0)
		return 1;
	else
		return 0;
}

/* Funci�n recursiva que indica si el n�mero ingresado es perfecto.
 * En tanto que el divisor sea menor que el n�mero ingresado, la 
 * funci�n se llamar� a s� misma y acumular� los divisores sin residuo
 * en la variable suma.
 * Al final, si el valor de la suma devuelta es igual al n�mero ingre-
 * sado, se indicar� que es perfecto.
*/
int esPerfecto(int numero, int divisor) {
	if (divisor < numero) {
		
		if (numero%divisor==0)
			suma += divisor;

		divisor++;
		esPerfecto(numero, divisor);
	}
	return suma;
}
