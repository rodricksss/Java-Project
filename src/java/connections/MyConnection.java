/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author sony
 */
public class MyConnection {

    public static Connection con;
    public static PreparedStatement pst;

    public MyConnection() throws SQLException {
        try
        {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ThinkAHome;selectMethod=cursor", "Rodricks", "");
        //con=DriverManager.getConnection("jdbc:sqlserver://192.168.57.6:1433;databaseName=ThinkAHome;selectMethod=cursor", "testjava", "java450");
        //con = DriverManager.getConnection("jdbc:odbc:dsnapp", "sa", "abc123");
        pst=con.prepareStatement("");
        
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        }
    
}
