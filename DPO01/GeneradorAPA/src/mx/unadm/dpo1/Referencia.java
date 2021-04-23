package mx.unadm.dpo1;
import java.util.List;

/**
 *
 * @author Víctor I. Núñez Gómez - UnADM
 * 
 */
public class Referencia {

   private String LigaWeb;
   private String Titulo;
   private List<Autor> Autores;
   private String[] Organizaciones;
   private Boolean AutorDesconocido;
   private int AnioPublicacion;
   private int MesPublicacion;
   private int DiaPublicacion;
   private Boolean PublicacionDesconocida;
   private FechaConsulta consulta;
   private String OrganizacionPagina;
   
    public String getLigaWeb() {
        return LigaWeb;
    }

    public void setLigaWeb(String ligaWeb) {
        this.LigaWeb = ligaWeb;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public List<Autor> getAutores() {
        return Autores;
    }

    public void setAutores(List<Autor> Autores) {
        this.Autores = Autores;
    }

    public String[] getOrganizaciones() {
        return Organizaciones;
    }

    public void setOrganizaciones(String[] Organizaciones) {
        this.Organizaciones = Organizaciones;
    }

    public Boolean getAutorDesconocido() {
        return AutorDesconocido;
    }

    public void setAutorDesconocido(Boolean AutorDesconocido) {
        this.AutorDesconocido = AutorDesconocido;
    }

    public int getAnioPublicacion() {
        return AnioPublicacion;
    }

    public void setAnioPublicacion(int AnioPublicacion) {
        this.AnioPublicacion = AnioPublicacion;
    }
    
    public int getMesPublicacion() {
        return MesPublicacion;
    }
    
    public void setMesPublicacion(int MesPublicacion){
        this.MesPublicacion = MesPublicacion;
    }
    
    public int getDiaPublicacion() {
        return DiaPublicacion;
    }
    
    public void setDiaPublicacion(int DiaPublicacion) {
        this.DiaPublicacion = DiaPublicacion;
    }

    public Boolean getPublicacionDesconocida() {
        return PublicacionDesconocida;
    }

    public void setPublicacionDesconocida(Boolean PublicacionDesconocida) {
        this.PublicacionDesconocida = PublicacionDesconocida;
    }

    public FechaConsulta getConsulta() {
        return consulta;
    }

    public void setConsulta(FechaConsulta consulta) {
        this.consulta = consulta;
    }

    public String getOrganizacionPagina() {
        return OrganizacionPagina;
    }

    public void setOrganizacionPagina(String OrganizacionPagina) {
        this.OrganizacionPagina = OrganizacionPagina;
    }
    
    public String ObtenReferencia(){
        String formatoAPA = "";

        // Cuando no hay autores, se pone el título en su lugar
        if(AutorDesconocido || (Autores.isEmpty() && Organizaciones.length == 0)){
            formatoAPA += OrganizacionPagina + ". ";
        }else{
            // de lo contrario se van concatenando.
            for(int i=0; i<Autores.size();i++){
                if(i==Autores.size()-1){
                    if (i > 0) formatoAPA += "& ";
                    formatoAPA += Autores.get(i).Apellido + ", " + Autores.get(i).Iniciales + " ";
                }else{
                    formatoAPA += Autores.get(i).Apellido + ", " + Autores.get(i).Iniciales + ", ";
                }
            }
            // lo mismo ocurre si son organizaciones las que se toman como autores
            for (int i=0; i<Organizaciones.length;i++) {
                if(i==Organizaciones.length -1) {
                    formatoAPA += Organizaciones[i] + " ";
                }else{
                    formatoAPA += Organizaciones[i] + ", ";
                }
            }
        }
        
        if (PublicacionDesconocida){
            formatoAPA += "(s.f.). ";
        }else{
            formatoAPA += "(" + AnioPublicacion + "). ";
        }
        
        formatoAPA += Titulo + ". ";
        
        if (!AutorDesconocido && (!Autores.isEmpty() || Organizaciones.length != 0)) {
            formatoAPA += OrganizacionPagina + ". ";            
        }
        
        formatoAPA += "Recuperado el " + consulta.toString() + ", ";
        
        formatoAPA += "de " + LigaWeb;

        return formatoAPA;
    }
}
