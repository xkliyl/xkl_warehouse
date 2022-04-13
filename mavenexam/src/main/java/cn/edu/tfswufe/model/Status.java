package cn.edu.tfswufe.model;

/**
 * @author 阿秋
 * @date 2021/11/27 21:18
 */
public class Status {
    private String uid;
    private String username;
    private String password;
    private Integer power;


    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    @Override
    public String toString() {
        return "Status{" +
                "uid='" + uid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", power=" + power +
                '}';
    }
}
