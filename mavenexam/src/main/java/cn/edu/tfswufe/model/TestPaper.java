package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2022/3/11 13:29
 */
public class TestPaper {
    private String testid;
    private String testtitle;
    private String cid;
    private String sno;
    private String sname;
    private Integer grade;
    private String crid;

    public String getCrid() {
        return crid;
    }

    public void setCrid(String crid) {
        this.crid = crid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getTesttitle() {
        return testtitle;
    }

    public void setTesttitle(String testtitle) {
        this.testtitle = testtitle;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getTestid() {
        return testid;
    }

    public void setTestid(String testid) {
        this.testid = testid;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "TestPaper{" +
                "testid='" + testid + '\'' +
                ", testtitle='" + testtitle + '\'' +
                ", cid='" + cid + '\'' +
                ", sno='" + sno + '\'' +
                ", sname='" + sname + '\'' +
                ", grade=" + grade +
                ", crid='" + crid + '\'' +
                '}';
    }
}
