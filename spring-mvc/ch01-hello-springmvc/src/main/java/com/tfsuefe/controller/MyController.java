package com.tfsuefe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 阿秋
 * @date 2021/10/27 10:50
 */

/**
 * @Controller，创建处理器对象的，对象放在springmvc容器中
 *      叫做后端控制器
 */
@Controller
public class MyController {
    /**
     * 处理用户提交的请求，springmvc是使用方法来处理的
     * 方法是自定义的，可以有多种返回值，多种参数，
     */
    /**
     * 准备使用doSome方法处理some.do请求
     *
     * @RequestMapping：请求映射，作用是把一个请求地址和一个方法绑定在一起 一个请求指定一个方法处理。
     * 属性：1.value  是一个String，表示请求的url地址（some.do）
     * value值必须是唯一的，不能重复,在使用时推荐以斜杠“/”开头
     * value是一个数组，也就是说可以value = {"/index.do","/mumu.do"},
     * 意思是不同的地址访问同一个方法处理
     * 位置：1.在方法的上面，常用的
     * 2.在类的上面
     * 说明：使用RequestMapping修饰的方法佳作处理器方法，或者控制器方法
     * 使用RequestMapping修饰的方法可以处理请求，相当于servlet中的doGet，doPost
     * 返回值ModelAndView：
     * model：数据，请求处理完成后，要显示给用户的数据
     * view：视图，比如jsp
     */

    @RequestMapping(value = "/some.do")
    public ModelAndView doSome() {
        ModelAndView mv = new ModelAndView();
        //添加数据，框架在请求的最后把数据梵高request作用域
        //request.setAttribute("msg","欢迎使用springmvc做web开发")
        mv.addObject("msg", "欢迎使用springmvc做web开发");
        mv.addObject("fun", "执行doSome方法");
        //指定视图，指定视图的完整路径
//        mv.setViewName("/show.jsp");
       // mv.setViewName("/WEB-INF/jsp/show.jsp");

        //当配置视图解析器后，可以使用逻辑名称（文件名），指定视图
        //框架会使用视图解析器的前缀+逻辑名称+后缀组成完整路径，这是字符串连接操作
        ///WEB-INF/jsp/+show+.jsp
        mv.setViewName("show");
        return mv;
    }
}
