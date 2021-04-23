package mx.unadm.dpo1;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

public class FechaConsulta {
    private int Dia;
    private int Mes;
    private int Anio;
    private final SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM YYYY", new Locale("es", "MX"));
    
    FechaConsulta(int dia, int mes, int anio){
        Dia = dia;
        Mes = mes;
        Anio = anio;
    }

    public int getDia() {
        return Dia;
    }

    public void setDia(int Dia) {
        this.Dia = Dia;
    }

    public int getMes() {
        return Mes;
    }

    public void setMes(int Mes) {
        this.Mes = Mes;
    }

    public int getAnio() {
        return Anio;
    }

    public void setAnio(int Anio) {
        this.Anio = Anio;
    }
    
    @Override
    public String toString(){
        Calendar calendar = new GregorianCalendar(Anio,(Mes-1),Dia);
        return sdf.format(calendar.getTime());
    }
}
