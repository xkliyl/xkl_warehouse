package cn.edu.tfswufe.model;

import java.util.Date;

/**
 * @author 阿秋
 * @date 2021/11/27 21:22
 */
public class Teacher {
    private String tid;
    private String tname;
    private Date tbirthday;
    private String tsex;
    private String password;



    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Date getTbirthday() {
        return tbirthday;
    }

    public void setTbirthday(Date tbirthday) {
        this.tbirthday = tbirthday;
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
        this.tsex = tsex;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "tid='" + tid + '\'' +
                ", tname='" + tname + '\'' +
                ", tbirthday=" + tbirthday +
                ", tsex='" + tsex + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
