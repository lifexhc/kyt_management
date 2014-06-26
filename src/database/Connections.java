package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class Connections {
//public class connectionACE {
 

	 public static Connection getConnection(){
	        Connection conn = null;
	        try {
	        	
	            Class.forName("com.mysql.jdbc.Driver").newInstance();
	            conn = DriverManager.getConnection("jdbc:mysql://121.201.7.153:3306/db4sm1ji23kix8uy?characterEncoding=utf8","root2","123qwe");
	          //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db4sm1ji23kix8uy?characterEncoding=utf8","root","mima");
	            
	        } catch (InstantiationException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IllegalAccessException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	         
	        return conn;
	         
	    }

}