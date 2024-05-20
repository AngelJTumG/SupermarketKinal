
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
        }            
}
}