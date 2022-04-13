package cn.edu.tfswufe.service.impl;

import cn.edu.tfswufe.dao.AdministratorsDao;
import cn.edu.tfswufe.dao.TeacherDao;
import cn.edu.tfswufe.model.*;
import cn.edu.tfswufe.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2022/3/2 16:32
 */
@Service
public class TeacherServiceImpl implements TeacherService {
    @Resource
    private AdministratorsDao administratorsDao;
    @Resource
    private TeacherDao teacherDao;


    @Override
    public List<Student> findAllStudentByClass(String cid) {
        return teacherDao.findAllStudentByClass(cid);
    }

    @Override
    public Student findOneStudent(Student student) {
        return teacherDao.findOneStudent(student);
    }

    @Override
    public void recoveryPassword(Status status) {
        teacherDao.recoveryPassword(status);
    }

    @Override
    public List<Notice> queryAllNotice(String power) {
        return teacherDao.findAllNotice(power);
    }

    @Override
    public List<Notice> findNoticeLike(Notice notice) {
        return teacherDao.findNoticeLike(notice);
    }

    @Override
    public void addNotice(Notice notice) {
        teacherDao.addNotice(notice);
    }

    @Override
    public void updateNotice(Notice notice) {
        teacherDao.updateNotice(notice);
    }

    @Override
    public void deleteNotice(Notice notice) {
        teacherDao.deleteNotice(notice);
    }

    @Override
    public List<Question> findAllQuestion(String power) {
        return teacherDao.findAllQuestion(power);
    }

    @Override
    public Question findOneQuestion(Question question) {
        return teacherDao.findOneQuestion(question);
    }

    @Override
    public void addQuestion(Question question) {
        teacherDao.addQuestion(question);
    }

    @Override
    public void updateQuestion(Question question) {
        teacherDao.updateQuestion(question);
    }

    @Override
    public void deleteQuestion(Integer qid) {
        teacherDao.deleteQuestion(qid);
    }

    @Override
    public List<Examination> findAllExamination(String power) {
        return teacherDao.findAllExamination(power);
    }

    @Override
    public Examination findOneExamination(String testid) {
        return teacherDao.findOneExamination(testid);
    }

    @Override
    public List<TeacherTestPaper> findTeacherTestPaperContent(String testid) {
        return teacherDao.findTeacherTestPaperContent(testid);
    }

    @Override
    public TeacherTestPaper findOneTeacherTestPaperContent(TeacherTestPaper teacherTestPaper) {
        return teacherDao.findOneTeacherTestPaperContent(teacherTestPaper);
    }

    @Override
    public void addExamination(Examination examination) {
        teacherDao.addExamination(examination);
    }

    @Override
    public void addQuestionToExamination(TeacherTestPaper teacherTestPaper) {
        teacherDao.addQuestionToExamination(teacherTestPaper);
    }

    @Override
    public void deleteQuestionToExamination(TeacherTestPaper teacherTestPaper) {
        teacherDao.deleteQuestionToExamination(teacherTestPaper);
    }

    @Override
    public void deleteExamination(String testid) {
        teacherDao.deleteTeacherTestPaperContent(testid);
        teacherDao.deleteExamination(testid);
    }

    @Override
    public List<TestToStudent> findALLTestToStudent(String power) {
        return teacherDao.findALLTestToStudent(power);
    }

    @Override
    public TestToStudent findTestPower(TestToStudent toStudent) {
        return teacherDao.findTestPower(toStudent);
    }

    @Override
    public void testToStudent(TestToStudent testToStudent) {
        teacherDao.testToStudent(testToStudent);
    }

    @Override
    public List<TestToStudent> findTestByCidAndTid(TestToStudent testToStudent) {
        return null;
    }

    @Override
    public List<TestPaper> findTestByTestId(String testid) {
        return null;
    }


    @Override
    public void updateTestToStudent(TestToStudent testToStudent) {
        teacherDao.updateTestToStudent(testToStudent);
    }

    @Override
    public void deleteTestToStudent(String testid) {
        teacherDao.deleteTestToStudent(testid);
    }

    @Override
    public List<StudentAnswer> findStudentAnswer(StudentAnswer answer) {
        return teacherDao.findStudentAnswer(answer);
    }

    @Override
    public StudentAnswer findStudentTestOneAnswer(StudentAnswer answer) {
        return teacherDao.findStudentTestOneAnswer(answer);
    }

    @Override
    public void reviewStudentTest(StudentAnswer answer) {
        teacherDao.reviewStudentTest(answer);
    }

    @Override
    public void score(TestPaper testPaper) {
        teacherDao.score(testPaper);
    }


    @Override
    public void updateTeacher(Status teacher) {
        teacherDao.updateTeacher(teacher);
    }

    @Override
    public List<Lecture> findLectureByTidNoRepeat(String tid) {
        return teacherDao.findLectureByTidNoRepeat(tid);
    }

    @Override
    public TeacherTestPaper findOneTeacherTestPaper(TeacherTestPaper testPaper) {
        return teacherDao.findOneTeacherTestPaper(testPaper);
    }

    @Override
    public void deleteTestPaper(String testid) {
        teacherDao.deleteTestPaper(testid);
    }

    @Override
    public void deleteStudentAnswer(String testid) {
        teacherDao.deleteStudentAnswer(testid);
    }

    @Override
    public List<Lecture> findAllMyTeachingClass(String tid) {
        return teacherDao.findAllMyTeachingClass(tid);
    }

    @Override
    public List<TestToStudent> findTestByCridAndCid(String tid) {
        return teacherDao.findTestByCridAndCid(tid);
    }

    @Override
    public List<TestPaper> findAllTestToClass(TestToStudent testToStudent) {
        return teacherDao.findAllTestToClass(testToStudent);
    }

    @Override
    public List<TeacherTestPaper> findTeacherTestPaper(StudentAnswer answer) {
        return teacherDao.findTeacherTestPaper(answer);
    }
}
