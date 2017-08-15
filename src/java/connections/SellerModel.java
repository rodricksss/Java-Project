/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.SellerBean;
import java.sql.ResultSet;

/**
 *
 * @author sony
 */
public class SellerModel 
{
    public boolean sellerCheck(SellerBean sb, String uname, String upass) {
        boolean flag = false;
        try 
        {
            ResultSet rs;

            MyConnection.pst.close();
            MyConnection.pst=MyConnection.con.prepareStatement("select user_name, user_pass from seller");
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
        
    
    public boolean sellerDelete(SellerBean sb) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("delete seller where seller_id=?");
            MyConnection.pst.setInt(1, sb.getSid());            
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
    
    public boolean sellerInsert(SellerBean sb) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("insert into seller(f_name, l_name, user_name, user_pass, email_id, address_line1, address_line2, state_id, city_id, mobile_no, landline_no, gender, dob, plan_id, security_id, answer)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            MyConnection.pst.setString(1, sb.getFname());
            MyConnection.pst.setString(2, sb.getLname());
            MyConnection.pst.setString(3, sb.getUname());
            MyConnection.pst.setString(4, sb.getUpass());
            MyConnection.pst.setString(5, sb.getEmail());
            MyConnection.pst.setString(6, sb.getAdd1());
            MyConnection.pst.setString(7, sb.getAdd2());
            MyConnection.pst.setInt(8, sb.getStateid());
            MyConnection.pst.setInt(9, sb.getCityid());
            MyConnection.pst.setString(10, sb.getMobile());
            MyConnection.pst.setString(11, sb.getLandline());
            MyConnection.pst.setString(12, sb.getGender());
            MyConnection.pst.setString(13, sb.getDob());
            MyConnection.pst.setInt(14, sb.getPlanid());
            MyConnection.pst.setInt(15, sb.getSecid());
            MyConnection.pst.setString(16, sb.getAnswer());
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
    
    public boolean regSeller(SellerBean sb, int planid) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("insert into seller(f_name,l_name,user_name,user_pass,email_id,address_line1,state_id,city_id,mobile_no,landline_no,gender,dob,plan_id,security_id,answer)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            MyConnection.pst.setString(1, sb.getFname());
            MyConnection.pst.setString(2, sb.getLname());
            MyConnection.pst.setString(3, sb.getUname());
            MyConnection.pst.setString(4, sb.getUpass());
            MyConnection.pst.setString(5, sb.getEmail());
            MyConnection.pst.setString(6, sb.getAdd1());
            MyConnection.pst.setInt(7, sb.getStateid());
            MyConnection.pst.setInt(8, sb.getCityid());
            MyConnection.pst.setString(9, sb.getMobile());
            MyConnection.pst.setString(10, sb.getLandline());
            MyConnection.pst.setString(11, sb.getGender());
            MyConnection.pst.setString(12, sb.getDob());
            MyConnection.pst.setInt(13, planid);
            MyConnection.pst.setInt(14, sb.getSecid());
            MyConnection.pst.setString(15, sb.getAnswer());
            
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
            MyConnection.pst=MyConnection.con.prepareStatement("select * from seller where user_name=?");
            MyConnection.pst.setString(1, uname);
            rs = MyConnection.pst.executeQuery();
            while (rs.next()) 
            {
              if(rs.getString("user_pass").trim().equals(oldpass.trim()))
              {
                  MyConnection.pst.close();
                  MyConnection.pst=MyConnection.con.prepareStatement("update seller set user_pass=? where user_name=?");
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
