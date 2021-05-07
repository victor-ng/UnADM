package evaluarnumero;

import java.util.Scanner;
/**
 * @author Víctor Núñez
 * Esta es la clase principal, a partir de la cual se definen las variables esenciales,
 * su inicialización y su instanciación.
 * Se procuro elaborar el programa para que su lógica sea autodescriptiva, ya que de acuerdo
 * a las mejores prácticas en programación, los comentarios deben describir el "porqué", mas no
 * el "qué" hace el programa.
 */
public class Main {
    public static String lineaEntrada;
    public static boolean respuestaValida = false;
    public static boolean numeroValido = false;
    public static void main(String[] args) {
        Evaluador e = new Evaluador();
        
        Scanner entradaConsola=new Scanner(System.in);
        
        try {
            while (e.getOpcion() != 's') {
                System.out.println("\n\tElige una opción: ");
                while (!respuestaValida) {
                    lineaEntrada = entradaConsola.next();
                    respuestaValida = e.esOpcionValida(lineaEntrada);
                }
                
                if (e.getOpcion() == 'r') {
                    System.out.println("Ingresa un número: ");
                    while (!numeroValido){
                        lineaEntrada = entradaConsola.next();
                        var PrimoOCapicua = false;
                        if(e.esNumeroValido(lineaEntrada)) {
                            numeroValido = true;
                            if(e.esNumeroPrimo(e.getNumero())) {
                                System.out.println("\n\tEs número primo.");
                                PrimoOCapicua = true;
                            }else if (e.esCapicua(e.getNumero())) {
                                System.out.println("\n\tEs número capicua.");
                                PrimoOCapicua = true;
                            } else {
                                System.out.println("\n\tEl número ingresado no es primo ni es capicúa.");
                            }
                            if (PrimoOCapicua)
                                System.out.println("\n\tElevado al cuadrado su producto es: " + Math.pow(e.getNumero(), 2));
                        }
                    }
                    numeroValido = false;
                }
                respuestaValida = false;
            }
        } catch (Exception ex) {
        }
        System.out.println("\n\tFin de la ejecución.");
    }            
};

