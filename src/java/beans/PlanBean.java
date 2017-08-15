/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author sony
 */
public class PlanBean {
    private int planid;
    private String planname;
    private float cost;
    private String duration;

    public int getPlanid() {
        return planid;
    }

    public void setPlanid(int planid) {
        this.planid = planid;
    }

    public String getPlanname() {
        return planname;
    }

    public void setPlanname(String planname) {
        this.planname = planname;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }
    
    
}
