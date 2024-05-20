
package org.angeltum.controller;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.MenuItem;
import org.angeltum.system.Main;
/**
 *
 * @author Angel
 */
public class MenuPrincipalController implements Initializable {
    private Main escenarioPrincipal;
    @FXML MenuItem btnMenuClientes;
    @FXML MenuItem btnProgramador;
    @FXML MenuItem btnProveedores;
    @FXML MenuItem btnMenuCompras;
    @FXML MenuItem btnMenuTipo;
    @FXML MenuItem btnCargoEmpleado;
    @FXML MenuItem btnProducto;
    @FXML MenuItem btnEmpleados;
    @FXML MenuItem btnTelefonoProveedor;
    @FXML MenuItem btnDetalleFactura;
    @FXML MenuItem btnDetalleCompra;
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
    }

    public Main getEscenarioPrincipal() {
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Main escenarioPrincipal) {
        this.escenarioPrincipal = escenarioPrincipal;
       
    }

    public MenuItem getBtnMenuClientes() {
        return btnMenuClientes;
    }

    public void setBtnMenuClientes(MenuItem btnMenuClientes) {
        this.btnMenuClientes = btnMenuClientes;
    }

    public MenuItem getBtnProgramador() {
        return btnProgramador;
    }

    public void setBtnProgramador(MenuItem btnProgramador) {
        this.btnProgramador = btnProgramador;
    }
    
    public MenuItem getBtnProveedores(){
        return btnProveedores;
    }
    
    public void setBtnProveedores(MenuItem btnProveedores){
        this.btnProveedores = btnProveedores;
    }
    
    public MenuItem getBtnMenuCompras(){
        return btnMenuCompras;
    }
    
   public void setBtnMenuCompras(MenuItem btnMenuCompras){
       this.btnMenuCompras = btnMenuCompras;
   }
    
   public MenuItem getBtnMenuTipo(){
        return btnMenuTipo;
    }
    
   public void setBtnMenuTipo(MenuItem btnMenuTipo){
       this.btnMenuTipo = btnMenuTipo;
   }
   
   public MenuItem getBtnCargoEmpleado(){
        return btnCargoEmpleado;
    }
    
   public void setBtnCargoEmpleado(MenuItem btnCargoEmpleado){
       this.btnCargoEmpleado = btnCargoEmpleado;
   }
   
   public MenuItem getBtnProducto(){
        return btnCargoEmpleado;
    }
    
   public void setBtnProducto(MenuItem btnProducto){
       this.btnProducto = btnProducto;
   }
   
   public MenuItem getBtnEmpleados(){
        return btnEmpleados;
    }
    
   public void setBtnEmpleados(MenuItem btnEmpleados){
       this.btnEmpleados = btnEmpleados;
   }
   
   public MenuItem getBtnTelefonoProveedor(){
        return btnTelefonoProveedor;
    }
    
   public void setBtnTelefonoProveedor(MenuItem btnTelefonoProveedor){
       this.btnTelefonoProveedor = btnTelefonoProveedor;
   }
   
   public MenuItem getBtnDetalleFactura(){
        return btnDetalleFactura;
    }
    
   public void setBtnDetalleFactura(MenuItem btnDetalleFactura){
       this.btnDetalleFactura = btnDetalleFactura;
   }
   
   public MenuItem getBtnDetalleCompra(){
        return btnDetalleCompra;
    }
    
   public void setBtnDetalleCompra(MenuItem btnDetalleCompra){
       this.btnDetalleCompra = btnDetalleCompra;
   }
   
    @FXML 
        public void handleButtonAction(ActionEvent event){
        if (event.getSource() == btnMenuClientes){
            escenarioPrincipal.menuClienteView();
        }if(event.getSource() == btnProgramador)
            escenarioPrincipal.programadorView();
        if (event.getSource() == btnProveedores){
            escenarioPrincipal.menuProveedoresView();}
        if (event.getSource() == btnMenuCompras) {
            escenarioPrincipal.menuCompraVentaView(); 
        }if(event.getSource() == btnMenuTipo){
            escenarioPrincipal.menuTipoProductoView();
        }if (event.getSource() == btnCargoEmpleado){
            escenarioPrincipal.menuCargoEmpleadoView();
        }if (event.getSource() == btnProducto){
            escenarioPrincipal.menuProductoView();
        }if (event.getSource() == btnEmpleados){
            escenarioPrincipal.menuEmpleadoView();
        }if (event.getSource() == btnTelefonoProveedor){
            escenarioPrincipal.menuTelefonoProveedorView();
        }if (event.getSource() == btnDetalleFactura){
            escenarioPrincipal.menuDetalleFacturaView();
        }if (event.getSource() == btnDetalleCompra){
            escenarioPrincipal.menuDetalleCompraView();
        }            
}
}