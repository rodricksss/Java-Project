/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.BuyerBean;
import java.sql.ResultSet;

/**
 *
 * @author sony
 */
public class BuyerModel 
{
    public boolean buyerCheck(BuyerBean bb, String uname, String upass) {
        boolean flag = false;
        try 
        {
            ResultSet rs;

            MyConnection.pst.close();
            MyConnection.pst=MyConnection.con.prepareStatement("select user_name, user_pass from buyer");
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
    
    public boolean buyerInsert(BuyerBean bb) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("insert into buyer(f_name, l_name, user_name, user_pass, email_id, address_line1, address_line2, state_id, city_id, mobile_no, landline_no, gender, dob, plan_id, security_id, answer)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            MyConnection.pst.setString(1, bb.getFname());
            MyConnection.pst.setString(2, bb.getLname());
            MyConnection.pst.setString(3, bb.getUname());
            MyConnection.pst.setString(4, bb.getUpass());
            MyConnection.pst.setString(5, bb.getEmail());
            MyConnection.pst.setString(6, bb.getAdd1());
            MyConnection.pst.setString(7, bb.getAdd2());
            MyConnection.pst.setInt(8, bb.getStateid());
            MyConnection.pst.setInt(9, bb.getCityid());
            MyConnection.pst.setString(10, bb.getMobile());
            MyConnection.pst.setString(11, bb.getLandline());
            MyConnection.pst.setString(12, bb.getGender());
            MyConnection.pst.setString(13, bb.getDob());
            MyConnection.pst.setInt(14, bb.getPlanid());
            MyConnection.pst.setInt(15, bb.getSecid());
            MyConnection.pst.setString(16, bb.getAnswer());
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
    
    public boolean buyerDelete(BuyerBean bb) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("delete buyer where buyer_id=?");
            MyConnection.pst.setInt(1, bb.getBid());            
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
    
    public boolean changePass(String oldpass, String newpass, String uname) {
        boolean flag = false;
        try 
        {     
            ResultSet rs;

            MyConnection.pst.close();
            MyConnection.pst=MyConnection.con.prepareStatement("select * from buyer where user_name=?");
            MyConnection.pst.setString(1, uname);
            rs = MyConnection.pst.executeQuery();
            while (rs.next()) 
            {
              if(rs.getString("user_pass").trim().equals(oldpass.trim()))
              {
                  MyConnection.pst.close();
                  MyConnection.pst=MyConnection.con.prepareStatement("update buyer set user_pass=? where user_name=?");
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
