import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int dolares;
        int tipo_cambio;
        
        dolares = entrada.nextInt();
        tipo_cambio = entrada.nextInt();
        
        if (dolares < 0 || dolares > 10000) {
            System.out.println("La cifra en dolares es incorrecta.");
            return;
        }
        
        if (tipo_cambio < 0 || tipo_cambio > 100) {
            System.out.println("El tipo de cambio es incorrecto.");
            return;
        }

        System.out.println(dolares * tipo_cambio);
    }
}