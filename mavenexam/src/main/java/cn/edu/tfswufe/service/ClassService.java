package cn.edu.tfswufe.service;

import cn.edu.tfswufe.model.Classes;

import java.util.List;

/**
 * @author 阿秋
 * @date 2021/11/28 17:33
 */
public interface ClassService {

    //查询老师自己所交的班级
    public List<Classes> findClassByTeacherId(String tid);
}
