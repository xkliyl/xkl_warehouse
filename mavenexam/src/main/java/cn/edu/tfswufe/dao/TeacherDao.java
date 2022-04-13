package cn.edu.tfswufe.dao;

import cn.edu.tfswufe.model.*;

import java.util.List;

/**
 * @author 阿秋
 * @date 2022/4/3 9:33
 */
public interface TeacherDao {
    //查询一个班级的所有学生
    public List<Student> findAllStudentByClass(String cid);

    //查询该班级的某一个学生
    public Student findOneStudent(Student student);

    //恢复学生初始密码
    public void recoveryPassword(Status status);

    //修改学生信息
    //public void updateStudent(Status status);


    //查询所有公告
    public List<Notice> findAllNotice(String power);

    //公告模糊查询
    public List<Notice> findNoticeLike(Notice notice);

    //新增公告
    public void addNotice(Notice notice);

    //修改教师公告
    public void updateNotice(Notice notice);

    //删除公告
    public void deleteNotice(Notice notice);

    //查询所有题目
    public List<Question> findAllQuestion(String power);
    public Question findOneQuestion(Question question);
    public TeacherTestPaper findOneTeacherTestPaper(TeacherTestPaper testPaper);
    //新增题目
    public void addQuestion(Question question);

    //修改题目
    public void updateQuestion(Question question);

    //删除题目
    public void deleteQuestion(Integer qid);

    //查询所有试卷
    public List<Examination> findAllExamination(String power);
    public Examination findOneExamination(String testid);
    //查询试卷内容
    public List<TeacherTestPaper> findTeacherTestPaperContent(String testid);
    public TeacherTestPaper findOneTeacherTestPaperContent(TeacherTestPaper teacherTestPaper);
    //新增试卷
    public void addExamination(Examination examination);

    //试卷添加题目
    public void addQuestionToExamination(TeacherTestPaper teacherTestPaper);

    //试卷删除题目
    public void deleteQuestionToExamination(TeacherTestPaper teacherTestPaper);

    //删除试卷
    public void deleteExamination(String testid);

    //删除试卷内容
    public void deleteTeacherTestPaperContent(String testid);
    public void deleteTestPaper(String testid);
    public void deleteStudentAnswer(String testid);
    //查询已发布试卷
    public List<TestToStudent> findALLTestToStudent(String power);
    public TestToStudent findTestPower(TestToStudent toStudent);
    //发布试卷
    public void testToStudent(TestToStudent testToStudent);
    
    //修改试卷权限
    public void updateTestToStudent(TestToStudent testToStudent);

    //删除已发布的试卷
    public void deleteTestToStudent(String testid);
    //查看学生试卷的答案
    public List<StudentAnswer> findStudentAnswer(StudentAnswer answer);
    public StudentAnswer findStudentTestOneAnswer(StudentAnswer answer);

    public List<TeacherTestPaper> findTeacherTestPaper(StudentAnswer answer);
    //评阅试卷
    public void reviewStudentTest(StudentAnswer answer);
    //计算总分
    public void score(TestPaper testPaper);
    //修改个人密码
    public void updateTeacher(Status teacher);

    public List<Lecture> findLectureByTidNoRepeat(String tid);
    public List<Lecture> findAllMyTeachingClass(String tid);
    public List<TestToStudent> findTestByCridAndCid(String tid);
    public List<TestPaper> findAllTestToClass(TestToStudent testToStudent);
}
