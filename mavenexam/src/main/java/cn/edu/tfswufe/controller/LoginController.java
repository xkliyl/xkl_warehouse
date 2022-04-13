package cn.edu.tfswufe.controller;

import cn.edu.tfswufe.model.Status;
import cn.edu.tfswufe.service.StatusService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * @author 阿秋
 * @date 2021/11/29 13:05
 */
@Controller
public class LoginController {
    @Resource
    private StatusService statusService;
    //登录
    @RequestMapping("/denglu")
    public ModelAndView login(String uid, String pwd){
        ModelAndView mv = new ModelAndView();
        Status status1 = statusService.loginChecking(uid);
        System.out.println(status1);
        String pswd = status1.getPassword();

        if (pswd.equals(pwd)){
            int power = status1.getPower();
            System.out.println(power);
            if (power == 0){
                mv.addObject("status",status1);
                mv.setViewName("admin/admin");
            }else if (power == 1){
                mv.addObject("status",status1);
                mv.setViewName("teacher/teacher");
            }else {
                mv.addObject("status",status1);
                mv.setViewName("student/student");
            }
        }else {
            mv.setViewName("error");
        }
        return mv;
    }


}
