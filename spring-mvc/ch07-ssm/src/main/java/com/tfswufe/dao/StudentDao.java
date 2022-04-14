package com.tfswufe.dao;

import com.tfswufe.domain.Student;

import java.util.List;

/**
 * @author 阿秋
 * @date 2021/10/31 14:14
 */
public interface StudentDao {
    int insertStudent(Student student);
    List<Student> selectStudents();
}
