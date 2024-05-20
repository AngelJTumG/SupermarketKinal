
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
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import org.angeltum.bean.Clientes;
import org.angeltum.bean.Empleados;
import org.angeltum.bean.Factura;
import org.angeltum.db.Conexion;
import org.angeltum.system.Main;

/**
 *
 * @author Angel
 */
public class MenuControllerFactura implements Initializable {

    private Main escenarioPrincipal;
    
    @FXML
    Button btnRegresar;
    @FXML
    private Button btnDetalleFactura;
    @FXML
    private TableView tblFactura;

    @FXML
    private TableColumn colNumeroFactura;

    @FXML
    private TableColumn colEstado;

    @FXML
    private TableColumn colTotalFactura;

    @FXML
    private TableColumn colFechaFactura;

    @FXML
    private TableColumn colCodigoCliente;

    @FXML
    private TableColumn colEmpleado;

    @FXML
    private Button btnAgregar;

    @FXML
    private Button btnEliminar;

    @FXML
    private Button btnEditar;

    @FXML
    private Button btnReporte;

    @FXML
    private TextField txtNumeroFactura;

    @FXML
    private TextField txtEstado;

    @FXML
    private TextField txtTotalFactura;
    
    @FXML
    private TextField txtFechaFactura;

    @FXML
    private ComboBox cmbCodigoCliente;

    @FXML
    private ComboBox cmbEmpleado;

    @Override
    public void initialize(URL url, ResourceBundle rb
    ) {
        cargarDatos();
        cmbCodigoCliente.setItems(getClientes());
        cmbEmpleado.setItems(getEmpleados());
        buscarFacturas = FXCollections.observableArrayList();
    }
    
    private ObservableList<Factura> listarFacturas;
    private ObservableList<Factura> buscarFacturas;
    private ObservableList<Clientes> listarClientes;
    private ObservableList<Empleados> listarEmpleados;

    private enum operaciones {
        ELIMINAR, EDITAR, CANCELAR, ACTUALIZAR, NINGUNO
    }
    
    private operaciones tipoDeOperaciones = operaciones.NINGUNO;

    public Main getEscenarioPrincipal() {
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Main escenarioPrincipal) {
        this.escenarioPrincipal = escenarioPrincipal;
    }
    
    public void cargarDatos() {
        tblFactura.setItems(getFacturas());
        colNumeroFactura.setCellValueFactory(new PropertyValueFactory<>("numeroFactura"));
        colEstado.setCellValueFactory(new PropertyValueFactory<>("estado"));
        colTotalFactura.setCellValueFactory(new PropertyValueFactory<>("totalFactura"));
        colFechaFactura.setCellValueFactory(new PropertyValueFactory<>("fechaFactura"));
        colCodigoCliente.setCellValueFactory(new PropertyValueFactory<>("clienteID"));
        colEmpleado.setCellValueFactory(new PropertyValueFactory<>("codigoEmpleado"));
    }
    
    public ObservableList<Factura> getFacturas() {
        ArrayList<Factura> lista = new ArrayList<>();
        ResultSet resultado = null;
        try {
            PreparedStatement p = Conexion.getInstance().getConexion().prepareCall("call sp_ListarFactura();");
            resultado = p.executeQuery();
            while (resultado.next()) {
                lista.add(new Factura(resultado.getInt("numeroFactura"),
                        resultado.getString("estado"),
                        resultado.getDouble("totalFactura"),
                        resultado.getString("fechaFactura"),
                        resultado.getInt("clienteID"),
                        resultado.getInt("codigoEmpleado")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listarFacturas = FXCollections.observableList(lista);
    }
    
    public ObservableList<Clientes> getClientes() {
        ArrayList<Clientes> lista = new ArrayList<>();
        ResultSet resultado = null;
        try {
            PreparedStatement procedimiento = Conexion.getInstance().getConexion().prepareCall("call sp_ListarClientes();");
            resultado = procedimiento.executeQuery();
            while (resultado.next()) {
                lista.add(new Clientes(resultado.getInt("clienteID"),
                        resultado.getString("nombresCliente"),
                        resultado.getString("apellidosCliente"),
                        resultado.getString("NIT"),
                        resultado.getString("direccionCliente"),
                        resultado.getString("telefonoCliente"),
                        resultado.getString("correoCliente")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listarClientes = FXCollections.observableList(lista);
    }
    
    public ObservableList<Empleados> getEmpleados() {
        ArrayList<Empleados> lista = new ArrayList<>();
        ResultSet resultado = null;
        try {
            PreparedStatement p = Conexion.getInstance().getConexion().prepareCall("call sp_ListarEmpleados();");
            resultado = p.executeQuery();
            while (resultado.next()) {
                lista.add(new Empleados(resultado.getInt("codigoEmpleado"),
                        resultado.getString("nombresEmpleado"),
                        resultado.getString("apellidosEmpleado"),
                        resultado.getDouble("sueldo"),
                        resultado.getString("direccion"),
                        resultado.getString("turno"),
                        resultado.getInt("codigoCargoEmpleado")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listarEmpleados = FXCollections.observableList(lista);
    }
    
    public void guardar() {
        Factura registro = new Factura();
        registro.setNumeroFactura(Integer.parseInt(txtNumeroFactura.getText()));
        registro.setEstado(txtEstado.getText());
        registro.setTotalFactura(Double.parseDouble(txtTotalFactura.getText()));
        registro.setFechaFactura(txtFechaFactura.getText());
        registro.setClienteID(((Clientes) cmbCodigoCliente.getSelectionModel().getSelectedItem()).getClienteID());
        registro.setCodigoEmpleado(((Empleados) cmbEmpleado.getSelectionModel().getSelectedItem()).getCodigoEmpleado());
        try {
            PreparedStatement p = Conexion.getInstance().getConexion().prepareCall("call sp_AgregarFactura(?,?,?,?,?,?);");
            p.setInt(1, registro.getNumeroFactura());
            p.setString(2, registro.getEstado());
            p.setDouble(3, registro.getTotalFactura());
            p.setString(4, registro.getFechaFactura());
            p.setInt(5, registro.getClienteID());
            p.setInt(6, registro.getCodigoEmpleado());
            p.execute();
            listarFacturas.add(registro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void agregar() {
        switch (tipoDeOperaciones) {
            case NINGUNO:
                activarControles();
                btnEliminar.setText("Cancelar");
                btnEditar.setDisable(true);
                btnReporte.setDisable(true);
                tipoDeOperaciones = operaciones.ACTUALIZAR;
                break;
            case ACTUALIZAR:
                guardar();
                desactivarControles();
                limpiarControles();
                btnAgregar.setText("Agregar");
                btnEliminar.setText("Eliminar");
                btnEditar.setDisable(false);
                btnReporte.setDisable(false);
                tipoDeOperaciones = operaciones.NINGUNO;
                break;
        }
    }

    public Clientes buscarCliente(int codigoCliente) {
        Clientes resultado = null;
        try {
            PreparedStatement p = Conexion.getInstance().getConexion().prepareCall(" call sp_buscarClientes(?);");
            p.setInt(1, codigoCliente);
            ResultSet registro = p.executeQuery();
            while (registro.next()) {
                resultado = new Clientes(registro.getInt("ClienteID"),
                        registro.getString("nombresCliente"),
                        registro.getString("apellidosCliente"),
                        registro.getString("NIT"),
                        registro.getString("direccionCliente"),
                        registro.getString("telefonoCliente"),
                        registro.getString("correoCliente")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultado;
    }

    public Empleados buscarEmpleados(int codigoEmpleado) {
        Empleados resultado = null;
        try {
            PreparedStatement p = Conexion.getInstance().getConexion().prepareCall("call sp_buscarEmpleados(?);");
            p.setInt(1, codigoEmpleado);
            ResultSet registro = p.executeQuery();
            while (registro.next()) {
                resultado = new Empleados(registro.getInt("codigoEmpleado"),
                        registro.getString("nombresEmpleado"),
                        registro.getString("apellidosEmpleado"),
                        registro.getDouble("sueldo"),
                        registro.getString("direccion"),
                        registro.getString("turno"),
                        registro.getInt("codigoCargoEmpleado"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultado;
    }
    
    
    
    public void desactivarControles() {
        txtNumeroFactura.setEditable(false);
        txtEstado.setEditable(false);
        txtTotalFactura.setEditable(false);
        cmbCodigoCliente.setDisable(true);
        cmbEmpleado.setDisable(true);
    }

    public void activarControles() {
        txtNumeroFactura.setEditable(true);
        txtEstado.setEditable(true);
        txtTotalFactura.setEditable(true);
        cmbCodigoCliente.setDisable(false);
        cmbEmpleado.setDisable(false);
    }

    public void limpiarControles() {
        txtNumeroFactura.clear();
        txtEstado.clear();
        txtTotalFactura.clear();
        tblFactura.getSelectionModel().getSelectedItem();
        cmbCodigoCliente.getSelectionModel().getSelectedItem();
        cmbEmpleado.getSelectionModel().getSelectedItem();
    }
    
    @FXML
    public void handleButtonAction(ActionEvent event) {
        if (event.getSource() == btnRegresar) {
            escenarioPrincipal.menuPrincipalView();
        }
    }
}
