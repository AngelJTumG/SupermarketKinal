
package org.angeltum.bean;
/**
 *
 * @author Angel
 */

public class CompraVenta {

    private int numeroDocumento;
    private String fechaDocumento;
    private String descripcion;
    private Double totalDocumento;

    public CompraVenta() {

    }

    public CompraVenta(int numeroDocumento, String fechaDocumento, String descripcion, Double totalDocumento) {
        this.numeroDocumento = numeroDocumento;
        this.fechaDocumento = fechaDocumento;
        this.descripcion = descripcion;
        this.totalDocumento = totalDocumento;
    }

    public int getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(int numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getFechaDocumento() {
        return fechaDocumento;
    }

    public void setFechaDocumento(String fechaDocumento) {
        this.fechaDocumento = fechaDocumento;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getTotalDocumento() {
        return totalDocumento;
    }

    public void setTotalDocumento(Double totalDocumento) {
        this.totalDocumento = totalDocumento;
    }
    
    @Override
    public String toString() {
        return getNumeroDocumento() + "  ";
    }
}
