/*  Programa: AplicarBeca
    Descripcion: Solicita 4 materias junto con sus calificaciones
    y determina si el promedio obtenido alcanza para obtener una
    beca.
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Prototipo de funcion para capturar línea completa de datos
void obtenCadena(char *cadena, int longitud);

// Función principal
int main() {
	const short num_materias = 4;
	const char  beca_nivel1[25] = "No obtiene beca";
	const char  beca_nivel2[25] = "30% de beca";
	const char  beca_nivel3[25] = "50% de beca";

	// Variables para entrada de datos
    char  nombre[50] = "";
    char  paso_materia[50] = "";
    char  paso_calif[5] = "";
    char  materia_1[50] = "";
    char  materia_2[50] = "";
    char  materia_3[50] = "";
    char  materia_4[50] = "";
    float calif_1 = 0.0;
    float calif_2 = 0.0;
    float calif_3 = 0.0;
    float calif_4 = 0.0;

    short entradaNumerica = 0;

    // Variables para el cálculo de la beca
    float suma_calif = 0.0;
    float promedio = 0.0;
    char  beca[25] = "";

    printf("======================================================================\n");
    printf("\t\t\tSistema para otorgar becas.\n");
    printf("======================================================================\n");

    printf("\n\n  Ingresa tu nombre: ");
    
    obtenCadena(nombre, 50);

	// Ejecuta un ciclo de 4 iteraciones para obtener las materias y sus calificaciones
    int i = 0;
	for (i = 0; i < num_materias; i ++)
	{
        printf("\n  Ingresa el nombre de la materia #%d: ", (i+1));
		obtenCadena(paso_materia, 50);

		/* Restringe la entrada de calificación para que sea solo numérica,
		   si no es así vuelve a pedir la calificación. */
		entradaNumerica = 0;
		while (entradaNumerica != 1) {
			printf("\n  Ingresa la calificacion de la materia #%d: ", (i+1));
			obtenCadena(paso_calif, 5);
			int j;
			short decimal = 0;
			for(j=0; j < strlen(paso_calif); j++) {
				if(!isdigit(paso_calif[j]) && paso_calif[j] != '.')  {
					printf("  Solo puedes ingresar numeros y punto decimal\n");
					entradaNumerica = 0;
					break;
				} else {
					entradaNumerica = 1;
				}
				
				if (paso_calif[j] == '.')
					decimal++;				
			}
			
			if (decimal > 1) {
				printf("  Solo se permite un punto decimal.");
				entradaNumerica = 0;
			}
			
			if (atof(paso_calif) > 10) {
				printf("  Calificacion no valida, Tiene que ser un valor de 0 a 10.");
				entradaNumerica = 0;
			}
		}
		
		switch(i)
        {
            case 0:
                strcpy(materia_1, paso_materia);
                calif_1 = atof(paso_calif);
                break;
            case 1:
                strcpy(materia_2, paso_materia);
                calif_2 = atof(paso_calif);
                break;
            case 2:
                strcpy(materia_3, paso_materia);
                calif_3 = atof(paso_calif);
                break;
            case 3:
                strcpy(materia_4, paso_materia);
                calif_4 = atof(paso_calif);
                break;
        }
	}

	// Calcula el promedio de las calificaciones	
	suma_calif = calif_1 + calif_2 + calif_3 + calif_4;
	if (suma_calif > 0) {
		promedio = suma_calif / num_materias;
	}

	// Determina si obtiene beca en base al promedio obtenido	
	if (promedio < 8) {
		strcpy(beca, beca_nivel1);
	} else if (promedio >= 8 && promedio < 9)  {
		strcpy(beca, beca_nivel2);
	} else if (promedio >= 9) {
		strcpy(beca, beca_nivel3);
	}
	
	// Limpia la pantalla y presenta los resultados
	system("cls");

    printf("\n\n\tNombre del Alumno: %s\n", nombre);
    printf("\tPromedio: %.2f\n", promedio);
    printf("\tPorcentaje de Beca: %s\n", beca);
    printf("\t%s: %.2f\n", materia_1, calif_1);
    printf("\t%s: %.2f\n", materia_2, calif_2);
    printf("\t%s: %.2f\n", materia_3, calif_3);
    printf("\t%s: %.2f\n", materia_4, calif_4);
    printf("\n\n");
    
    system("pause");

    return 0;
}

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
