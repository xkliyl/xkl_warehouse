package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2021/11/27 21:07
 */
public class Classes {
    private String cid;
    private String classname;
    private String mid;
    private String majorname;

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
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
        return "Classes{" +
                "cid='" + cid + '\'' +
                ", classname='" + classname + '\'' +
                ", mid='" + mid + '\'' +
                ", majorname='" + majorname + '\'' +
                '}';
    }
}
