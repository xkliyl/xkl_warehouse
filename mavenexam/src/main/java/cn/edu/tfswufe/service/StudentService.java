package cn.edu.tfswufe.service;


import cn.edu.tfswufe.model.*;

import java.util.List;

/**
 * @author 阿秋
 * @date 2022/3/11 14:02
 */
public interface StudentService {
    //查看公告
    public List<Notice> findALlNoticeByPower(String power);

    //查看管理员发的公告
    public List<Notice> findAdminNotice();

    //公告模糊查询
    public List<Notice> findAllNoticeLike(Notice notice);

    //公告模糊查询管理员的公告
    public List<Notice> findAdminNoticeLike(String ntitle);

    //查看所有试卷
    public List<TestToStudent> studentFindAllTest(TestToStudent testToStudent);

    //答题(查看试卷的内容)
    public List<TeacherTestPaper> answerTest(String testid);

    //答题（写答案）
    public void writeAnswer(StudentAnswer answer);

    //答题（改答案）
    public void changeAnswer(StudentAnswer answer);

    //查看成绩
    public List<TestPaper> findAllGrade(String sno);

    //查看所学课程
    public List<Course> studentFindAllCourse(String cid);

    //查看班级的授课老师
    public List<Lecture> findLecture(String cid);

    //查看个人信息
    public Student myself(String sno);

    //修改个人信息
    public void updatePassword(Status status);
    public List<TestPaper> findNoDoTestPaper(TestPaper testPaper);
    public List<Examination> findAllExamination(Examination examination);
    public List<TeacherTestPaper> findTeacherTestPaper(TeacherTestPaper teacherTestPaper);
    public void writeTestPaper(TestPaper testPaper);
}
