#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#define num_estados 6

char entrada[10];
short respuestaValida;
int pos;
struct Estado {
    char nombre[20];
    int casos;
} estados[num_estados];

short esOpcionValida(char);
void entradaDatos(struct Estado *);
void procesamiento(struct Estado *);
void salidaDatos(struct Estado *);
void imprimeEncabezado();
short esNumeroValido(char *);

int main() {
    short op = 0;
    strcpy(estados[0].nombre, "Baja California");
    strcpy(estados[1].nombre, "Sonora");
    strcpy(estados[2].nombre, "Ciudad de Mexico");
    strcpy(estados[3].nombre, "Estado de Mexico");
    strcpy(estados[4].nombre, "Veracruz");
    strcpy(estados[5].nombre, "Tabasco");

    imprimeEncabezado();

    int i;
    do {
        respuestaValida = 0;
        printf( "\t\tElige una opci%cn: ",162);
        while (respuestaValida != 1) {
            scanf("%d",&op);
            respuestaValida = esOpcionValida(op);
        }

        switch (op) {
            case 1:
                entradaDatos(&estados);
                break;
            case 2:
                procesamiento(&estados);
                break;
            case 3:
                salidaDatos(&estados);
                break;
            case 4:
                break;
        }
    } while (op !=4);


    return 0;
}

/* -------------------------------------------------------------------
Función para alimentar la información de casos COVID-19
------------------------------------------------------------------- */
void entradaDatos(struct Estado *estados) {
    int i;
    imprimeEncabezado();
    respuestaValida = 0;
    for (i=0;i<num_estados;i++) {
        printf("\n\t\tIngresa cantidad de casos para %s: ", estados[i].nombre);
        while(respuestaValida != 1) {
            scanf(" %s", entrada);
            respuestaValida = esNumeroValido(entrada);
            if(respuestaValida == 1) estados[i].casos = atoi(entrada);
        }
        respuestaValida = 0;
    };
    printf("\n\t\tDatos registrados correctamente.\n\n");
}

/* -------------------------------------------------------------------
Función que realiza el ordenamiento de los elementos en el array
------------------------------------------------------------------- */
void procesamiento(struct Estado *estados) {
    int i, valorMaximo = estados[0].casos;
    for (i=0;i<num_estados;i++) {
        if (estados[i].casos > valorMaximo) {
            valorMaximo = estados[i].casos;
            pos = i;
        }
    }
    imprimeEncabezado();
    printf("\n\t\tProcesamiento concluido satisfactoriamente.\n\n");
}

/* -------------------------------------------------------------------
Función que imprime en pantalla la información procesada
------------------------------------------------------------------- */
void salidaDatos(struct Estado *estados) {
    int i;
    imprimeEncabezado();
    printf("\n\t\t%c-----------------------------------------%c", 218, 191);
    printf("\n\t\t|           Estado          | Confirmados |");
    printf("\n\t\t-------------------------------------------");
    for(i=0;i<num_estados;i++) {
        printf("\n\t\t| %-25s | %11d |", estados[i].nombre, estados[i].casos);
	    printf("\n\t\t-------------------------------------------");
    }
    printf("\n\n\t\tLa entidad federativa que reporta el mayor numero de casos");
    printf("\n\t\tpositivos es %s con %d registrados.\n", estados[pos].nombre, estados[pos].casos);
}

/* -------------------------------------------------------------------
* Funcion auxiliar que realiza las validaciones para entrada de datos.
------------------------------------------------------------------- */
short esOpcionValida(char entrada)
{
    short valido = 0;

    if (entrada==0) return 0;

    entrada = toupper(entrada);
    if(entrada == 1 || entrada == 2
       || entrada == 3 || entrada == 4)
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

    if (entrada==0) return 0;

    for (i = 0; i < strlen(entrada); i++) {
        if(!isdigit(entrada[i])) {
            printf("\n\t\tSolo puedes ingresar numeros: ");
            valido = 0;
            break;
        } else {
            valido = 1;
        }
    }
    if (valido == 1 && atoi(entrada) <= 0) {
        printf("\n\t\tEl valor tiene que ser mayor a 0: ");
        valido = 0;
    }
    return valido;
}

/* -------------------------------------------------------------------
* Funcion secundaria auxiliar para imprimir el encabezado del programa
------------------------------------------------------------------- */
void imprimeEncabezado() {
    system("cls");
    printf("======================================================================\n");
    printf("       Programa para registro y procesamiento de casos COVID-19\n");
    printf("======================================================================\n");
    printf("\n                           Menu de opciones:\n");
    printf("        -----------------------------------------------------\n");
    printf("        1) Entrada  2) Procesamiento  3) Salida  4) Finalizar\n\n");
}

