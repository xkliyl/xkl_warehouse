package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2021/11/27 21:08
 */
public class Course {
    private String crid;
    private String crname;
    private String mid;
    private String majorname;

    public String getCrid() {
        return crid;
    }

    public void setCrid(String crid) {
        this.crid = crid;
    }

    public String getCrname() {
        return crname;
    }

    public void setCrname(String crname) {
        this.crname = crname;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMajorname() {
        return majorname;
    }

    public void setMajorname(String majorname) {
        this.majorname = majorname;
    }

    @Override
    public String toString() {
        return "Course{" +
                "crid='" + crid + '\'' +
                ", crname='" + crname + '\'' +
                ", mid='" + mid + '\'' +
                ", majorname='" + majorname + '\'' +
                '}';
    }
}
