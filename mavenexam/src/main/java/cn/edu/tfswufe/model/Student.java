package cn.edu.tfswufe.model;

import java.util.Date;

/**
 * @author 阿秋
 * @date 2021/11/27 21:20
 */
public class Student {
    private String sno;
    private String sname;
    private Date sbirthday;
    private String ssex;
    private String cid;
    private String cname;
    private String fname;
    private String password;

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }
    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public Date getSbirthday() {
        return sbirthday;
    }

    public void setSbirthday(Date sbirthday) {
        this.sbirthday = sbirthday;
    }

    public String getSsex() {
        return ssex;
    }

    public void setSsex(String ssex) {
        this.ssex = ssex;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sno='" + sno + '\'' +
                ", sname='" + sname + '\'' +
                ", sbirthday=" + sbirthday +
                ", ssex='" + ssex + '\'' +
                ", cid='" + cid + '\'' +
                ", cname='" + cname + '\'' +
                ", fname='" + fname + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
