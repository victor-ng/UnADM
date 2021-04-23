package mx.unadm.dpo1;

public class Autor {
    String Iniciales;
    String Apellido;
    
    Autor(String apellido, String iniciales){
        this.Apellido = apellido;
        this.Iniciales = iniciales;
    }

    public String getIniciales() {
        return Iniciales;
    }

    public void setIniciales(String iniciales) {
        this.Iniciales = iniciales;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String apellido) {
        this.Apellido = apellido;
    }
}
