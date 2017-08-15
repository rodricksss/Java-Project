/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.CityBean;

/**
 *
 * @author sony
 */
public class CityModel {
    
    public boolean cityInsert(CityBean cib) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("insert into city(city_name, state_id)values(?,?)");
            MyConnection.pst.setString(1, cib.getCityname());
            MyConnection.pst.setInt(2, cib.getStateid());
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
