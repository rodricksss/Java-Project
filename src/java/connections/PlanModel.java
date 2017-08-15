/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.PlanBean;

/**
 *
 * @author sony
 */
public class PlanModel {
     public boolean planInsert(PlanBean pb) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("insert into plans(plan_name,cost,duration)values(?,?,?)");
            MyConnection.pst.setString(1, pb.getPlanname());
            MyConnection.pst.setFloat(2, pb.getCost());
            MyConnection.pst.setString(3, pb.getDuration());
            
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
