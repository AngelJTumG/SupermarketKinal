
package org.angeltum.system;

import java.io.InputStream;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.fxml.JavaFXBuilderFactory;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.angeltum.controller.ClienteVistaController;
import org.angeltum.controller.MenuPrincipalController;
import org.angeltum.controller.AboutMeController;
import org.angeltum.controller.MenuCargoEmpleadoController;
import org.angeltum.controller.MenuControllerCompraVenta;
import org.angeltum.controller.MenuControllerEmpleado;
import org.angeltum.controller.MenuControllerProducto;
import org.angeltum.controller.MenuControllerProveedores;
import org.angeltum.controller.MenuControllerTelefonoProveedor;
import org.angeltum.controller.MenuControllerTipoProducto;
import org.angeltum.controller.MenuDetalleCompra;
import org.angeltum.controller.MenuDetalleFacturaController;

/**
 *
 * @author Angel
 */
public class Main extends Application {
    private Stage escenarioPrincipal;
    private Scene escena;
    
    @Override
    public void start(Stage escenarioPrincipal) throws Exception {
        this.escenarioPrincipal = escenarioPrincipal;
        this.escenarioPrincipal.setTitle("KinalSupermarket");
        escenarioPrincipal.getIcons().add(new Image("/org/angeltum/imagenes/logo.jpg"));
        menuPrincipalView();
        escenarioPrincipal.show();   
    }
    
    public Initializable cambiarEscena (String fxmlname, int width, int height) throws Exception{
        Initializable resultado;
        FXMLLoader loader =new FXMLLoader();
        InputStream file = Main.class.getResourceAsStream("/org/angeltum/view/" + fxmlname);
        loader.setBuilderFactory(new JavaFXBuilderFactory());
        loader.setLocation(Main.class.getResource("/org/angeltum/view/" + fxmlname));
        
        escena = new Scene((AnchorPane)loader.load(file), width, height);
        escenarioPrincipal.setScene(escena);
        escenarioPrincipal.sizeToScene();
        
        resultado = (Initializable)loader.getController();
        
        return resultado;
    }
    
    public void menuPrincipalView(){
        try{
            MenuPrincipalController menuPrincipalView = (MenuPrincipalController)cambiarEscena
        ("MenuPrincipalView.fxml",780,520);
            menuPrincipalView.setEscenarioPrincipal(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuClienteView(){
        try{
            ClienteVistaController menuClienteView = (ClienteVistaController)cambiarEscena
        ("ClienteVista.fxml",1000,580);
            menuClienteView.setEscenarioPrincipal(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void programadorView(){
        try{
            AboutMeController programadorView = (AboutMeController)cambiarEscena
        ("AboutMe.fxml", 685, 380);
            programadorView.setEscenarioPrincipal(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuProveedoresView() {
        try {
            MenuControllerProveedores menuProveedoresView = (MenuControllerProveedores) cambiarEscena
        ("ProveedoresView.fxml", 1070, 600);
            menuProveedoresView.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuCompraVentaView() {
        try {
            MenuControllerCompraVenta menuCompraVentaView = (MenuControllerCompraVenta) cambiarEscena
        ("CompraYVentaView.fxml", 1070, 600);
            menuCompraVentaView.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuTipoProductoView() {
        try {
            MenuControllerTipoProducto menuTipoProductoView = (MenuControllerTipoProducto) cambiarEscena
        ("TipoProductoView.fxml", 1070, 600);
            menuTipoProductoView.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuCargoEmpleadoView() {
        try {
            MenuCargoEmpleadoController menuCargoEmpleadoView = (MenuCargoEmpleadoController) cambiarEscena
        ("CargoEmpleadoView.fxml", 1070, 600);
            menuCargoEmpleadoView.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuProductoView() {
        try {
            MenuControllerProducto menuProductoView = (MenuControllerProducto) cambiarEscena
        ("ProductosView.fxml", 1120, 600);
            menuProductoView.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuEmpleadoView() {
        try {
            MenuControllerEmpleado menuEmpleadoView = (MenuControllerEmpleado) cambiarEscena
        ("EmpleadosView.fxml", 1120, 600);
            menuEmpleadoView.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuTelefonoProveedorView() {
        try {
            MenuControllerTelefonoProveedor menuTelefonoProveedorView = (MenuControllerTelefonoProveedor) cambiarEscena
        ("TelefonoProveedorView.fxml", 1120, 600);
            menuTelefonoProveedorView.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    
    public static void main(String[] args) {
        launch(args);
    }

    public void menuDetalleFacturaView() {
    try {
            MenuDetalleFacturaController menuDetalleFacturaView = (MenuDetalleFacturaController) cambiarEscena
        ("DetalleFacturaView.fxml", 1120, 600);
            menuDetalleFacturaView.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public void menuDetalleCompraView() {
    try {
            MenuDetalleCompra menuDetalleCompraView = (MenuDetalleCompra) cambiarEscena
        ("DetalleCompraView.fxml", 1120, 600);
            menuDetalleCompraView.setEscenarioPrincipal(this);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }    
    }
}
