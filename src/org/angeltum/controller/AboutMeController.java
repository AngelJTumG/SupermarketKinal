
package org.angeltum.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import org.angeltum.system.Main;

/**
 *
 * @author Angel
 */
public class AboutMeController implements Initializable{
    private Main escenarioPrincipal;
    @FXML
    private Button btnHome;

    
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    @FXML 
        public void handleButtonAction(ActionEvent event){
        if (event.getSource() == btnHome)
           escenarioPrincipal.menuPrincipalView();
            
        }

    public Main getEscenarioPrincipal() {
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Main escenarioPrincipal) {
        this.escenarioPrincipal = escenarioPrincipal;
    }
}
