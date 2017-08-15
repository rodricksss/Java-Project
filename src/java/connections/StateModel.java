/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.StateBean;

/**
 *
 * @author sony
 */
public class StateModel 
{
    public boolean stateInsert(StateBean st) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("insert into state(state_name)values(?)");
            MyConnection.pst.setString(1, st.getStatename());
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
