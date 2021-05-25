package mx.unad.dpo1;

/**
 *
 * @author victornug
 * Esta subclase hereda de la superclase Vehiculo, tal como se indica con la palabra clave "extends",
 * incluída en la declaración.
 * La categoria de sedanes, implica un nivel de servicio premium o de lujo, con un tipo de servicio
 * agregado mayor al del tipo de vehículo compacto.
 */
public class Sedan extends Vehiculo {
    // Se agregan atributos y métodos específicos para esta subclase.

    // A diferencia de un conductor, el concierge realiza tareas adicionales como
    // llevar mensajería, ofrecer alimentos y bebidas, conseguir boletos y entradas, etc.
    String concierge;
    boolean electrico;
    // Si el auto es eléctrico, se indica el nivel de carga que le queda a la batería del auto.
    int nivelBateria;

    // Tipo de Servicio indica el nivel de atenciones y confort ofrecido en este tipo de vehiculos,
    // por ejemplo, plata, oro, diamante.
    String tipoServicio;

    public String getConcierge() {
        return concierge;
    }

    public void setConcierge(String concierge) {
        this.concierge = concierge;
    }

    public boolean isElectrico() {
        return electrico;
    }

    public void setElectrico(boolean electrico) {
        this.electrico = electrico;
    }

    public int getNivelBateria() {
        return nivelBateria;
    }

    public void setNivelBateria(int nivelBateria) {
        this.nivelBateria = nivelBateria;
    }

    public String getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }
    
    // Implementación de polimorfismo.
    // A diferencia de las clases Compacto y Camioneta, en esta categoría de sedanes existen vehiculos
    // eléctricos, y cambia la implementación del método para determinar que si es de tipo electrico, se
    // realice una recarga eléctrica en lugar de cargar gasolina.
    @Override
    public void reAbastecer() {
        if (electrico) {
            if (nivelBateria < 5) {
                nivelBateria = 100;
                System.out.println("El auto fue recargado al 100%.");
            } else {
                System.out.println("No es necesario recargar la batería del auto en este momento.");
            }
        } else {
            if (nivelCombustible < 8 ) {
                nivelCombustible = 50;
                System.out.println("El tanque se ha llenado.");
            } else {
                System.out.println("No es necesario reabastecer este vehiculo en este momento.");
            }            
        }
    }
    
}
