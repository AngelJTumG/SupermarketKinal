
package org.angeltum.bean;

/**
 *
 * @author Angel
 */
public class Clientes {
    private int clienteID;
    private String nombreClientes;
    private String apellidosClientes;
    private String direccionClientes;
    private String NIT;
    private String telefonoClientes;
    private String correoClientes;

    public Clientes() {
    }

    public Clientes(int clienteID, String nombreClientes, String apellidosClientes,  String direccionClientes,String NIT,String telefonoClientes, String correoClientes) {
        this.clienteID = clienteID;
        this.nombreClientes = nombreClientes;
        this.apellidosClientes = apellidosClientes;
        this.NIT = NIT;
        this.telefonoClientes = telefonoClientes;
        this.direccionClientes = direccionClientes;
        this.correoClientes = correoClientes;
    }

    public int getClienteID() {
        return clienteID;
    }

    public void setClienteID(int clienteID) {
        this.clienteID = clienteID;
    }

    public String getNombreClientes() {
        return nombreClientes;
    }

    public void setNombreClientes(String nombreClientes) {
        this.nombreClientes = nombreClientes;
    }

    public String getApellidosClientes() {
        return apellidosClientes;
    }

    public void setApellidosClientes(String apellidosClientes) {
        this.apellidosClientes = apellidosClientes;
    }

    public String getDireccionClientes() {
        return direccionClientes;
    }

    public void setDireccionClientes(String direccionClientes) {
        this.direccionClientes = direccionClientes;
    }

    public String getNIT() {
        return NIT;
    }

    public void setNIT(String NIT) {
        this.NIT = NIT;
    }

    public String getTelefonoClientes() {
        return telefonoClientes;
    }

    public void setTelefonoClientes(String telefonoClientes) {
        this.telefonoClientes = telefonoClientes;
    }

    public String getCorreoClientes() {
        return correoClientes;
    }

    public void setCorreoClientes(String correoClientes) {
        this.correoClientes = correoClientes;
    } 

    @Override
    public String toString() {
        return "| " + clienteID + " | " + getNombreClientes() + " | " + getApellidosClientes() + " | " + getNIT() + " |";
    }
}


