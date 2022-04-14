package com.tfswufe.service.impl;

import com.tfswufe.dao.StudentDao;
import com.tfswufe.domain.Student;
import com.tfswufe.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2021/10/31 14:20
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentDao studentDao;
    @Override
    public int addStudent(Student student) {
        int nums = studentDao.insertStudent(student);
        return nums;
    }

    @Override
    public List<Student> findStudents() {

        return studentDao.selectStudents();
    }
}
