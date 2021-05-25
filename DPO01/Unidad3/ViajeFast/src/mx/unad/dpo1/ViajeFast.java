package mx.unad.dpo1;
import java.util.GregorianCalendar;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author victornug
 */
public class ViajeFast {
    public static void main(String[] args) {
        // Clases utilizadas para dar formato a las salidas de información
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        DecimalFormat df = new DecimalFormat();
        df.setGroupingUsed(true);
        df.setGroupingSize(3);
        
        /* Se crea un objeto de cada tipo de subclase. */
        
        // Iniciamos con el tipo de vehículo compacto.
        Compacto comp = new Compacto();
        comp.setMarca("VW");
        comp.setModelo("Vento");
        comp.setAnio(2010);
        comp.setVin("2HNYD28248H990905");
        comp.setPlaca("A11GPT");
        comp.setPrecio(130000);
        comp.setTransmision("Manual/Estandar");
        comp.setTipo('C');
        comp.setCapacidad(3);
        comp.setKilometraje(80000);
        comp.setNivelCombustible(28);
        comp.setFechaUltimoMantenimiento(new GregorianCalendar(2021, 0, 15));
        // Asignamos propiedades específicas de la subclase Compacto.
        comp.setConductor("Mario Lopez");
        comp.setColor("Rojo");
        comp.setNumViaje(672);
        // Imprimimos en pantalla la información del auto compacto
        System.out.println("---------------------------------------------------");
        System.out.println("                   " + comp.getMarca() + " " + comp.getModelo() + " " + comp.getAnio());
        System.out.println("---------------------------------------------------");
        System.out.println("Conductor: .......... " + comp.getConductor());
        System.out.println("Placa: .............. " + comp.getPlaca());
        System.out.println("Transmisión: ........ " + comp.getTransmision());
        System.out.println("Kilometraje: ........ " + df.format(comp.getKilometraje()) + " Km.");
        System.out.println("Capacidad: .......... " + comp.getCapacidad() + " pasajeros.");
        System.out.println("Antiguedad: ......... " + comp.getAntiguedad() + " años.");
        System.out.println("Ultimo mantenimiento: " + sdf.format(comp.getFechaUltimoMantenimiento().getTime()));
        System.out.println("---------------------------------------------------");
        comp.reAbastecer();
        System.out.println("---------------------------------------------------\n");
        
        // Continuamos con el tipo Sedán
        Sedan sedan = new Sedan();
        sedan.setMarca("Audi");
        sedan.setModelo("A4");
        sedan.setAnio(2019);
        sedan.setVin("WBA6B2C5XED076698");
        sedan.setPlaca("T32VGN");
        sedan.setPrecio(350000);
        sedan.setTransmision("Automática/Triptronic");
        sedan.setTipo('S');
        sedan.setCapacidad(4);
        sedan.setKilometraje(12000);
        sedan.setFechaUltimoMantenimiento(new GregorianCalendar(2020, 10, 2));
        // Asignamos propiedades específicas de la subclase Sedan.
        sedan.setConcierge("Rosalía Alcántara");
        sedan.setElectrico(true);
        sedan.setNivelBateria(4);
        sedan.setTipoServicio("Plata");
        // Imprimimos en pantalla la información del auto sedán
        System.out.println("---------------------------------------------------");
        System.out.println("                   " + sedan.getMarca() + " " + sedan.getModelo() + " " + sedan.getAnio());
        System.out.println("---------------------------------------------------");
        System.out.println("Concierge: .......... " + sedan.getConcierge());
        System.out.println("Tipo Servicio: ...... " + sedan.getTipoServicio());
        System.out.println("Placa: .............. " + sedan.getPlaca());
        System.out.println("Transmisión: ........ " + sedan.getTransmision());
        if (sedan.isElectrico()) {
            System.out.println("Motorización: ....... Motor Electrico.");
            System.out.println("Nivel Bateria: ...... " + sedan.getNivelBateria() + "%.");
        } else {
            System.out.println("Motorización: ....... Motor a Gasolina.");
        }
        System.out.println("Kilometraje: ........ " + df.format(sedan.getKilometraje()) + " Km.");
        System.out.println("Capacidad: .......... " + sedan.getCapacidad() + " pasajeros.");
        System.out.println("Antiguedad: ......... " + sedan.getAntiguedad() + " años.");
        System.out.println("Ultimo mantenimiento: " + sdf.format(sedan.getFechaUltimoMantenimiento().getTime()));
        System.out.println("---------------------------------------------------");
        sedan.reAbastecer();
        System.out.println("---------------------------------------------------\n");
        
        // Concluimos con la subclase Camioneta.
        Camioneta cam = new Camioneta();
        cam.setMarca("Mercedes Benz");
        cam.setModelo("Sprinter");
        cam.setAnio(2020);
        cam.setVin("1G4HE5EM3AU557648");
        cam.setPlaca("A21FNN");
        cam.setPrecio(740000);
        cam.setTransmision("Automática/AWD");
        cam.setTipo('M');
        cam.setCapacidad(19);
        cam.setKilometraje(18500);
        cam.setFechaUltimoMantenimiento(new GregorianCalendar(2020, 5, 10));        
        // Asignamos propiedades específicas de la subclase Camioneta.
        cam.setGuia("Rubén Mendiola");
        cam.setZonaAsignada("Xochimilco");
        cam.setNumTour(94);
        // Imprimimos en pantalla la información
        System.out.println("---------------------------------------------------");
        System.out.println("                   " + cam.getMarca() + " " + cam.getModelo() + " " + cam.getAnio());
        System.out.println("---------------------------------------------------");
        System.out.println("Guia: ............... " + cam.getGuia());
        System.out.println("Zona asignada: ...... " + cam.getZonaAsignada());
        System.out.println("Placa: .............. " + cam.getPlaca());
        System.out.println("Transmisión: ........ " + cam.getTransmision());
        System.out.println("Kilometraje: ........ " + df.format(cam.getKilometraje()) + " Km.");
        System.out.println("Capacidad: .......... " + cam.getCapacidad() + " pasajeros.");
        System.out.println("Antiguedad: ......... " + cam.getAntiguedad() + " años.");
        System.out.println("Ultimo mantenimiento: " + sdf.format(cam.getFechaUltimoMantenimiento().getTime()));
        System.out.println("---------------------------------------------------");
        cam.reAbastecer();
        System.out.println("---------------------------------------------------\n");
        
    }
    
}
