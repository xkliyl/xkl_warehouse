package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2022/3/11 10:33
 */
public class TestToStudent {
    private String testid;
    private String testtitle;
    private String cid;
    private String classname;
    private String crid;
    private String crname;
    private Integer power;
    private String tid;

    public String getCrname() {
        return crname;
    }

    public void setCrname(String crname) {
        this.crname = crname;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getTestid() {
        return testid;
    }

    public void setTestid(String testid) {
        this.testid = testid;
    }

    public String getTesttitle() {
        return testtitle;
    }

    public void setTesttitle(String testtitle) {
        this.testtitle = testtitle;
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

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    @Override
    public String toString() {
        return "TestToStudent{" +
                "testid='" + testid + '\'' +
                ", testtitle='" + testtitle + '\'' +
                ", cid='" + cid + '\'' +
                ", classname='" + classname + '\'' +
                ", crid='" + crid + '\'' +
                ", crname='" + crname + '\'' +
                ", power=" + power +
                ", tid='" + tid + '\'' +
                '}';
    }
}
