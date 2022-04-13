package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2022/3/10 17:58
 */
public class Examination {
    private String testid;
    private String testtitle;
    private String power;
    private String crid;

    public String getCrid() {
        return crid;
    }

    public void setCrid(String crid) {
        this.crid = crid;
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

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    @Override
    public String toString() {
        return "Examination{" +
                "testid='" + testid + '\'' +
                ", testtitle='" + testtitle + '\'' +
                ", power='" + power + '\'' +
                ", crid='" + crid + '\'' +
                '}';
    }
}
