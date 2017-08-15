/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.PropertyBean;
import java.sql.ResultSet;

/**
 *
 * @author sony
 */
public class PropertyModel {
    
    
     public boolean insertProperty(PropertyBean pb, int sellerid) 
     {
        boolean flag = false;
        try 
        {  
            MyConnection.pst.close();
            MyConnection.pst=MyConnection.con.prepareStatement("insert into property(available_option,seller_id,cat_id,subcat_id,state_id,city_id,address_line,area,price,describe,know_status)values(?,?,?,?,?,?,?,?,?,?,?)");
            MyConnection.pst.setString(1, pb.getAvail());
            MyConnection.pst.setInt(2, sellerid);
            MyConnection.pst.setInt(3, pb.getCatid());
            MyConnection.pst.setInt(4, pb.getSubcatid());
            MyConnection.pst.setInt(5, pb.getStateid());
            MyConnection.pst.setInt(6, pb.getCityid());
            MyConnection.pst.setString(7, pb.getAddress());
            MyConnection.pst.setString(8, pb.getArea());
            MyConnection.pst.setFloat(9, pb.getPrice());
            MyConnection.pst.setString(10, pb.getDescription());
            MyConnection.pst.setString(11, pb.getStatus());
            int row=MyConnection.pst.executeUpdate();
            
            if(row>0)
            {
                flag=true;
            }
            
        }
         catch (Exception ex) 
        {
            System.out.println(ex);
        }
        return flag;
     }    
}
