package cn.edu.tfswufe.controller;

import cn.edu.tfswufe.model.Classes;
import cn.edu.tfswufe.model.*;
import cn.edu.tfswufe.service.AdminService;
import cn.edu.tfswufe.service.StatusService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author 阿秋
 * @date 2022/3/2 16:28
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;
    @Resource
    private StatusService statusService;

    //查询所有教师
    @RequestMapping("/allTeacher")
    @ResponseBody
    public PageInfo<Teacher> allTeacher(Integer page) {
        int power = 1;
        PageHelper.startPage(page, 10);
        List<Status> statusList = statusService.findByPower(power);
        List<Teacher> teachers = adminService.queryAllTeacher();
        for (Teacher tr : teachers) {
            for (Status st : statusList) {
                if (tr.getTid().equals(st.getUid())) {
                    tr.setPassword(st.getPassword());
                }
            }
        }
        PageInfo<Teacher> teacherPageInfo = new PageInfo<>(teachers);
        System.out.println(teachers);
        return teacherPageInfo;
    }

    //添加教师
    @RequestMapping("/insertTeacher")
    @ResponseBody
    public int insertTeacher(String uid, String tname, String date, String tsex) throws ParseException {
        Status s = adminService.queryOneStatus(uid);
        Status status = new Status();
        Teacher teacher = new Teacher();
        if (s == null) {
            status.setUid(uid);
            status.setUsername(tname);
            status.setPassword("1234");
            status.setPower(1);
            statusService.insertUser(status);
            teacher.setTid(uid);
            teacher.setTname(tname);
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = ft.parse(date);
            teacher.setTbirthday(date1);
            teacher.setTsex(tsex);
            adminService.insertTeacher(teacher);
            return 1;
        } else {
            System.out.println("该用户已存在");
            return 2;
        }
    }

    //恢复初始密码
    @RequestMapping("/updateInitialPwd")
    @ResponseBody
    public int updateInitialPwd(String uid) {
        Status s = adminService.queryOneStatus(uid);
        if (s != null) {
            Status status = adminService.queryOneStatus(uid);
            adminService.updateInitialPwd(status);
            return 1;
        } else {
            return 0;
        }
    }

    //修改教师信息
    @RequestMapping("/updateTeacher")
    @ResponseBody
    public int updateTeacher(String tid, String tname) {
        Status s = adminService.queryOneStatus(tid);
        if (s != null) {
            Status status = new Status();
            status.setUid(tid);
            status.setUsername(tname);
            adminService.updateStatus(status);
            Teacher t = new Teacher();
            t.setTid(tid);
            t.setTname(tname);
            adminService.updateTeacher(t);
            return 1;
        } else {
            System.out.println("error");
            return 0;
        }
    }

    //删除教师
    @RequestMapping("/deleteTeacher")
    @ResponseBody
    public int deleteTeacher(String tid) {
        Status s = adminService.queryOneStatus(tid);
        if (s != null) {
            adminService.deleteTeacher(tid);
            adminService.deleteAllLectureByTid(tid);
            return 1;
        } else {
            return 0;
        }
    }

    //查询所有学生
    @RequestMapping("/findAllStudent")
    @ResponseBody
    public List<Student> findAllStudent(Integer power) {
        List<Student> studentList = adminService.queryAllStudent();
        List<Status> statusList = statusService.findByPower(power);
        for (Student student : studentList) {
            Classes cls = adminService.queryClassForStu(student.getCid());
            Major major = adminService.queryMajor(cls.getMid());
            Faculty faculty = adminService.queryFaculty(major.getFid());
            student.setCname(cls.getClassname());
            student.setFname(faculty.getFacultyname());
            for (Status status : statusList) {
                if (student.getSno().equals(status.getUid())) {
                    student.setPassword(status.getPassword());
                }
            }
        }
        return studentList;
    }

    //添加学生
    @RequestMapping("/insertStudent")
    public void insertStudent(String sno, String sname, Date birthday, String ssex, String cid) {
        Status status = new Status();
        status.setUid(sno);
        status.setUsername(sname);
        status.setPassword("123");
        status.setPower(2);
        statusService.insertUser(status);
        Student student = new Student();
        student.setSno(sno);
        student.setSname(sname);
        student.setSbirthday(birthday);
        student.setSsex(ssex);
        student.setCid(cid);
        adminService.addStudent(student);
    }

    //修改学生信息
    @RequestMapping("/updateStudent")
    public void updateStudent(String sno, String sname, Date birthday, String ssex, String cid) {

        Status status = new Status();
        status.setUid(sno);
        status.setUsername(sname);
        adminService.updateStatus(status);
        Student student = new Student();
        student.setSno(sno);
        student.setSname(sname);
        student.setSbirthday(birthday);
        student.setSsex(ssex);
        student.setCid(cid);
        adminService.updateStudent(student);
    }

    //删除学生
    @RequestMapping("/deleteStudent")
    public void deleteStudent(String sno) {
        adminService.deleteStudent(sno);
    }

    //查询所有课程
    @RequestMapping("/findAllCourse")
    @ResponseBody
    public List<Course> findAllCourse() {
        return adminService.queryAllCourse();
    }

    //新增课程
    @RequestMapping("/insertCourse")
    @ResponseBody
    public int insertCourse(String crid, String crname, String mid) {
        Course c = adminService.findOneCourse(crid);
        if (c == null) {
            Course course = new Course();
            course.setCrid(crid);
            course.setCrname(crname);
            course.setMid(mid);
            adminService.addCourse(course);
            return 1;
        } else {
            return 0;
        }

    }

    //更新课程信息
    @RequestMapping("/updateCourse")
    public void updateCourse(String crid, String crname) {

        Course course = new Course();
        course.setCrid(crid);
        course.setCrname(crname);
        adminService.updateCourse(course);
    }

    //删除课程
    @RequestMapping("/deleteCourse")
    public void deleteCourse(String crid) {

        adminService.deleteCourse(crid);
    }

    //查询所有班级
    @RequestMapping("/findAllClass")
    @ResponseBody
    public List<Classes> findAllClass() {
        return adminService.queryAllClass();
    }

    //新增班级
    @RequestMapping("/insertClass")
    @ResponseBody
    public int insertClass(String cid, String classname, String mid) {
        if (mid != "") {
            Classes c = adminService.queryOneClass(cid);
            if (c == null) {
                Classes cls = new Classes();
                cls.setCid(cid);
                cls.setClassname(classname);
                cls.setMid(mid);
                adminService.addClass(cls);
                return 1;
            } else {
                return 0;
            }
        } else {
            return 2;
        }

    }

    //更新班级信息
    @RequestMapping("/updateClass")
    @ResponseBody
    public int updateClass(String cid, String classname) {
        Classes c = adminService.queryOneClass(cid);
        if (c != null) {
            Classes cls = new Classes();
            cls.setCid(cid);
            cls.setClassname(classname);
            adminService.updateClass(cls);
            return 1;
        } else {
            return 0;
        }

    }

    //删除班级
    @RequestMapping("/deleteClass")
    @ResponseBody
    public int deleteClass(String cid) {
        Classes c = adminService.queryOneClass(cid);
        if (c != null) {
            adminService.deleteClass(cid);
            return 1;
        } else {
            return 0;
        }

    }

    //查询所有专业
    @RequestMapping("/findAllMajor")
    @ResponseBody
    public List<Major> findAllMajor() {
        return adminService.queryAllMajor();
    }

    //新增专业
    @RequestMapping("/insertMajor")
    public void insertMajor(String mid, String majorname, String fid) {
        Major major = new Major();
        major.setMid(mid);
        major.setMajorname(majorname);
        major.setFid(fid);
        adminService.addMajor(major);
    }

    //更新专业
    @RequestMapping("/updateMajor")
    public void updateMajor(String mid, String majorname, String fid) {
        Major major = new Major();
        major.setMid(mid);
        major.setMajorname(majorname);
        major.setFid(fid);
        adminService.updateMajor(major);
    }

    //删除专业
    @RequestMapping("/deleteMajor")
    public void deleteMajor(String mid) {

        adminService.deleteMajor(mid);
    }

    //查询所有公告
    @RequestMapping("/findAllNotice")
    @ResponseBody
    public List<Notice> findAllNotice() {
        return adminService.queryAllNotice();
    }

    @RequestMapping("/noticeInfo")
    public ModelAndView noticeInfo(Integer noticeid) {
        Notice notice = adminService.findOneNotice(noticeid);
        ModelAndView mv = new ModelAndView();
        mv.addObject("oneNotice", notice);
        mv.setViewName("notice");
        return mv;
    }

    //公告的模糊查询
    @RequestMapping("/findNoticeLike")
    @ResponseBody
    public List<Notice> findNoticeLike(String ntitle) {
        return adminService.queryNoticeLike(ntitle);
    }

    //新增公告
    @RequestMapping("/insertNotice")
    @ResponseBody
    public void insertNotice(String ntitle, String ncontent, String power) {
        if (power != "") {
            Notice notice = new Notice();
            notice.setNtitle(ntitle);
            notice.setNcontent(ncontent);
            notice.setNtime(new Date());
            notice.setPower(power);
            adminService.addNotice(notice);
        }
    }

    //更新公告
    @RequestMapping("/updateNotice")
    @ResponseBody
    public int updateNotice(Integer noticeid, String ntitle, String ncontent) {
        Notice n = adminService.findOneNotice(noticeid);
        if (n != null) {
            Notice notice = new Notice();
            notice.setNoticeid(noticeid);
            notice.setNtitle(ntitle);
            notice.setNcontent(ncontent);
            notice.setNtime(new Date());
            adminService.updateNotice(notice);
            return 1;
        } else {
            return 0;
        }
    }

    //删除公告
    @RequestMapping("/deleteNotice")
    public void deleteNotice(Integer noticeid) {
        adminService.deleteNotice(noticeid);
    }

    //查询所有老师上的所有课程
    @RequestMapping("/findAllLecture")
    @ResponseBody
    public List<Lecture> findAllLecture() {
        System.out.println(adminService.findAllLectureByTeacher());
        return adminService.findAllLectureByTeacher();
    }

    //通过老师ID查询老师上的所有课程
    @RequestMapping("/findAllLectureByTid")
    @ResponseBody
    public List<Lecture> findAllLectureByTid(String tid) {
        List<Lecture> lectureList = adminService.findAllLectureByTeacherId(tid);
        if (lectureList != null) {
            return lectureList;
        } else {
            return null;
        }
    }

    @RequestMapping("findLectureByTidAndCrid")
    @ResponseBody
    public List<Lecture> findLectureByTidAndCrid(String tid, String crid) {
        Lecture l = new Lecture();
        l.setTid(tid);
        l.setCrid(crid);
        List<Lecture> lectureList = adminService.findLectureByTidAndCrid(l);
        return lectureList;
    }

    //分配课程给老师
    @RequestMapping("/insertLecture")
    @ResponseBody
    public int insertLecture(String tid, String cid, String crid) {
        Teacher teacher = adminService.findOneTeacher(tid);
        Course course = adminService.findOneCourse(crid);
        Classes classes = adminService.queryOneClass(cid);
        Lecture lecture = new Lecture();
        lecture.setTid(tid);
        lecture.setCid(cid);
        lecture.setCrid(crid);
        ClassAndCourse classAndCourse = new ClassAndCourse();
        classAndCourse.setCid(cid);
        classAndCourse.setCrid(crid);
        Lecture lectureTest = adminService.findOneLecture(lecture);
        ClassAndCourse classAndCourseTest = adminService.findOneClassAndCourse(classAndCourse);
        if (teacher == null) {
            return 2;
        } else if (course == null) {
            return 3;
        } else if (classes == null) {
            return 4;
        } else if (lectureTest == null && classAndCourseTest == null) {
            adminService.addLectureForTeacher(lecture);
            adminService.addClassAndCourse(classAndCourse);
            return 1;
        } else {
            return 0;
        }
    }

    //取消老师上某一门学科
    @RequestMapping("/deleteLecture")
    @ResponseBody
    public int deleteLecture(String tid, String cid, String crid) {
        Teacher teacher = adminService.findOneTeacher(tid);
        Course course = adminService.findOneCourse(crid);
        Classes classes = adminService.queryOneClass(cid);
        Lecture lecture = new Lecture();
        lecture.setTid(tid);
        lecture.setCid(cid);
        lecture.setCrid(crid);
        ClassAndCourse classAndCourse = new ClassAndCourse();
        classAndCourse.setCid(cid);
        classAndCourse.setCrid(crid);
        Lecture lectureTest = adminService.findOneLecture(lecture);
        ClassAndCourse classAndCourseTest = adminService.findOneClassAndCourse(classAndCourse);
        if (teacher == null) {
            return 2;
        } else if (course == null) {
            return 3;
        } else if (classes == null) {
            return 4;
        } else if (lectureTest != null && classAndCourseTest != null) {
            adminService.deleteLecture(lecture);
            adminService.deleteClassAndCourse(classAndCourse);
            return 1;
        } else {
            return 0;
        }

    }

    //教师离职
    @RequestMapping("/deleteLectureByTid")
    public void deleteLectureByTid(String tid) {
        adminService.deleteAllLectureByTid(tid);
    }

    //修改管理员自己的信息
    @RequestMapping("/updateAdmin")
    @ResponseBody
    public int updateAdmin(String uid, String oldPassword, String newPassword) {
        Status s = adminService.queryOneStatus(uid);
        if (s != null) {
            if (s.getPassword().equals(oldPassword)) {
                Status admin = new Status();
                admin.setUid(uid);
                admin.setPassword(newPassword);
                adminService.updateAdmin(admin);
                return 1;
            } else {
                return 0;
            }
        }
        return 0;
    }

    //查询管理员的个人信息
    @RequestMapping("findMyself")
    public Status findMyself(String uid) {
        return adminService.queryOneStatus(uid);
    }
}
