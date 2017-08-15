/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author sony
 */
public class SubCategoryBean {
    private int catid;
    private int subcatid;
    private String subcatname;

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public int getSubcatid() {
        return subcatid;
    }

    public void setSubcatid(int subcatid) {
        this.subcatid = subcatid;
    }

    public String getSubcatname() {
        return subcatname;
    }

    public void setSubcatname(String subcatname) {
        this.subcatname = subcatname;
    }
        
}
