package cn.edu.tfswufe.service.impl;

import cn.edu.tfswufe.dao.*;
import cn.edu.tfswufe.model.Classes;
import cn.edu.tfswufe.model.*;
import cn.edu.tfswufe.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2022/3/4 17:51
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdministratorsDao administratorsDao;
    @Resource
    private StatusDao statusDao;
    @Resource
    private ClassDao classDao;
    @Resource
    private MajorDao majorDao;
    @Resource
    private FacultyDao facultyDao;

    @Override
    public List<Teacher> queryAllTeacher() {
        return administratorsDao.findAllTeacher();
    }

    @Override
    public Teacher findOneTeacher(String tid) {
        return administratorsDao.findOneTeacher(tid);
    }

    @Override
    public void insertTeacher(Teacher teacher) {
        administratorsDao.addTeacher(teacher);
    }


    @Override
    public void updateInitialPwd(Status status) {
        administratorsDao.recoveryPassword(status);
    }

    @Override
    public Status queryOneStatus(String uid) {
        return administratorsDao.queryOneStatus(uid);
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        administratorsDao.updateTeacher(teacher);
    }

    @Override
    public void deleteTeacher(String tid) {
        administratorsDao.deleteTeacher(tid);
        administratorsDao.deleteStatus(tid);
    }

    @Override
    public List<Student> queryAllStudent() {
        return administratorsDao.findAllStudent();
    }

    @Override
    public void addStudent(Student student) {
        administratorsDao.addStudent(student);
    }

    @Override
    public void updateStudent(Student student) {
        administratorsDao.updateStudent(student);
    }

    @Override
    public void deleteStudent(String sno) {
        administratorsDao.deleteStatus(sno);
        administratorsDao.deleteStudent(sno);
    }

    @Override
    public Classes queryClassForStu(String cid) {
        return classDao.findClassByCidForStu(cid);
    }

    @Override
    public List<Course> queryAllCourse() {
        return administratorsDao.findAllCourse();
    }

    @Override
    public Course findOneCourse(String crid) {
        return administratorsDao.findOneCourse(crid);
    }

    @Override
    public void addCourse(Course course) {
        administratorsDao.addCourse(course);
    }

    @Override
    public void updateCourse(Course course) {
        administratorsDao.updateCourse(course);
    }

    @Override
    public void deleteCourse(String crid) {
        administratorsDao.deleteCourse(crid);
    }

    @Override
    public List<Classes> queryAllClass() {
        return administratorsDao.findAllClass();
    }

    @Override
    public Classes queryOneClass(String cid) {
        return administratorsDao.findOneClass(cid);
    }

    @Override
    public void addClass(Classes cls) {
        administratorsDao.addClass(cls);
    }

    @Override
    public void updateClass(Classes cls) {
        administratorsDao.updateClass(cls);
    }

    @Override
    public void deleteClass(String cid) {
        administratorsDao.deleteClass(cid);
    }

    @Override
    public List<Major> queryAllMajor() {
        return administratorsDao.findAllMajor();
    }

    @Override
    public void addMajor(Major major) {
        administratorsDao.addMajor(major);
    }

    @Override
    public void updateMajor(Major major) {
        administratorsDao.updateMajor(major);
    }

    @Override
    public void deleteMajor(String mid) {
        administratorsDao.deleteMajor(mid);
    }

    @Override
    public List<Notice> queryAllNotice() {
        return administratorsDao.findAllNotice();
    }

    @Override
    public List<Notice> queryNoticeLike(String title) {
        return administratorsDao.findNoticeLike(title);
    }

    @Override
    public Notice findOneNotice(Integer noticeid) {
        return administratorsDao.findOneNotice(noticeid);
    }

    @Override
    public void addNotice(Notice notice) {
        administratorsDao.addNotice(notice);
    }

    @Override
    public void updateNotice(Notice notice) {
        administratorsDao.updateNotice(notice);
    }

    @Override
    public void deleteNotice(Integer nticeid) {
        administratorsDao.deleteNotice(nticeid);
    }

    @Override
    public Major queryMajor(String mid) {
        return majorDao.findMajor(mid);
    }

    @Override
    public Faculty queryFaculty(String fid) {
        return facultyDao.findFaculty(fid);
    }

    @Override
    public List<Lecture> findAllLectureByTeacher() {
        return administratorsDao.findAllLectureByTeacher();
    }

    @Override
    public List<Lecture> findAllLectureByTeacherId(String tid) {
        return administratorsDao.findAllLectureByTeacherId(tid);
    }

    @Override
    public Lecture findOneLecture(Lecture lecture) {
        return administratorsDao.findOneLecture(lecture);
    }

    @Override
    public List<Lecture> findLectureByTidAndCrid(Lecture lecture) {
        return administratorsDao.findLectureByTidAndCrid(lecture);
    }

    @Override
    public ClassAndCourse findOneClassAndCourse(ClassAndCourse course) {
        return administratorsDao.findOneClassAndCourse(course);
    }

    @Override
    public void addLectureForTeacher(Lecture lecture) {
        administratorsDao.addLectureForTeacher(lecture);
    }

    @Override
    public void addClassAndCourse(ClassAndCourse course) {
        administratorsDao.addClassAndCourse(course);
    }

    @Override
    public void deleteLecture(Lecture lecture) {
        administratorsDao.deleteLecture(lecture);
    }

    @Override
    public void deleteClassAndCourse(ClassAndCourse course) {
        administratorsDao.deleteClassAndCourse(course);
    }

    @Override
    public void deleteAllLectureByTid(String tid) {
        administratorsDao.deleteAllLectureByTid(tid);
    }

    @Override
    public void updateAdmin(Status admin) {
        administratorsDao.updateAdmin(admin);
    }

    @Override
    public void updateStatus(Status status) {
        administratorsDao.updateStatus(status);
    }

}
