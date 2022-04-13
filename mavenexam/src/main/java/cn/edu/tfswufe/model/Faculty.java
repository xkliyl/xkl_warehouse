package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2021/11/27 21:14
 */
public class Faculty {
    private String fid;
    private String facultyname;

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
        return "Faculty{" +
                "fid='" + fid + '\'' +
                ", facultyname='" + facultyname + '\'' +
                '}';
    }
}
