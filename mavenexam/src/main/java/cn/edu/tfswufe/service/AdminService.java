package cn.edu.tfswufe.service;


import cn.edu.tfswufe.model.*;
import cn.edu.tfswufe.model.Classes;

import java.util.List;

/**
 * @author 阿秋
 * @date 2022/3/4 17:47
 */
public interface AdminService {
    //修改权限表相应用户的信息
    public void updateStatus(Status status);

    //恢复初始密码
    public void updateInitialPwd(Status status);

    //查询某一个用户
    public Status queryOneStatus(String uid);

    //查询所有教师
    public List<Teacher> queryAllTeacher();
    public Teacher findOneTeacher(String tid);
    //新增教师
    public void insertTeacher(Teacher teacher);

    //修改个人教师信息
    public void updateTeacher(Teacher teacher);

    //删除教师
    public void deleteTeacher(String tid);

    //查询所有学生
    public List<Student> queryAllStudent();

    //新增学生
    public void addStudent(Student student);

    //更新学生的信息
    public void updateStudent(Student student);

    //删除学生
    public void deleteStudent(String sno);

    //查询学生对应的班级
    public Classes queryClassForStu(String cid);

    //查询所有课程
    public List<Course> queryAllCourse();
    public Course findOneCourse(String crid);
    //新增课程
    public void addCourse(Course course);

    //修改课程信息
    public void updateCourse(Course course);

    //删除课程
    public void deleteCourse(String crid);

    //查询班级
    public List<Classes> queryAllClass();
    public Classes queryOneClass(String cid);
    //新增班级
    public void addClass(Classes cls);

    //更新班级信息
    public void updateClass(Classes cls);

    //删除班级
    public void deleteClass(String cid);

    //查询所有专业
    public List<Major> queryAllMajor();

    //新增专业
    public void addMajor(Major major);

    //更新专业信息
    public void updateMajor(Major major);

    //删除专业
    public void deleteMajor(String mid);

    //查询所有公告
    public List<Notice> queryAllNotice();
    //公告的模糊查询
    public List<Notice> queryNoticeLike(String title);
    public Notice findOneNotice(Integer noticeid);
    //新增公告
    public void addNotice(Notice notice);
    //更新公告
    public void updateNotice(Notice notice);
    //删除公告
    public void deleteNotice(Integer nticeid);
    //根据专业ID查询专业
    public Major queryMajor(String mid);

    //查询学院
    public Faculty queryFaculty(String fid);
    //查询所有老师上的所有课程
    public List<Lecture> findAllLectureByTeacher();
    //通过老师ID查询老师上的所有课程
    public List<Lecture> findAllLectureByTeacherId(String tid);
    public Lecture findOneLecture(Lecture lecture);
    public List<Lecture> findLectureByTidAndCrid(Lecture lecture);
    public ClassAndCourse findOneClassAndCourse(ClassAndCourse course);
    //分配课程给老师
    public void addLectureForTeacher(Lecture lecture);
    public void addClassAndCourse(ClassAndCourse course);
    //取消老师上某一门学科
    public void deleteLecture(Lecture lecture);
    public void deleteClassAndCourse(ClassAndCourse course);
    //取消老师所教的所有课程（离职）
    public void deleteAllLectureByTid(String tid);
    //修改管理员自己的信息
    public void updateAdmin(Status admin);
}
