import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int min, aux;
        Scanner entrada = new Scanner(System.in);
        int cuantos_falmos;
        int[] edades_falmos;
        
        cuantos_falmos = entrada.nextInt();
        edades_falmos = new int[cuantos_falmos];
        
        for(int i=0;i<cuantos_falmos;i++) {
            edades_falmos[i] = entrada.nextInt();
        }
        
        for (int i=0; i<cuantos_falmos; i++) {
            min = i;
            for (int j=i+1;j<cuantos_falmos;j++) {
                if (edades_falmos[j] < edades_falmos[min]) {
                    min = j;
                }
            }
            aux = edades_falmos[i];
            edades_falmos[i] = edades_falmos[min];
            edades_falmos[min] = aux;
        }

        System.out.println(edades_falmos[edades_falmos.length-1]);
    }
}