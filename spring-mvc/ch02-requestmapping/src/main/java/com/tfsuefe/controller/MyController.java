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
@RequestMapping(value = "/test")
@Controller
public class MyController {
    /**
     * @RequestMapping:请求映射
     *      属性：method，表示请求方式。它的值RequestMethod类枚举值
     *          例如表示get请求方式，RequestMethod.get
     *              post请求方式，RequestMethod.post
     *不用对应的请求方式或报请求方式错误的异常
     */
    //指定some.do使用get请求方式
    @RequestMapping(value = "/some.do",method = RequestMethod.GET)
    public ModelAndView doSome() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "欢迎使用springmvc做web开发");
        mv.addObject("fun", "执行doSome方法");
        mv.setViewName("show");
        return mv;
    }
    //指定other.do是post请求
    @RequestMapping(value = "/other.do",method = RequestMethod.POST)
    public ModelAndView doOther() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "=====欢迎使用springmvc做web开发=======");
        mv.addObject("fun", "执行doOther方法");
        mv.setViewName("other");
        return mv;
    }
    //不指定请求方式,没有限制
    @RequestMapping(value = "/first.do")
    public ModelAndView doFirst(HttpServletRequest request,
                                HttpServletResponse response,
                                HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg",
                "=====欢迎使用springmvc做web开发======="+
                request.getParameter("name"));
        mv.addObject("fun", "执行doFirst方法");
        mv.setViewName("other");
        return mv;
    }
}
