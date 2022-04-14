package com.tfsuefe.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author 阿秋
 * @date 2021/10/27 10:50
 */

/**
 * @RequestMapping:
 *  value：所有请求的公共部分，叫做公共名称
 *  位置：放在类的上面
 */

@Controller
public class MyController {

    @RequestMapping(value = "/user/some.do")
    public ModelAndView doSome() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "欢迎使用springmvc做web开发");
        mv.addObject("fun", "执行doSome方法");
        mv.setViewName("/index.jsp");
        return mv;
    }

}
