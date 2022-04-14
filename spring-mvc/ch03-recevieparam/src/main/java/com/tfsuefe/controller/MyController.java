package com.tfsuefe.controller;

import com.tfsuefe.vo.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
     * 逐个接受请求参数：
     * 要求：处理器（控制器）方法的形参名和请求中参数名必须一致。
     *  同名的请求参数赋值给同名的形参
     *
     *  框架接收请求参数
     *      1.使用request对象接收请求参数
     *      String strName = request.getParameter("name");
     *      String strAge = request.getParameter("age");
     *      2.springmvc框架通过DispatcherServlet 调用MyController的doSome()方法
     *      调用方法时，按名称对应，把接收的参数赋给形参
     *      doSome(strName,Integer.valueof(strAge))
     *      框架会提供类型转换的功能，能将String类型传化为int,long,float等类型
     *
     *     400状态码是客户端错误，表示提交参数过程中，发生了问题
     */
    @RequestMapping(value = "/receiveproperty.do")
    public ModelAndView doSome(String name,Integer age) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("myname", name);
        mv.addObject("myage", age);
        mv.setViewName("show");
        return mv;
    }

    /**请求中参数名和处理器方法的形参名不一样
     * @RequestParam逐个接收请求参数中，解决请求中参数名和形参名不一样的问题
     * 属性：1.value 请求中的参数名称1.
     *      1.required 是一个boolean类型的，默认是true
     *      true表示请求中必须包含此参数
     * 位置： 在处理器方法的形参定义的前面
     *
     */
    @RequestMapping(value = "/receiveParam.do")
    public ModelAndView receiveParam(@RequestParam(value = "rname") String name,
                              @RequestParam(value = "rage") Integer age) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("myname", name);
        mv.addObject("myage", age);
        mv.setViewName("show");
        return mv;
    }

    /**
     * 处理器方法形参是Java对象，这个对象的属性名和请求中参数是一样的
     * 框架会创建形参的Java对象，给属性赋值。请求中的参数是name，框架会调用setName()
     *
     */
    @RequestMapping(value = "/receiveObject.do")
    public ModelAndView receiveObject(Student myStudent) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("myname", myStudent.getName());
        mv.addObject("myage", myStudent.getAge());
        mv.addObject("myStudent",myStudent);
        mv.setViewName("show");
        return mv;
    }

}
