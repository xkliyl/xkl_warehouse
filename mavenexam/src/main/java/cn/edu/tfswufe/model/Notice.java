package cn.edu.tfswufe.model;

import java.util.Date;

/**
 * @author 阿秋
 * @date 2021/11/27 21:17
 */
public class Notice {
    private Integer noticeid;
    private String ntitle;
    private String ncontent;
    private Date ntime;
    private String power;


    public Integer getNoticeid() {
        return noticeid;
    }

    public void setNoticeid(Integer noticeid) {
        this.noticeid = noticeid;
    }

    public String getNtitle() {
        return ntitle;
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle;
    }

    public String getNcontent() {
        return ncontent;
    }

    public void setNcontent(String ncontent) {
        this.ncontent = ncontent;
    }

    public Date getNtime() {
        return ntime;
    }

    public void setNtime(Date ntime) {
        this.ntime = ntime;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "noticeid='" + noticeid + '\'' +
                ", ntitle='" + ntitle + '\'' +
                ", ncontent='" + ncontent + '\'' +
                ", ntime=" + ntime +
                ", power='" + power + '\'' +
                '}';
    }
}
