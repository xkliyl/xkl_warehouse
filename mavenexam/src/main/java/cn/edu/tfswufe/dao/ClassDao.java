package cn.edu.tfswufe.dao;

import cn.edu.tfswufe.model.Classes;
import cn.edu.tfswufe.model.Major;

import java.util.List;

/**
 * @author 阿秋
 * @date 2022/4/3 9:28
 */
public interface ClassDao {
    //查询所有班级
    public List<Classes> queryAllClass();

    //查询老师自己所交的班级
    public List<Classes> queryClassByTeacherId(String tid);

    //查询班级所属专业
    public Major findClassMajorByMid(String mid);

    //查询学生对应的班级
    public Classes findClassByCidForStu(String cid);
}
