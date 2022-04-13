package cn.edu.tfswufe.service.impl;

import cn.edu.tfswufe.dao.StudentDao;
import cn.edu.tfswufe.model.*;
import cn.edu.tfswufe.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2022/3/11 14:05
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentDao studentDao;

    @Override
    public List<Notice> findALlNoticeByPower(String power) {
        return studentDao.findALlNoticeByPower(power);
    }

    @Override
    public List<Notice> findAdminNotice() {
        return studentDao.findAdminNotice();
    }

    @Override
    public List<Notice> findAllNoticeLike(Notice notice) {
        return studentDao.findAllNoticeLike(notice);
    }

    @Override
    public List<Notice> findAdminNoticeLike(String ntitle) {
        return studentDao.findAdminNoticeLike(ntitle);
    }

    @Override
    public List<TestToStudent> studentFindAllTest(TestToStudent testToStudent) {
        return studentDao.studentFindAllTest(testToStudent);
    }

    @Override
    public List<TeacherTestPaper> answerTest(String testid) {
        return studentDao.answerTest(testid);
    }

    @Override
    public void writeAnswer(StudentAnswer answer) {
        studentDao.writeAnswer(answer);
    }

    @Override
    public void changeAnswer(StudentAnswer answer) {
        studentDao.changeAnswer(answer);
    }

    @Override
    public List<TestPaper> findAllGrade(String sno) {
        return studentDao.findAllGrade(sno);
    }

    @Override
    public List<Course> studentFindAllCourse(String cid) {
        return studentDao.studentFindAllCourse(cid);
    }

    @Override
    public List<Lecture> findLecture(String cid) {
        return studentDao.findLecture(cid);
    }

    @Override
    public Student myself(String sno) {
        return studentDao.myself(sno);
    }

    @Override
    public void updatePassword(Status status) {
        studentDao.updatePassword(status);
    }

    @Override
    public List<TestPaper> findNoDoTestPaper(TestPaper testPaper) {
        return studentDao.findNoDoTestPaper(testPaper);
    }


    @Override
    public List<Examination> findAllExamination(Examination examination) {
        return studentDao.findAllExamination(examination);
    }

    @Override
    public List<TeacherTestPaper> findTeacherTestPaper(TeacherTestPaper teacherTestPaper) {
        return studentDao.findTeacherTestPaper(teacherTestPaper);
    }

    @Override
    public void writeTestPaper(TestPaper testPaper) {
        studentDao.writeTestPaper(testPaper);
    }
}
