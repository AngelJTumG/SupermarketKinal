
package org.angeltum.controller;
// 
import java.net.URL;
import java.util.ResourceBundle;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import org.angeltum.bean.Proveedores;
import org.angeltum.system.Main;

/**
 *
 * @author Angel
 */
public class MenuControllerProveedores implements Initializable{

    private Main escenarioPrincipal;
    private ObservableList<Proveedores> listaProveedores;

    private enum operaciones {
        AGREGAR, ELIMINAR, EDITAR, ACTUALIZAR, CANCELAR, NINGUNO
    }
    private operaciones tipoDeOperaciones = operaciones.NINGUNO;

    @FXML
    private ImageView imgAgregar;
    @FXML
    private ImageView imgEliminar;
    @FXML
    private ImageView imgEditar;
    @FXML
    private ImageView imgReporte;
    @FXML
    private Button btnRegresar;
    @FXML
    private Button btnAgregarProveedor;
    @FXML
    private Button btnEliminarProveedor;
    @FXML
    private Button btnReportesProveedores;
    @FXML
    private Button btnEditarProveedor;
    @FXML
    private TextField txtCodigoProveedor;
    @FXML
    private TextField txtNITProveedor;
    @FXML
    private TextField txtNombreProveedor;
    @FXML
    private TextField txtApellidoProveedor;
    @FXML
    private TextField txtDireccionProveedor;
    @FXML
    private TextField txtRazonSocial;
    @FXML
    private TextField txtContactoPrincipal;
    @FXML
    private TextField txtPaginaWeb;
    @FXML
    private TableView<Proveedores> tblProveedores;
    @FXML
    private TableColumn colCodigoProveedor;
    @FXML
    private TableColumn colNITProveedor;
    @FXML
    private TableColumn colNombreProveedor;
    @FXML
    private TableColumn colApellidoProveedor;
    @FXML
    private TableColumn colDireccionProveedor;
    @FXML
    private TableColumn colRazonSocial;
    @FXML
    private TableColumn colContactoPrincipal;
    @FXML
    private TableColumn colPaginaWeb;
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
    }

    
    
    
     public void MenuPrincipalView() {
        escenarioPrincipal.menuPrincipalView();
    }

    @FXML
    public void handleButtonAction(ActionEvent event) {
        if (event.getSource() == btnRegresar) {
            escenarioPrincipal.menuPrincipalView();
        }

    }

    public Main getEscenarioPrincipal() {
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Main escenarioPrincipal) {
        this.escenarioPrincipal = escenarioPrincipal;
    }
}
