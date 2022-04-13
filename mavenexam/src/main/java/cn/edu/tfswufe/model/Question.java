package cn.edu.tfswufe.model;

import java.util.Date;

/**
 * @author 阿秋
 * @date 2022/3/10 17:53
 */
public class Question {
    private Integer qid;
    private String questiontype;
    private String title;
    private String optiona;
    private String optionb;
    private String optionc;
    private String optiond;
    private String answer;
    private Integer correct;
    private Date createtime;
    private String power;

    public Integer getCorrect() {
        return correct;
    }

    public void setCorrect(Integer correct) {
        this.correct = correct;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public String getQuestiontype() {
        return questiontype;
    }

    public void setQuestiontype(String questiontype) {
        this.questiontype = questiontype;
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

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    @Override
    public String toString() {
        return "Question{" +
                "qid=" + qid +
                ", questiontype='" + questiontype + '\'' +
                ", title='" + title + '\'' +
                ", optiona='" + optiona + '\'' +
                ", optionb='" + optionb + '\'' +
                ", optionc='" + optionc + '\'' +
                ", optiond='" + optiond + '\'' +
                ", answer='" + answer + '\'' +
                ", correct=" + correct +
                ", createtime=" + createtime +
                ", power='" + power + '\'' +
                '}';
    }
}
