package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2021/11/27 21:08
 */
public class Major {
    private String mid;
    private String majorname;
    private String fid;
    private String facultyname;

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

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public String getFacultyname() {
        return facultyname;
    }

    public void setFacultyname(String facultyname) {
        this.facultyname = facultyname;
    }

    @Override
    public String toString() {
        return "Major{" +
                "mid='" + mid + '\'' +
                ", majorname='" + majorname + '\'' +
                ", fid='" + fid + '\'' +
                ", facultyname='" + facultyname + '\'' +
                '}';
    }
}
