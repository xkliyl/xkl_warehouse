package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2022/3/10 18:06
 */
public class TeacherTestPaper {
    private String testid;
    private String testtitle;
    private String sno;
    private Integer qid;
    private String questiontype;
    private String title;
    private String optiona;
    private String optionb;
    private String optionc;
    private String optiond;
    private String answer;
    private String myanswer;
    private Integer correct;

    public Integer getCorrect() {
        return correct;
    }

    public void setCorrect(Integer correct) {
        this.correct = correct;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }


    public String getTesttitle() {
        return testtitle;
    }

    public void setTesttitle(String testtitle) {
        this.testtitle = testtitle;
    }

    public String getMyanswer() {
        return myanswer;
    }

    public void setMyanswer(String myanswer) {
        this.myanswer = myanswer;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOptiona() {
        return optiona;
    }

    public void setOptiona(String optiona) {
        this.optiona = optiona;
    }

    public String getOptionb() {
        return optionb;
    }

    public void setOptionb(String optionb) {
        this.optionb = optionb;
    }

    public String getOptionc() {
        return optionc;
    }

    public void setOptionc(String optionc) {
        this.optionc = optionc;
    }

    public String getOptiond() {
        return optiond;
    }

    public void setOptiond(String optiond) {
        this.optiond = optiond;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getQuestiontype() {
        return questiontype;
    }

    public void setQuestiontype(String questiontype) {
        this.questiontype = questiontype;
    }

    @Override
    public String toString() {
        return "TeacherTestPaper{" +
                "testid='" + testid + '\'' +
                ", testtitle='" + testtitle + '\'' +
                ", qid=" + qid +
                ", questiontype='" + questiontype + '\'' +
                ", title='" + title + '\'' +
                ", optiona='" + optiona + '\'' +
                ", optionb='" + optionb + '\'' +
                ", optionc='" + optionc + '\'' +
                ", optiond='" + optiond + '\'' +
                ", answer='" + answer + '\'' +
                ", myanswer='" + myanswer + '\'' +
                '}';
    }
}
