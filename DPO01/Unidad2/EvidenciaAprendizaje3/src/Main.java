import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int total_juan = 0;
        int total_pedro = 0;
        
        for (int i=0;i<5;i++) {
            if (i < 3) {
                total_juan += entrada.nextInt();
            } else {
                total_pedro += entrada.nextInt();
            }
        }
        
        if (total_juan > total_pedro)
            System.out.println("Juan");
        else
            System.out.println("Pedro");
    }
}