package com.tfsuefe.vo;

/**
 * @author 阿秋
 * @date 2021/10/27 17:46
 */
//保存请求参数值的普通类
public class Student {
    //属性名和请求参数名一样
    private String name;
    private Integer age;

    public Student() {
        System.out.println("===Student的无参构造方法====");
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
