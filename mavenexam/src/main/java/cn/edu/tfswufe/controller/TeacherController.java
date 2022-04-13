package cn.edu.tfswufe.controller;

import cn.edu.tfswufe.model.*;
import cn.edu.tfswufe.service.AdminService;
import cn.edu.tfswufe.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author 阿秋
 * @date 2022/3/9 16:29
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Resource
    private TeacherService teacherService;
    @Resource
    private AdminService adminService;

    //查询班上所有学生
    @RequestMapping("/findAllClassStudent")
    @ResponseBody
    public List<Student> findAllClassStudent(String cid) {
        return teacherService.findAllStudentByClass(cid);
    }

    @RequestMapping("findAllMyTeachingClass")
    @ResponseBody
    public List<Lecture> findAllMyTeachingClass(String tid) {
        List<Lecture> lectureList = teacherService.findAllMyTeachingClass(tid);
        if (lectureList != null) {
            return lectureList;
        } else {
            return null;
        }
    }

    //查询该班级的某一个学生
    @RequestMapping("/findOneStudent")
    @ResponseBody
    public Student findOneStudent(String sno, String cid) {
        Student student = new Student();
        student.setSno(sno);
        student.setCid(cid);
        return teacherService.findOneStudent(student);
    }

    //恢复学生初始密码
    @RequestMapping("/recoveryPassword")
    public void recoveryPassword(String sno) {
        Status status = adminService.queryOneStatus(sno);
        teacherService.recoveryPassword(status);
    }

    //查询所有公告
    @RequestMapping("/findAllNotice")
    @ResponseBody
    public List<Notice> findAllNotice(String power) {
        return teacherService.queryAllNotice(power);
    }

    //公告模糊查询
    @RequestMapping("/teacherFindNoticeLike")
    public List<Notice> teacherFindNoticeLike(String ntitle, String power) {
        Notice notice = new Notice();
        notice.setNtitle(ntitle);
        notice.setPower(power);
        return teacherService.findNoticeLike(notice);
    }

    //新增公告
    @RequestMapping("/insertNotice")
    public void insertNotice(String ntitle, String ncontent, Date ntime, String power) {
        Notice notice = new Notice();
        notice.setNtitle(ntitle);
        notice.setNcontent(ncontent);
        notice.setNtime(ntime);
        notice.setPower(power);
        teacherService.addNotice(notice);
    }

    //修改教师公告
    @RequestMapping("/updateTeacherNotice")
    public void updateTeacherNotice(Integer noticeid, String ntitle, String ncontent, Date ntime, String power) {
        Notice notice = new Notice();
        notice.setNoticeid(noticeid);
        notice.setNtitle(ntitle);
        notice.setNcontent(ncontent);
        notice.setNtime(ntime);
        notice.setPower(power);
        teacherService.updateNotice(notice);
    }

    //删除公告
    @RequestMapping("/deleteTeacherNotice")
    public void deleteTeacherNotice(Integer noticeid, String power) {
        Notice notice = new Notice();
        notice.setNoticeid(noticeid);
        notice.setPower(power);
        teacherService.deleteNotice(notice);
    }

    //查询所有题目
    @RequestMapping("/findAllQuestion")
    @ResponseBody
    public List<Question> findAllQuestion(String power) {
        return teacherService.findAllQuestion(power);
    }

    @RequestMapping("findOneQuestion")
    @ResponseBody
    public Question findOneQuestion(Integer qid, String power) {
        Question question = new Question();
        question.setQid(qid);
        question.setPower(power);
        return teacherService.findOneQuestion(question);
    }

    //新增题目
    @RequestMapping("/insertQuestion")
    @ResponseBody
    public int insertQuestion(String questiontype, String title,
                              String optiona, String optionb, String optionc, String optiond,
                              String answer, Integer correct, String power) {
        Question question = new Question();
        question.setQuestiontype(questiontype);
        question.setTitle(title);
        question.setOptiona(optiona);
        question.setOptionb(optionb);
        question.setOptionc(optionc);
        question.setOptiond(optiond);
        question.setAnswer(answer);
        question.setCorrect(correct);
        question.setCreatetime(new Date());
        question.setPower(power);
        teacherService.addQuestion(question);
        return 1;
    }

    //修改题目
    @RequestMapping("/updateQuestion")
    @ResponseBody
    public int updateQuestion(Integer qid, String questiontype, String title,
                              String optiona, String optionb, String optionc, String optiond,
                              String answer, Integer correct, String power) {
        Question q = new Question();
        q.setQid(qid);
        q.setPower(power);
        Question qTest = teacherService.findOneQuestion(q);
        if (q != null) {
            Question question = new Question();
            question.setQid(qid);
            question.setQuestiontype(questiontype);
            question.setTitle(title);
            question.setOptiona(optiona);
            question.setOptionb(optionb);
            question.setOptionc(optionc);
            question.setOptiond(optiond);
            question.setAnswer(answer);
            question.setCorrect(correct);
            question.setCreatetime(new Date());
            question.setPower(power);
            teacherService.updateQuestion(question);
            return 1;
        } else {
            return 0;
        }

    }

    //删除题目
    @RequestMapping("/deleteQuestion")
    public void deleteQuestion(Integer qid) {
        teacherService.deleteQuestion(qid);
    }

    //查询所有试卷
    @RequestMapping("/teacherFindAllExamination")
    @ResponseBody
    public List<Examination> teacherFindAllExamination(String power) {
        return teacherService.findAllExamination(power);
    }

    //查询试卷内容
    @RequestMapping("/teacherFindTestPaperContent")
    @ResponseBody
    public List<TeacherTestPaper> teacherFindTestPaperContent(String testid) {
        return teacherService.findTeacherTestPaperContent(testid);
    }

    @RequestMapping("findTeacherTestPaper")
    @ResponseBody
    public ModelAndView findTeacherTestPaper(String sno, String testid) {
        ModelAndView mv = new ModelAndView();
        StudentAnswer sa = new StudentAnswer();
        sa.setSno(sno);
        sa.setTestid(testid);
        List<TeacherTestPaper> testPaperList = teacherService.findTeacherTestPaper(sa);
        System.out.println(testPaperList);
        mv.addObject("paperList", testPaperList);
        mv.setViewName("teacher/examcontent");
        return mv;
    }

    //新增试卷
    @RequestMapping("/insertExamination")
    @ResponseBody
    public int insertExamination(String testid, String title, String power, String crid) {
        Examination examinationTest = teacherService.findOneExamination(testid);
        if (examinationTest == null) {
            Examination examination = new Examination();
            examination.setTestid(testid);
            examination.setTesttitle(title);
            examination.setPower(power);
            examination.setCrid(crid);
            teacherService.addExamination(examination);
            return 1;
        } else {
            return 0;
        }

    }

    //试卷添加题目
    @RequestMapping("/insertQuestionToExamination")
    @ResponseBody
    public int insertQuestionToExamination(String testid, Integer qid[]) {
        System.out.println(qid.length);
        for (int i = 0; i < qid.length; i++) {
            TeacherTestPaper t = new TeacherTestPaper();
            t.setQid(qid[i]);
            t.setTestid(testid);
            if (teacherService.findOneTeacherTestPaper(t) == null) {
                TeacherTestPaper teacherTestPaper = new TeacherTestPaper();
                teacherTestPaper.setTestid(testid);
                teacherTestPaper.setQid(qid[i]);
                teacherService.addQuestionToExamination(teacherTestPaper);

            }
        }
        return 1;
    }

    //试卷删除题目
    @RequestMapping("/deleteQuestionToExamination")
    public void deleteQuestionToExamination(String testid, Integer qid) {
        TeacherTestPaper teacherTestPaper = new TeacherTestPaper();
        teacherTestPaper.setTestid(testid);
        teacherTestPaper.setQid(qid);
        teacherService.deleteQuestionToExamination(teacherTestPaper);
    }

    //删除试卷
    @RequestMapping("/deleteExamination")
    @ResponseBody
    public int deleteExamination(String testid) {
        teacherService.deleteTestToStudent(testid);
        teacherService.deleteExamination(testid);
        teacherService.deleteTestPaper(testid);
        teacherService.deleteStudentAnswer(testid);
        return 1;
    }

    //查询已发布试卷
    @RequestMapping("/findAllTestToStudent")
    @ResponseBody
    public List<TestToStudent> findAllTestToStudent(String power) {
        System.out.println(teacherService.findALLTestToStudent(power));
        return teacherService.findALLTestToStudent(power);
    }

    //发布试卷
    @RequestMapping("/testToStudent")
    @ResponseBody
    public int testToStudent(String testid, String cid, String crid) {
        TestToStudent t1 = new TestToStudent();
        t1.setTestid(testid);
        t1.setCid(cid);
        t1.setCrid(crid);

        TestToStudent t2 = teacherService.findTestPower(t1);
        if (t2 == null) {
            t1.setPower(1);
            teacherService.testToStudent(t1);
            return 1;
        } else if (t2 != null && t2.getPower() == 0) {
            t1.setPower(1);
            teacherService.updateTestToStudent(t1);
            return 1;
        } else {
            return 0;
        }

    }

    @RequestMapping("findLectureByTidNoRepeat")
    @ResponseBody
    public List<Lecture> findLectureByTidNoRepeat(String tid) {
        return teacherService.findLectureByTidNoRepeat(tid);
    }

    //查询该班级的试卷
    @RequestMapping("findTestByCid")
    @ResponseBody
    public ModelAndView findTestByCid(String cid, String crid, String testid, String pwd, String tid) {
        ModelAndView mv = new ModelAndView();
        TestToStudent test = new TestToStudent();
        test.setTestid(testid);
        test.setCid(cid);
        test.setCrid(crid);
        List<TestPaper> testPapers = teacherService.findAllTestToClass(test);
        System.out.println(testPapers);
        mv.addObject("testPaperList", testPapers);
        mv.addObject("teacherUid", tid);
        mv.addObject("password", pwd);
        mv.setViewName("teacher/exam");
        return mv;
    }

    //通过试卷ID来查询学生试卷
    @RequestMapping("findTestByCidAndTestId")
    @ResponseBody
    public List<TestPaper> findTestByTestId(String testid) {
        return teacherService.findTestByTestId(testid);
    }

    //修改试卷权限
    @RequestMapping("/updateTestToStudent")
    @ResponseBody
    public int updateTestToStudent(String testid, String cid, String crid) {
        TestToStudent test = new TestToStudent();
        test.setTestid(testid);
        test.setCid(cid);
        test.setCrid(crid);
        test.setPower(0);
        teacherService.updateTestToStudent(test);
        return 1;
    }

    //删除已发布的试卷
    @RequestMapping("/deleteTestToStudent")
    public void deleteTestToStudent(String testid) {
        teacherService.deleteTestToStudent(testid);
    }

    //评阅试卷
    @RequestMapping("/reviewStudentTest")
    @ResponseBody
    public String reviewStudentTest(String testid, String sno, Integer qid[], Integer correct[]) {
        var n = 0;
        for (int i = 0; i < qid.length; i++) {
            StudentAnswer studentAnswer1 = new StudentAnswer();
            studentAnswer1.setSno(sno);
            studentAnswer1.setTestid(testid);
            studentAnswer1.setQid(qid[i]);
            StudentAnswer answer = teacherService.findStudentTestOneAnswer(studentAnswer1);
            TeacherTestPaper t = new TeacherTestPaper();
            t.setTestid(testid);
            t.setQid(qid[i]);
            TeacherTestPaper teacherTest = teacherService.findOneTeacherTestPaperContent(t);
            if (teacherTest.getQid() == qid[i]) {
                if (teacherTest.getQuestiontype().equals("选择题") ||
                        teacherTest.getQuestiontype().equals("判断题")) {
                    if (teacherTest.getAnswer().equals(answer.getMyanswer())) {
                        StudentAnswer studentAnswer2 = new StudentAnswer();
                        studentAnswer2.setSno(sno);
                        studentAnswer2.setTestid(testid);
                        studentAnswer2.setQid(qid[i]);
                        studentAnswer2.setCorrect(teacherTest.getCorrect());
                        teacherService.reviewStudentTest(studentAnswer2);
                        n++;
                    } else {
                        StudentAnswer studentAnswer2 = new StudentAnswer();
                        studentAnswer2.setSno(sno);
                        studentAnswer2.setTestid(testid);
                        studentAnswer2.setQid(qid[i]);
                        studentAnswer2.setCorrect(0);
                        teacherService.reviewStudentTest(studentAnswer2);
                        n++;
                    }
                } else {
                    StudentAnswer studentAnswer2 = new StudentAnswer();
                    studentAnswer2.setSno(sno);
                    studentAnswer2.setTestid(testid);
                    studentAnswer2.setQid(qid[i]);
                    studentAnswer2.setCorrect(correct[i - n]);
                    teacherService.reviewStudentTest(studentAnswer2);
                }
            }
        }
        score(testid, sno);
        return "teacher/exam";
    }

    //计算总分
    @RequestMapping("/score")
    public void score(String testid, String sno) {
        StudentAnswer studentAnswer1 = new StudentAnswer();
        studentAnswer1.setSno(sno);
        studentAnswer1.setTestid(testid);
        List<StudentAnswer> studentAnswerList = teacherService.findStudentAnswer(studentAnswer1);
        int grade = 0;
        for (StudentAnswer answer : studentAnswerList) {
            grade = grade + answer.getCorrect();
        }
        TestPaper testPaper = new TestPaper();
        testPaper.setTestid(testid);
        testPaper.setSno(sno);
        testPaper.setGrade(grade);
        teacherService.score(testPaper);
    }

    //修改个人密码
    @RequestMapping("/teacherUpdatePassword")
    public void teacherUpdatePassword(String tid, String password) {
        Status status = new Status();
        status.setUid(tid);
        status.setPassword(password);
        teacherService.updateTeacher(status);
    }

    @RequestMapping("/tleft")
    public ModelAndView tleft() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("left");
        System.out.println("111");
        return modelAndView;
    }

    //查询教师所教班级的课程的试卷
    @RequestMapping("findTestByCridAndCid")
    @ResponseBody
    public List<TestToStudent> findTestByCridAndCid(String tid) {
        return teacherService.findTestByCridAndCid(tid);
    }
}
