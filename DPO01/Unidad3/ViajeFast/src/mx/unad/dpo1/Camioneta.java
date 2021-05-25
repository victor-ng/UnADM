package mx.unad.dpo1;

/**
 *
 * @author victornug
 * Esta subclase hereda de la superclase Vehiculo, tal como se indica con la palabra clave "extends",
 * incluída en la declaración.
 * Esta categoría de vehículo está enfocada a ofrecer transportación para tours turísticos.
 * .
 */
public class Camioneta extends Vehiculo {
    // Se agregan atributos específicos (y sus getters, setters) a este tipo de servicio.
    
    // El guía, aparte de conducir la unidad, da una explicación guiada de los lugares que se
    // visitan, y además pueden hablar en otros idiomas.
    String guia; 
    // La zona se refiere al tipo del lugar, zona arqueologica, lugares historicos, shopping malls, etc.
    String zonaAsignada;
    // El número acumulado de tours que ha realizado la unidad.
    int numTour;

    public String getGuia() {
        return guia;
    }

    public void setGuia(String guia) {
        this.guia = guia;
    }

    public String getZonaAsignada() {
        return zonaAsignada;
    }

    public void setZonaAsignada(String zonaAsignada) {
        this.zonaAsignada = zonaAsignada;
    }

    public int getNumTour() {
        return numTour;
    }

    public void setNumTour(int numTour) {
        this.numTour = numTour;
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
