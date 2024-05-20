
package org.angeltum.controller;

import java.net.URL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.ImageView;
import javax.swing.JOptionPane;
import org.angeltum.bean.TipoProductos;
import org.angeltum.db.Conexion;
import org.angeltum.system.Main;

/**
 *
 * @author Angel
 */
public class MenuControllerTipoProducto implements Initializable{
    
    private Main escenarioPrincipal;
    private ObservableList <TipoProductos> listaTiposProducto;
    
    private enum operaciones {
        AGREGAR, ELIMINAR, EDITAR, ACTUALIZAR, CANCELAR, NINGUNO
    }
    
    private operaciones tipoDeOperaciones = operaciones.NINGUNO;
    @FXML
    private Button btnRegresar;
    
    @FXML
    private Button btnAgregarTipo;
    
    @FXML
    private Button btnEliminarTipo;
    
    @FXML
    private Button btnReportesTipos;
    
    @FXML
    private Button btnEditarTipo;
    
    @FXML
    private TextField txtCodigoTipo;
    
    @FXML
    private TextField txtDescripcionTipo;
    
    @FXML
    private TableView tblTiposProducto;
    
    @FXML
    private TableColumn colCodigoTipoProducto;
    
    @FXML
    private TableColumn colDescripcion;
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        cargarDatos();
        listaTiposProducto = FXCollections.observableArrayList();
    }
    
    public Main getEscenarioPrincipal() {
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Main escenarioPrincipal) {
        this.escenarioPrincipal = escenarioPrincipal;
    }
    
    public ObservableList<TipoProductos> getTiposProducto() {
        ArrayList<TipoProductos> lista = new ArrayList<>();
        try {
            PreparedStatement procedimiento = Conexion.getInstance().getConexion().prepareCall("{call sp_ListarTipoProducto()}");
            ResultSet resultado = procedimiento.executeQuery();
            while (resultado.next()) {
                        lista.add(new TipoProductos(resultado.getInt("codigoTipoProducto"),
                        resultado.getString("descripcion")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaTiposProducto = FXCollections.observableList(lista);
    }
    
    public void cargarDatos() {
        tblTiposProducto.setItems(getTiposProducto());
        colCodigoTipoProducto.setCellValueFactory(new PropertyValueFactory<TipoProductos, Integer>("codigoTipoProducto"));
        colDescripcion.setCellValueFactory(new PropertyValueFactory<TipoProductos, String>("descripcion"));
    }
    
    public void seleccionarElemento() {
        txtCodigoTipo.setText(String.valueOf(((TipoProductos)tblTiposProducto.getSelectionModel().getSelectedItem()).getCodigoTipoProducto()));
        txtDescripcionTipo.setText(String.valueOf(((TipoProductos)tblTiposProducto.getSelectionModel().getSelectedItem()).getDescripcion()));
    }
    
    public void desactivarControles() {
        txtCodigoTipo.setEditable(false);
        txtDescripcionTipo.setEditable(false);
    }

    public void activarControles() {
        txtCodigoTipo.setEditable(true);
        txtDescripcionTipo.setEditable(true);
    }

    public void limpiarControles() {
        txtCodigoTipo.clear();
        txtDescripcionTipo.clear();
    }
    
    public void guardar() {
        TipoProductos registro = new TipoProductos();
        registro.setCodigoTipoProducto(Integer.parseInt(txtCodigoTipo.getText()));
        registro.setDescripcion(txtDescripcionTipo.getText());
        try {
            PreparedStatement Procedimiento = Conexion.getInstance().getConexion().prepareCall("{call sp_AgregarTipoProducto(?,?)}");
            Procedimiento.setInt(1, registro.getCodigoTipoProducto());
            Procedimiento.setString(2, registro.getDescripcion());
            listaTiposProducto.add(registro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void agregar() {
        switch (tipoDeOperaciones) {
            case NINGUNO:
                activarControles();
                btnAgregarTipo.setText("Guardar");
                btnEliminarTipo.setText("Cancelar");
                btnEditarTipo.setDisable(true);
                btnReportesTipos.setDisable(true);
                tipoDeOperaciones = operaciones.ACTUALIZAR;
                break;
            case ACTUALIZAR:
                guardar();
                desactivarControles();
                cargarDatos();
                limpiarControles();
                btnAgregarTipo.setText("Agregar");
                btnEliminarTipo.setText("Eliminar");
                btnEditarTipo.setDisable(false);
                btnReportesTipos.setDisable(false);
                tipoDeOperaciones = operaciones.ACTUALIZAR;
                tipoDeOperaciones = operaciones.NINGUNO;
                cargarDatos();
                break;
        }
    }

    public void eliminar() {
        switch (tipoDeOperaciones) {
            case ACTUALIZAR:
                desactivarControles();
                limpiarControles();
                btnAgregarTipo.setText("Agregar");
                btnEliminarTipo.setText("Eliminar");
                btnEditarTipo.setDisable(false);
                btnReportesTipos.setDisable(false);
                tipoDeOperaciones = operaciones.NINGUNO;
                break;
            default:
                if (tblTiposProducto.getSelectionModel().getSelectedItem() != null) {
                    int respuesta = JOptionPane.showConfirmDialog(null, "Confirmar la eliminación del registro",
                            "Eliminar Tipo Producto", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
                    if (respuesta == JOptionPane.YES_OPTION) {
                        try {
                            PreparedStatement procedimiento = Conexion.getInstance().getConexion().prepareCall("{call sp_EliminarTipoProducto(?)}");
                            procedimiento.setInt(1, ((TipoProductos) tblTiposProducto.getSelectionModel().getSelectedItem()).getCodigoTipoProducto());
                            procedimiento.execute();
                            listaTiposProducto.remove(tblTiposProducto.getSelectionModel().getSelectedItem());
                            limpiarControles();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "Necesitas seleccionar un Tipo de Producto antes..");
                }
        }
    }

    public void editar() {
        switch (tipoDeOperaciones) {
            case NINGUNO:
                if (tblTiposProducto.getSelectionModel().getSelectedItem() != null) {
                    btnEditarTipo.setText("Actualizar");
                    btnReportesTipos.setText("Cancelar");
                    btnAgregarTipo.setDisable(true);
                    btnEliminarTipo.setDisable(true);
                    activarControles();
                    txtCodigoTipo.setEditable(false);
                    tipoDeOperaciones = operaciones.EDITAR;
                } else {
                    JOptionPane.showMessageDialog(null, "Debe seleccionar un Tipo de Producto para editar.");
                }
                break;
            case ACTUALIZAR:
                actualizar();
                btnEditarTipo.setText("Editar");
                btnReportesTipos.setText("Reporte");
                btnAgregarTipo.setDisable(false);
                btnEliminarTipo.setDisable(false);
                desactivarControles();
                limpiarControles();
                tipoDeOperaciones = operaciones.NINGUNO;
                cargarDatos();
                break;
        }
    }

    public void actualizar() {
        try {
            PreparedStatement procedimiento = Conexion.getInstance().getConexion().prepareCall("{call sp_EditarTipoProducto(?, ?)}");
            TipoProductos registro = (TipoProductos) tblTiposProducto.getSelectionModel().getSelectedItem();
            registro.setDescripcion(txtDescripcionTipo.getText());
            procedimiento.setInt(1, registro.getCodigoTipoProducto());
            procedimiento.setString(2, registro.getDescripcion());
            procedimiento.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void reportes() {
        switch (tipoDeOperaciones) {
            case ACTUALIZAR:
                desactivarControles();
                limpiarControles();
                btnEditarTipo.setText("Editar");
                btnReportesTipos.setText("Reporte");
                btnAgregarTipo.setDisable(false);
                btnEliminarTipo.setDisable(false);
                tipoDeOperaciones = operaciones.NINGUNO;
                break;
        }
    }
    
    @FXML
    public void handleButtonAction(ActionEvent event) {
        if (event.getSource() == btnRegresar) {
            escenarioPrincipal.menuPrincipalView();
        }
    }
}
// org.angeltum.controller.MenuControllerTipoProducto