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
import javax.swing.JOptionPane;
import org.angeltum.bean.Clientes;
import org.angeltum.db.Conexion;
import org.angeltum.system.Main;

/**
 *
 * @author Angel
 */

public class ClienteVistaController implements Initializable {

    private ObservableList<Clientes> listaClientes;
    private Main escenarioPrincipal;

    private enum operaciones {
        AGREGAR, ELIMINAR, EDITAR, ACTUALIZAR, CANCELAR, NINGUNO
    }
    private operaciones tipoDeOperaciones = operaciones.NINGUNO;

    @FXML
    private TableColumn colClienteID;

    @FXML
    private TableColumn colNombreClientes;

    @FXML
    private TableColumn colApellidosClientes;

    @FXML
    private TableColumn colDireccionClientes;

    @FXML 
    private TableView tblCliente;
    
    @FXML
    private TableColumn colNit;

    @FXML
    private TableColumn colTelefonoClientes;

    @FXML
    private TableColumn colCorreoClientes;

    @FXML
    private Button btnEditar;

    @FXML
    private Button btnEliminar;

    @FXML
    private Button btnReportes;

    @FXML
    private Button btnAgregar;

    @FXML
    private TextField txtClienteID;

    @FXML
    private TextField txtNombreClientes;

    @FXML
    private TextField txtApellidosCliente;

    @FXML
    private TextField txtDireccionCliente;

    @FXML
    private TextField txtNIT;

    @FXML
    private TextField txtTelefonoCli;

    @FXML
    private TextField txtCorreoCliente;

    @FXML
    private Button btnRegresar;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO

    }

    public void cargarDatos() {
        tblCliente.setItems(getClientes());
        colClienteID.setCellValueFactory(new PropertyValueFactory<Clientes, Integer>("clienteID"));
        colNombreClientes.setCellValueFactory(new PropertyValueFactory<Clientes, Integer>("nombreClientes"));
        colApellidosClientes.setCellValueFactory(new PropertyValueFactory<Clientes, Integer>("apellidosClientes"));
        colDireccionClientes.setCellValueFactory(new PropertyValueFactory<Clientes, Integer>("direccionClientes"));
        colNit.setCellValueFactory(new PropertyValueFactory<Clientes, Integer>("NIT"));
        colTelefonoClientes.setCellValueFactory(new PropertyValueFactory<Clientes, Integer>("telefonoClientes"));
        colCorreoClientes.setCellValueFactory(new PropertyValueFactory<Clientes, Integer>("correoClientes"));

    }

    public void seleccionarElemento() {
        txtClienteID.setText(String.valueOf(((Clientes) tblCliente.getSelectionModel().getSelectedItem()).getClienteID()));
        txtNombreClientes.setText((((Clientes) tblCliente.getSelectionModel().getSelectedItem()).getNombreClientes()));
        txtApellidosCliente.setText((((Clientes) tblCliente.getSelectionModel().getSelectedItem()).getApellidosClientes()));
        txtDireccionCliente.setText((((Clientes) tblCliente.getSelectionModel().getSelectedItem()).getDireccionClientes()));
        txtNIT.setText((((Clientes) tblCliente.getSelectionModel().getSelectedItem()).getNITClientes()));
        txtTelefonoCli.setText((((Clientes) tblCliente.getSelectionModel().getSelectedItem()).getTelefonoClientes()));
        txtCorreoCliente.setText((((Clientes) tblCliente.getSelectionModel().getSelectedItem()).getCorreoClientes()));
    }

    public ObservableList<Clientes> getClientes() {
        ArrayList<Clientes> lista = new ArrayList<>();
        try {
            PreparedStatement procedimiento = Conexion.getInstance().getConexion().prepareCall("{call sp_ListarClientes()}");
            ResultSet resultado = procedimiento.executeQuery();
            while (resultado.next()) {
                lista.add(new Clientes(resultado.getInt("clienteID"),
                        resultado.getString("nombreClientes"),
                        resultado.getString("apellidosClientes"),
                        resultado.getString("direccionClientes"),
                        resultado.getString("NIT"),
                        resultado.getString("telefonoClientes"),
                        resultado.getString("correoClientes")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaClientes = FXCollections.observableList(lista);
    }

    public void Agregar() {
        switch (tipoDeOperaciones) {
            case NINGUNO:
                activarControles();
                btnAgregar.setText("Guardar");
                btnEliminar.setText("Cancelar");
                btnEditar.setDisable(true);
                btnReportes.setDisable(true);

                tipoDeOperaciones = operaciones.ACTUALIZAR;
                break;
            case ACTUALIZAR:
                Guardar();
                desactivarControles();
                limpiarControles();
                btnAgregar.setText("Agregar");
                btnEliminar.setText("Eliminar");
                btnEditar.setDisable(false);
                btnReportes.setDisable(false);
                tipoDeOperaciones = operaciones.NINGUNO;
                break;
        }
    }

    public void Guardar() {
        Clientes registro = new Clientes();
        registro.setClienteID(Integer.parseInt(txtClienteID.getText()));
        registro.setNombreClientes(txtNombreClientes.getText());
        registro.setApellidosClientes(txtApellidosCliente.getText());
        registro.setDireccionClientes(txtDireccionCliente.getText());
        registro.setNIT(txtNIT.getText());
        registro.setTelefonoClientes(txtTelefonoCli.getText());
        registro.setCorreoClientes(txtCorreoCliente.getText());
        try {
            PreparedStatement procedimiento = Conexion.getInstance().getConexion().prepareCall("{call sp_AgregarClientes(?,?,?,?,?,?,?)}");
            procedimiento.setInt(1, registro.getClienteID());
            procedimiento.setString(2, registro.getNombreClientes());
            procedimiento.setString(3, registro.getApellidosClientes());
            procedimiento.setString(4, registro.getDireccionClientes());
            procedimiento.setString(5, registro.getNIT());
            procedimiento.setString(6, registro.getTelefonoClientes());
            procedimiento.setString(7, registro.getCorreoClientes());
            procedimiento.execute();
            listaClientes.add(registro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminar() {
        switch (tipoDeOperaciones) {
            case ACTUALIZAR:
                desactivarControles();
                limpiarControles();
                btnAgregar.setText("Agregar");
                btnEliminar.setText("Eliminar");
                btnEditar.setDisable(false);
                btnReportes.setDisable(false);
                //imgAgregar.setImage(new Image ("/org/angeltum/imagenes/guardar.png")); importar se hace por cada boton
                // revisar todo los nombres 
                tipoDeOperaciones = operaciones.NINGUNO;
                break;
            default:
                if (tblCliente.getSelectionModel().getSelectedItem() != null) {
                    int respuesta = JOptionPane.showConfirmDialog(null, "Confirmas la eliminacion del registro?", "Eliminar Clientes", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);

                    if (respuesta == JOptionPane.YES_NO_OPTION) {
                        try {
                            PreparedStatement procedimiento = Conexion.getInstance().getConexion().prepareCall("{call sp_eliminarClientes(?)}");
                            procedimiento.setInt(1, ((Clientes) tblCliente.getSelectionModel().getSelectedItem()).getClienteID());
                            procedimiento.execute();
                            listaClientes.remove(tblCliente.getSelectionModel().getSelectedItem());
                            limpiarControles();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "Debe de seleccionar un cliente para eliminar");
                }

                break;
        }
    }

    public void editar() {
        switch (tipoDeOperaciones) {
            case NINGUNO:
                if (tblCliente.getSelectionModel().getSelectedItem() != null) {
                    btnEditar.setText("Actualizar");
                    btnReportes.setText("cancelar");
                    btnAgregar.setDisable(true);
                    btnEliminar.setDisable(true);
                    activarControles();
                    txtClienteID.setEditable(false);
                    tipoDeOperaciones = operaciones.ACTUALIZAR;
                } else {
                    JOptionPane.showMessageDialog(null, "debe seleccrionar un cliente para editar");
                }
                break;
            case ACTUALIZAR:
                actualizar();
                btnEditar.setText("EDITAR");
                btnReportes.setText("reporte");
                btnAgregar.setDisable(false);
                btnEliminar.setDisable(false);
                //imgAgregar.setImage(new Image ("/org/angeltum/imagenes/guardar.png")); importar se hace por cada boton
                desactivarControles();
                tipoDeOperaciones = operaciones.NINGUNO;
                cargarDatos();
                break;
        }

    }

    public void actualizar() {
        try {
            PreparedStatement procedimiento = Conexion.getInstance().getConexion().prepareCall("{call sp_editarClientes(?,?,?,?,?,?,?)}");
            Clientes registro = (Clientes) tblCliente.getSelectionModel().getSelectedItem();
            registro.setNombreClientes(txtNombreClientes.getText());
            registro.setApellidosClientes(txtApellidosCliente.getText());
            registro.setDireccionClientes(txtDireccionCliente.getText());
            registro.setNIT(txtNIT.getText());
            registro.setTelefonoClientes(txtTelefonoCli.getText());
            registro.setCorreoClientes(txtCorreoCliente.getText());
            procedimiento.setInt(1, registro.getClienteID());
            procedimiento.setString(2, registro.getNombreClientes());
            procedimiento.setString(3, registro.getApellidosClientes());
            procedimiento.setString(4, registro.getDireccionClientes());
            procedimiento.setString(5, registro.getNITClientes());
            procedimiento.setString(6, registro.getTelefonoClientes());
            procedimiento.setString(7, registro.getCorreoClientes());
            procedimiento.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void cancelar() {
        switch (tipoDeOperaciones) {
            case NINGUNO:
                desactivarControles();
                limpiarControles();
                btnEditar.setText("editar");
                btnReportes.setText("reportes");
                btnAgregar.setDisable(false);
                btnEliminar.setDisable(false);
                tipoDeOperaciones = operaciones.NINGUNO;
        }
    }

    public void desactivarControles() {
        txtClienteID.setEditable(false);
        txtNombreClientes.setEditable(false);
        txtApellidosCliente.setEditable(false);
        txtDireccionCliente.setEditable(false);
        txtNIT.setEditable(false);
        txtTelefonoCli.setEditable(false);
        txtCorreoCliente.setEditable(false);
    }

    public void activarControles() {
        txtClienteID.setEditable(true);
        txtNombreClientes.setEditable(true);
        txtApellidosCliente.setEditable(true);
        txtDireccionCliente.setEditable(true);
        txtNIT.setEditable(true);
        txtTelefonoCli.setEditable(true);
        txtCorreoCliente.setEditable(true);
    }

    public void limpiarControles() {
        txtClienteID.clear();
        txtNombreClientes.clear();
        txtApellidosCliente.clear();
        txtDireccionCliente.clear();
        txtNIT.clear();
        txtTelefonoCli.clear();
        txtCorreoCliente.clear();
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
