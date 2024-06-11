
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
public class GenerarReportesProd {
    public static void mostarReportesP(String nombreReporte, String titulo, Map parametros){
        InputStream reporte = GenerarReportes.class.getResourceAsStream(nombreReporte);
        try {
            JasperReport ReporteProducto = (JasperReport)JRLoader.loadObject(reporte);
            JasperPrint reporteImpreso = JasperFillManager.fillReport(ReporteProducto, parametros, Conexion.getInstance().getConexion());
            JasperViewer visor = new JasperViewer(reporteImpreso, false);
            visor.setTitle(titulo);
            visor.setVisible(true);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
