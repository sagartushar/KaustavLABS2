package application;
import java.sql.*;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
public class CourseController {
	
	private ObservableList<Course> data;

    @FXML
    private TableView<Course> tblCourses;

    @FXML
    private TextField txtId;

    @FXML
    private TableColumn<Course, String> tblColCourseId;

    @FXML
    private Button btnId;
    
    @FXML
    public void initialize() {
    	tblColCourseId.setCellValueFactory(new PropertyValueFactory<>("courseId"));
    }

    @FXML
    void onShow() {
    	data = FXCollections.observableArrayList();
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver"); // for server IP address instead of localhost 
    		//Database connection
    		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@172.16.59.240:1521:cseorcl","C29","C29");
    		String sql = "SELECT course_id as courseId from Takes where id=" + txtId.getText();// where id=10101";
    		ResultSet rs = con.createStatement().executeQuery(sql);  	
    		while(rs.next()) {
    			data.add(new Course(rs.getString(1)));
    			//System.out.print(rs.getString(1));
    		}
    		tblCourses.getItems().clear();
    		tblCourses.setItems(data);
    		con.close();
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    }
    public void setStudentId(String id){
    	txtId.setText(id);
    }

}
