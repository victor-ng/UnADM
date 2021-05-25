package mx.unad.dpo1;
import java.util.Calendar;
/**
 *
 * @author victornug
// * Esta es la superclase, o clase padre con los atributos y métodos comunes a todas las demás.
 */
public class Vehiculo {
    String marca;
    String modelo;
    int anio;
    String vin;
    String placa;
    float precio;
    String transmision;
    char tipo;
    int capacidad;
    int kilometraje;
    int nivelCombustible;
    Calendar fechaUltimoMantenimiento;
    
    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getTransmision() {
        return transmision;
    }

    public void setTransmision(String transmision) {
        this.transmision = transmision;
    }

    public char getTipo() {
        return tipo;
    }

    public void setTipo(char tipo) {
        this.tipo = tipo;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getKilometraje() {
        return kilometraje;
    }

    public void setKilometraje(int kilometraje) {
        this.kilometraje = kilometraje;
    }

    public int getNivelCombustible() {
        return nivelCombustible;
    }

    public void setNivelCombustible(int nivelCombustible) {
        this.nivelCombustible = nivelCombustible;
    }

    public Calendar getFechaUltimoMantenimiento() {
        return fechaUltimoMantenimiento;
    }

    public void setFechaUltimoMantenimiento(Calendar fechaUltimoMantenimiento) {
        this.fechaUltimoMantenimiento = fechaUltimoMantenimiento;
    }
    
    public void reAbastecer(){
        
    };
    
    public long getAntiguedad() {
        Calendar hoy = Calendar.getInstance();
        long antiguedad = hoy.get(Calendar.YEAR) - this.anio;
        return antiguedad;
    }
}
