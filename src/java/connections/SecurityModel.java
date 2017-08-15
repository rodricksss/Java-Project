/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.SecurityBean;

/**
 *
 * @author sony
 */
public class SecurityModel {
    
    public boolean securityInsert(SecurityBean seb) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("insert into security(security_ques)values(?)");
            MyConnection.pst.setString(1, seb.getSecurityques());
            int row = MyConnection.pst.executeUpdate();
            
            if(row>0)
            {
                flag = true;
            }            
        } 
        catch (Exception ex) 
        {
            System.out.println(ex);
        }
        return flag;
    }       
    
}
