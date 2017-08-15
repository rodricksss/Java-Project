/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import beans.CategoryBean;

/**
 *
 * @author sony
 */
public class CategoryModel 
{
    public boolean categoryInsert(CategoryBean cab) 
    {
        boolean flag = false;
        try 
        {           
            MyConnection.pst.close();
            MyConnection.pst = MyConnection.con.prepareStatement("insert into category(cat_name)values(?)");
            MyConnection.pst.setString(1, cab.getCatname());
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
