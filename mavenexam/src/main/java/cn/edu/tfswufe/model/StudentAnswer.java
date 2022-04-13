package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2022/3/11 14:36
 */
public class StudentAnswer {
    private String sno;
    private String testid;
    private Integer qid;
    private String myanswer;

    private Integer correct;

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getTestid() {
        return testid;
    }

    public void setTestid(String testid) {
        this.testid = testid;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public String getMyanswer() {
        return myanswer;
    }

    public void setMyanswer(String myanswer) {
        this.myanswer = myanswer;
    }


    public Integer getCorrect() {
        return correct;
    }

    public void setCorrect(Integer correct) {
        this.correct = correct;
    }

    @Override
    public String toString() {
        return "StudentAnswer{" +
                "sno='" + sno + '\'' +
                ", testid='" + testid + '\'' +
                ", qid=" + qid +
                ", myanswer='" + myanswer + '\'' +
                ", correct=" + correct +
                '}';
    }
}
