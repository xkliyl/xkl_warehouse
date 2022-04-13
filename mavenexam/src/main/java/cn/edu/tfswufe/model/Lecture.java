package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2022/3/10 15:11
 */
public class Lecture {
    String tid;
    String cid;
    String classname;
    String crid;
    String crname;
    String mid;
    String majorname;

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
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

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCrid() {
        return crid;
    }

    public void setCrid(String crid) {
        this.crid = crid;
    }

    @Override
    public String toString() {
        return "Lecture{" +
                "tid='" + tid + '\'' +
                ", cid='" + cid + '\'' +
                ", crid='" + crid + '\'' +
                '}';
    }
}
