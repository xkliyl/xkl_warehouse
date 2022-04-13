package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2022/3/10 15:12
 */
public class ClassAndCourse {
    String cid;
    String crid;

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
        return "ClassAndCourseDao{" +
                "cid='" + cid + '\'' +
                ", crid='" + crid + '\'' +
                '}';
    }
}
