package evaluarnumero;

import java.util.Arrays;
/**
 *
 * @author Víctor Núñez
 */
public class Evaluador {
    char opcion = 'x';
    char tipoNumero = 'n';
    int numero;

    Evaluador(){
        imprimeCabecera();
    }

    public void imprimeCabecera(){
        StringBuilder sbCabecera = new StringBuilder();
        sbCabecera.append("===============================================================================\n");
        sbCabecera.append(" Actividad 2 - Retorno de parámetros e implementación de estructuras cíclicas.\n");
        sbCabecera.append("             Instrucciones:     [r] Registrar número     [s] Salir\n");
        sbCabecera.append("===============================================================================\n");
        System.out.println(sbCabecera);
    }
    
    boolean esOpcionValida(String lineaEntrada) {
        if (lineaEntrada.length() == 0) {
            System.out.println("\n\tNo has ingresado ninguna opción, intenta nuevamente: ");
            return false;
        } else {
            opcion = lineaEntrada.charAt(0);
            if (opcion != 'r' && opcion != 's') {
                System.out.println("\n\tOpción inválida, intenta nuevamente: ");
                return false;
            } else {
                return true;
            }        
        }
    }
    
    boolean esNumeroValido(String lineaEntrada){
        if (lineaEntrada.length() == 0) {
            System.out.println("\n\tNo ingresaste ningún número, intenta nuevamente: ");
            return false;
        } else {
            try {
                numero = Integer.parseInt(lineaEntrada);
                if(esNumeroPrimo(numero))
                    tipoNumero = 'p';
                else if (esCapicua(numero))
                    tipoNumero = 'c';
            } catch (Exception ex) {
                System.out.println("\n\tNúmero no válido, intenta nuevamente: ");
                return false;
            }
        }
        return true;
    }
    
    boolean esNumeroPrimo(int num){
        switch (num){
            case 0:
            case 1:
                return false;
            case 2:
                return true;
            default:
                if(num > 2 && num % 2 == 0) {
                    return false;
                }
                
                double divisor_maximo = Math.floor(Math.sqrt(num));
                for(int i=3; i<divisor_maximo+1; i+=2) {
                    if(num % i == 0) {
                        return false;
                    }
                }
        }
        return true;
    }
    
    boolean esCapicua(int num) {
        if(num<10) return false;
        
        byte[] numBytes = String.valueOf(num).getBytes();
        byte[] numBytesReverse = new byte[numBytes.length];
        
        for(int i = 0; i < numBytes.length; i++) {
            numBytesReverse[i] = numBytes[numBytes.length - i -1];
        }
        
        return (Arrays.toString(numBytes).equals(Arrays.toString(numBytesReverse)));
    }
    
    public char getOpcion() {
        return opcion;
    }
    
    public int getNumero() {
        return numero;
    }
}
