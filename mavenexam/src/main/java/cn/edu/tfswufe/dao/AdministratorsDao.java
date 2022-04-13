package cn.edu.tfswufe.dao;

import cn.edu.tfswufe.model.*;

import java.util.List;

/**
 * @author 阿秋
 * @date 2022/4/3 9:26
 */
public interface AdministratorsDao {
    //恢复初始密码
    public void recoveryPassword(Status status);

    //查询某一个用户
    public Status queryOneStatus(String uid);

    //修改用户信息
    public void updateStatus(Status status);

    //删除用户
    public void deleteStatus(String uid);

    //查询所有教师
    public List<Teacher> findAllTeacher();
    public Teacher findOneTeacher(String tid);

    //新增教师
    public void addTeacher(Teacher teacher);

    //修改教师信息
    public void updateTeacher(Teacher teacher);

    //删除教师
    public void deleteTeacher(String tid);

    //查询所有课程
    public List<Course> findAllCourse();
    public Course findOneCourse(String crid);

    //新增课程
    public void addCourse(Course course);

    //修改课程信息
    public void updateCourse(Course course);

    //删除课程
    public void deleteCourse(String crid);

    //查询所有班级
    public List<Classes> findAllClass();
    public Classes findOneClass(String cid);
    //新增班级
    public void addClass(Classes cls);

    //修改班级信息
    public void updateClass(Classes cls);

    //删除班级
    public void deleteClass(String cid);

    //查询所有学生
    public List<Student> findAllStudent();

    //新增学生
    public void addStudent(Student student);

    //修改学生信息
    public void updateStudent(Student student);

    //删除学生
    public void deleteStudent(String sno);

    //查询所有公告
    public List<Notice> findAllNotice();

    //公告模糊查询
    public List<Notice> findNoticeLike(String ntitle);
    public Notice findOneNotice(Integer noticeid);

    //新增公告
    public void addNotice(Notice notice);

    //修改公告
    public void updateNotice(Notice notice);

    //删除公告
    public void deleteNotice(Integer nid);

    //查询所有专业
    public List<Major> findAllMajor();

    //新增专业
    public void addMajor(Major major);

    //修改专业信息
    public void updateMajor(Major major);

    //删除专业
    public void deleteMajor(String mid);

    //查询所有老师上的所有授课班级
    public List<Lecture> findAllLectureByTeacher();

    //通过老师ID查询老师上的所有授课班级
    public List<Lecture> findAllLectureByTeacherId(String tid);
    public List<Lecture> findLectureByTidAndCrid(Lecture lecture);
    public Lecture findOneLecture(Lecture lecture);
    public ClassAndCourse findOneClassAndCourse(ClassAndCourse course);
    //分配班级给老师
    public void addLectureForTeacher(Lecture lecture);
    public void addClassAndCourse(ClassAndCourse course);
    //取消某老师给某班级授课
    public void deleteLecture(Lecture lecture);
    public void deleteClassAndCourse(ClassAndCourse course);
    //取消老师所教的所有课程（离职）
    public void deleteAllLectureByTid(String tid);

    //修改个人信息
    public void updateAdmin(Status admin);
}
