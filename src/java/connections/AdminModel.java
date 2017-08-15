/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.AdminBean;
import java.sql.ResultSet;

/**
 *
 * @author sony
 */
public class AdminModel 
{
   
    public boolean adminCheck(AdminBean ab, String uname, String upass) {
        boolean flag = false;
        try 
        {
            ResultSet rs;

            MyConnection.pst.close();
            MyConnection.pst=MyConnection.con.prepareStatement("select user_name, user_pass from admin");
            rs = MyConnection.pst.executeQuery();
            while (rs.next()) 
            {
                if (uname.equals(rs.getString("user_name").trim()) && upass.equals(rs.getString("user_pass").trim())) 
                {                   
                    flag = true;                    
                }
            }

        } 
        catch (Exception ex) 
        {
            System.out.println(ex);
        }
        return flag;
    }
    
    
    public boolean changePass(AdminBean ab, String oldpass, String newpass, String uname) {
        boolean flag = false;
        try 
        {     
            ResultSet rs;

            MyConnection.pst.close();
            MyConnection.pst=MyConnection.con.prepareStatement("select * from admin where user_name=?");
            MyConnection.pst.setString(1, uname);
            rs = MyConnection.pst.executeQuery();
            while (rs.next()) 
            {
              if(rs.getString("user_pass").trim().equals(oldpass.trim()))
              {
                  MyConnection.pst.close();
                  MyConnection.pst=MyConnection.con.prepareStatement("update admin set user_pass=? where user_name=?");
                  MyConnection.pst.setString(1, newpass.trim());
                  MyConnection.pst.setString(2, uname);
                  int row=MyConnection.pst.executeUpdate();
                  if(row>0)
                  {
                      flag=true;
                  }
                  MyConnection.pst.close();
              }
              
            }
            return flag;
        } 
        catch (Exception ex) 
        {
            System.out.println(ex);
        }
        return flag;
    }
    
}
