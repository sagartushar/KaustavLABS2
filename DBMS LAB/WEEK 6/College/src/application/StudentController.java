package application;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.sql.*;

public class StudentController {

    @FXML
    private TextField txtId;

    @FXML
    private Button btnShow;

    @FXML
    private TextField txtName;

    @FXML
    private Button btnNext;

    @FXML
    void onNext() {
    	try {
    		FXMLLoader loader = new FXMLLoader(getClass().getResource("Course.fxml"));
			AnchorPane root = (AnchorPane)loader.load();
			Scene scene = new Scene(root,400,400);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			
			CourseController controller = (CourseController)loader.getController();
			controller.setStudentId(txtId.getText());
			
			Stage stage = new Stage();
			stage.setScene(scene);
			stage.show();
		} catch(Exception e) {
			e.printStackTrace();
		}

    }

    @FXML
    void onShow() {
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver"); // for server IP address instead of localhost 
    		//Database connection
    		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@172.16.59.240:1521:cseorcl","C29","C29");
    		String sql = "SELECT name from Student where id=" + txtId.getText();// where id=10101";
    		ResultSet rs = con.createStatement().executeQuery(sql);
    		if(rs.next()) {
    			txtName.setText(rs.getString(1));
    		}
    		con.close();        	
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    }
}
