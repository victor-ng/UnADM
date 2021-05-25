package mx.unad.dpo1;

/**
 *
 * @author victornug
 */
public class Compacto extends Vehiculo {
    // Se agregan propiedades adicionales (y sus respectivos getters/setters) a las heredadas de la superclase.
    String conductor;
    String color;
    int numViaje;

    public String getConductor() {
        return conductor;
    }

    public void setConductor(String conductor) {
        this.conductor = conductor;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getNumViaje() {
        return numViaje;
    }

    public void setNumViaje(int numViaje) {
        this.numViaje = numViaje;
    }

    // Implementación de polimorfismo.
    // Para esta clase, el metodo reabastecer implica revisar que si el nivel de combustible es bajo,
    // se rellene el tanque del vehiculo.
    @Override
    public void reAbastecer() {
        if (nivelCombustible < 8 ) {
            nivelCombustible = 50;
            System.out.println("El tanque se ha llenado.");
        } else {
            System.out.println("No es necesario reabastecer este vehiculo en este momento.");
        }
    }
}
