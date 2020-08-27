/**
  * Programa que emula la funcionalidad de la estructura de datos denominada cola o queue,
  * se utiliza un array de un tipo específico y se le añaden funciones tipicas del queue.
  */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Prototipo de funcion para capturar línea completa de datos
void obtenCadena(char *cadena, int longitud);

// Variable usada en el menu de opciones para recibir la respuesta del usuario
char opcion;
// Variables de control
int inicio_cola, fin_cola, continuar;
short respuestaValida;
// Se define un array de tipo char, con una capacidad de 10 elementos y una longitud de 50 caracteres cada uno.
char cola[10][50];
// Variable que lee la entrada por parte del usuario y posteriormente la agrega a la cola.
char color[50];

// Insertar un elemento al final de la cola
void insertar() {
	obtenCadena(color, sizeof(color));
	if (fin_cola == sizeof(cola)/sizeof(color))
		printf("\n\t\tHas alcanzado el limite de elementos que puedes agregar a la cola.\n");
	else {
		strcpy(cola[fin_cola], color);
		printf("\n\t\tElemento agregado correctamente.\n");
		fin_cola ++;
	}
}

// Elimina el primer elemento que está al inicio de la cola.
void sacar() {
	int i;
	if (inicio_cola == fin_cola)
		printf("\n\t\tNo hay elementos que sacar, la cola esta vacia.\n");
	else {
		// recorrer una posicion todos los elementos
		strcpy(color, cola[0]);
		for (i = 0; i < fin_cola - 1; i++)
			strcpy(cola[i], cola[i + 1]);
		
		printf("\n\t\tSe quito el color [%s] de la cola.\n", color);
		fin_cola --;
	}
}

// Funcion para imprimir la lista de elementos contenidos en la cola.
void imprimir() {
	int i = 0;
	if (inicio_cola == fin_cola)
		printf("\n\t\tNo hay elementos que imprimir, la cola esta vacia.\n");
	else {
		printf("\n\n\t\tElementos en cola:");
		printf("\n\t\t-------------------\n");
		for (i = 0; i < fin_cola; i++) {
			printf("\t\t%d. %s\n", (i+1), cola[i]);
		}
	}
}

// Funcion que imprime la cantida de elementos que tiene la cola.
void numElementos() {
	if (inicio_cola == fin_cola)
		printf("\n\t\tLa cola esta vacia.\n");
	else
		printf("\n\t\tLa cola tiene [%d] elementos.\n", fin_cola);
}

// Funcion secundaria auxiliar para validar entrada de opciones
short esValida(char entrada) {
	short valido = 0;
	entrada = toupper(entrada);
	if(entrada == 'I' || entrada == 'S' || entrada == 'P' || entrada == 'N' || entrada == 'C' || entrada == 'X')
		valido = 1;
	else
		printf("Opciones permitidas: [i, s, p, n, c, x]: ");		
		
	return valido;
}

void obtenCadena(char *cadena, int longitud) {
	int i = 0;
	fseek(stdin,0,SEEK_END);
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

// Funcion secundaria auxiliar para imprimir el encabezado del programa
void imprimeEncabezado() {
	system("cls");
	printf("======================================================================\n");
	printf("         Implementacion de una COLA para colores\n");
	printf("======================================================================\n");
	printf("\n                           Menu de opciones:\n");
	printf("\n      [i] insertar [s] sacar [p] imprimir [n] numero de elementos\n");
	printf("                        [x] salir del programa\n");
}

int main() {
	// Inicializar las variables de control
	continuar = 1;
	inicio_cola = 0;
	fin_cola = 0;
	
	imprimeEncabezado();
	
	while (continuar == 1) {
		respuestaValida = 0;
		
		printf("\n\t\tElige una opcion: ");
		
		while (respuestaValida != 1) {
			scanf("%c", &opcion);
			getchar();
			respuestaValida = esValida(opcion);
		}
		
		imprimeEncabezado();

		switch (toupper(opcion)) {
			case 'I':
				printf("\n\t\tIngesa un color: ");
				insertar();
				break;

			case 'S':
				sacar();
				break;

			case 'P':
				imprimir();
				break;

			case 'N':
				numElementos();
				break;

			case 'X':
				printf("\n\t\tAdios...\n\n");
				continuar = 0;
		}
	}
	system("pause");
	return 0;
}
