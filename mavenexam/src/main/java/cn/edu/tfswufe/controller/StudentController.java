package cn.edu.tfswufe.controller;

import cn.edu.tfswufe.model.*;
import cn.edu.tfswufe.service.StudentService;
import cn.edu.tfswufe.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 阿秋
 * @date 2022/3/11 14:01
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private StudentService studentService;
    @Resource
    private TeacherService teacherService;

    //查看公告
    @RequestMapping("/studentFindNotice")
    @ResponseBody
    public List<Notice> studentFindNotice(String sno) {
        Student student = studentService.myself(sno);
        List<Lecture> lectureList1 = studentService.findLecture(student.getCid());
        List<Notice> adminNotice = studentService.findAdminNotice();
        List<Notice> noticeList = new ArrayList<>();
        for (Notice notice : adminNotice) {
            noticeList.add(notice);
        }
        for (Lecture lecture : lectureList1) {
            List<Notice> notices = studentService.findALlNoticeByPower(lecture.getTid());
            for (Notice notice : notices) {
                noticeList.add(notice);
            }
        }
        return noticeList;
    }

    //公告模糊查询
    @RequestMapping("/studentFindNoticeLike")
    @ResponseBody
    public List<Notice> studentFindNoticeLike(String sno, String ntitle) {
        Student student = studentService.myself(sno);
        List<Lecture> lectureList1 = studentService.findLecture(student.getCid());
        List<Notice> adminNotice = studentService.findAdminNoticeLike(ntitle);
        List<Notice> noticeList = new ArrayList<>();
        for (Notice notice1 : adminNotice) {
            noticeList.add(notice1);
        }
        for (Lecture lecture : lectureList1) {
            Notice notice = new Notice();
            notice.setNtitle(ntitle);
            notice.setPower(lecture.getTid());
            List<Notice> notices = studentService.findAllNoticeLike(notice);
            for (Notice notice1 : notices) {
                noticeList.add(notice1);
            }
        }
        return noticeList;
    }

    //查看所有试卷
    @RequestMapping("/studentAllTestPaper")
    @ResponseBody
    public List<TestToStudent> studentAllTestPaper(String cid, String crid) {
        TestToStudent testToStudent = new TestToStudent();
        testToStudent.setCid(cid);
        testToStudent.setCrid(crid);
        return studentService.studentFindAllTest(testToStudent);
    }

    //答题(查看试卷的内容)
    @RequestMapping("/lookTestPaper")
    public List<TeacherTestPaper> lookTestPaper(String testid) {
        return studentService.answerTest(testid);
    }

    //答题（写答案）
    @RequestMapping("/writeTestPaper")
    @ResponseBody
    public int writeTestPaper(String sno, String testid, Integer qid[], String myanswer[]) {
        TestPaper t = new TestPaper();
        t.setSno(sno);
        t.setTestid(testid);
        studentService.writeTestPaper(t);
        for (int i = 0;i < qid.length;i++){
            StudentAnswer answer = new StudentAnswer();
            answer.setSno(sno);
            answer.setTestid(testid);
            answer.setQid(qid[i]);
            answer.setMyanswer(myanswer[i]);
            studentService.writeAnswer(answer);
        }
        return 1;
    }

    @RequestMapping("testContent")
    public ModelAndView testContent(String sno,String pwd, String testid) {
        ModelAndView mv = new ModelAndView();
        TeacherTestPaper t = new TeacherTestPaper();
        t.setTestid(testid);
        System.out.println(pwd);
        List<TeacherTestPaper> testPaperList = studentService.findTeacherTestPaper(t);
        //Student student = studentService.myself(sno);
        System.out.println(testPaperList);
        mv.addObject("paperList", testPaperList);
        mv.addObject("myself",sno);
        mv.addObject("password",pwd);
        mv.setViewName("student/examcontent");
        return mv;
    }

    //答题（改答案）
    @RequestMapping("/changeTestPaper")
    public void changeTestPaper(String sno, String testid, Integer qid, String myanswer) {
        StudentAnswer answer = new StudentAnswer();
        answer.setSno(sno);
        answer.setTestid(testid);
        answer.setQid(qid);
        answer.setMyanswer(myanswer);
        studentService.changeAnswer(answer);
    }

    //查看成绩
    @RequestMapping("/findTestGrade")
    @ResponseBody
    public List<TestPaper> findTestGrade(String sno) {
        return studentService.findAllGrade(sno);
    }

    //查看所学课程
    @RequestMapping("/findStudentCourse")
    @ResponseBody
    public List<Course> findStudentCourse(String sno) {
        System.out.println(studentService.studentFindAllCourse(sno));
        return studentService.studentFindAllCourse(sno);

    }

    @RequestMapping("findNoDoTestPaper")
    @ResponseBody
    public List<Examination> findNoDoTestPaper(String crid, String sno) {
        List<TestPaper> testPaperList = studentService.findAllGrade(sno);
        Examination e = new Examination();
        e.setCrid(crid);
        List<Examination> examinations = studentService.findAllExamination(e);
        for (Examination exam : examinations) {
            for (TestPaper test : testPaperList) {
                if (exam.getTestid().equals(test.getTestid())) {
                    examinations.remove(exam);
                }
            }
        }
        System.out.println(examinations);
        return examinations;
    }
    @RequestMapping("findCompleteTest")
    @ResponseBody
    public List<TestPaper> findCompleteTest(String sno,String crid){
        TestPaper testPaper = new TestPaper();
        testPaper.setSno(sno);
        testPaper.setCrid(crid);
        List<TestPaper> testPaperList = studentService.findNoDoTestPaper(testPaper);
        return testPaperList;
    }
    //查看个人信息
    @RequestMapping("/myselfInformation")
    @ResponseBody
    public Student myselfInformation(String sno) {
        return studentService.myself(sno);
    }

    //修改个人信息
    @RequestMapping("/updateMyselfPassword")
    public void updateMyselfPassword(String sno, String password) {
        Status status = new Status();
        status.setUid(sno);
        status.setPassword(password);
        studentService.updatePassword(status);
    }
}
