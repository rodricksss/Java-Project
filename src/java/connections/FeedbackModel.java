/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.FeedbackBean;

/**
 *
 * @author sony
 */
public class FeedbackModel {
    
    public boolean feedbackDelete(FeedbackBean fb) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("delete feedback where feedback_id=?");
            MyConnection.pst.setInt(1, fb.getFeedbackid());            
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
