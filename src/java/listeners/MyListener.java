/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import connections.MyConnection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author sony
 */
public class MyListener implements ServletContextListener{

    
    public void contextInitialized(ServletContextEvent sce) {
        try 
        { 
            MyConnection con=new MyConnection();
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(MyListener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void contextDestroyed(ServletContextEvent sce) 
    {
        
    }
    
}
