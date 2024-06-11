
package org.angeltum.reportes;

import java.io.InputStream;
import java.util.Map;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import org.angeltum.db.Conexion;

/**
 *
 * @author informatica
 */
public class GenerarReportes {
    public static void mostarReportes(String nombreReporte, String titulo, Map parametros){
        InputStream reporte = GenerarReportes.class.getResourceAsStream(nombreReporte);
        try {
            JasperReport ReporteCliente = (JasperReport)JRLoader.loadObject(reporte);
            JasperPrint reporteImpreso = JasperFillManager.fillReport(ReporteCliente, parametros, Conexion.getInstance().getConexion());
            JasperViewer visor = new JasperViewer(reporteImpreso, false);
            visor.setTitle(titulo);
            visor.setVisible(true);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
}



/*
    iNTERFAZ MAP
    es uno de los objetos que implementa un conjunto de key-value.
    tiene un constructor sin parametros new HasMap() y su finalidad suele referrise para agrupar 
    informacion en un unico objeto.

    Esto tiene cierta similitud con la conexcion de objetos (ArrayList) pero con la diferencia que
    estos no tienen un orden. 

    El Has hace referencia a una tecnica de organizacion de archivos conocidos vulgarmente como 
    hashing (sbierto-cerrado) en la que se almacena registro en una direccion que es generada por 
    una funcion se aplica a la llave del 

    en Java el HashMap posee un espacio de memoria y cuando se guarda un objeto en dicho espacio se 
    determina su direccion aplicando una funcion a la llave que le indiquemos. cada objeto se 
    identifica mediante algun identificador apropiado. 
*/