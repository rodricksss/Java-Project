/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.SubCategoryBean;

/**
 *
 * @author sony
 */
public class SubCategoryModel 
{
    public boolean subcategoryInsert(SubCategoryBean scab) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("insert into subcategory(cat_id, subcat_name)values(?,?)");
            MyConnection.pst.setInt(1, scab.getCatid());
            MyConnection.pst.setString(2, scab.getSubcatname());
            
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
