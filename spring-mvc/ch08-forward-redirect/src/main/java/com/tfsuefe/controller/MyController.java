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
    /**
     * 处理器方法返回ModelAndView，实现转发
     * 语法：setViewName("forward:视图完整路径");
     * forward特点：不和视图解析器一同使用，就当项目中没有视图解析器
     * @return
     */
    @RequestMapping(value = "/doForward.do")
    public ModelAndView doSome() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "欢迎使用springmvc做web开发");
        mv.addObject("fun", "执行doSome方法");
        //显示转发，如果转发的视图不在视图解析器的目录下，就可以使用这个方式
        mv.setViewName("forward:/WEB-INF/jsp/show.jsp");
        return mv;
    }

}
