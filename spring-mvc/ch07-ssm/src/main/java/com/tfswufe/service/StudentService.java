package com.tfswufe.service;

import com.tfswufe.domain.Student;

import java.util.List;

/**
 * @author 阿秋
 * @date 2021/10/31 14:19
 */
public interface StudentService {
    int addStudent(Student student);
    List<Student> findStudents();
}
