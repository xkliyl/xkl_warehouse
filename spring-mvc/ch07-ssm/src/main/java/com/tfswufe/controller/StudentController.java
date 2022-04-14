package com.tfswufe.controller;

import com.tfswufe.domain.Student;
import com.tfswufe.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 阿秋
 * @date 2021/10/31 14:30
 */
@Controller
public class StudentController {
    @Resource
    private StudentService service;
    String tips = "注册失败";
    //注册学生
    @RequestMapping("/addStudent")
    public ModelAndView addStudent(Student student){
        ModelAndView mv = new ModelAndView();
        //调用service处理student
        int nums = service.addStudent(student);
        if(nums>0){
            //注册成功
            tips = "学生"+student.getName()+"注册成功";

        }
        //添加数据
        mv.addObject("tips",tips);

        //指定结果页面
        mv.setViewName("result");
        return mv;
    }

    //处理查询，响应ajax
    @RequestMapping("/queryStudent")
    @ResponseBody
    public List<Student> queryStudent(){
        //做参数检查，简单的数据处理
        List<Student> students = service.findStudents();
        return students;
    }
}
