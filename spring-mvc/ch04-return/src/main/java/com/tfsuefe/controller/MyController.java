package com.tfsuefe.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tfsuefe.vo.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 阿秋
 * @date 2021/10/27 10:50
 */

/**
 * @RequestMapping: value：所有请求的公共部分，叫做公共名称
 * 位置：放在类的上面
 */

@Controller
public class MyController {
    /**
     * 处理器方法返回String--表示逻辑视图名称，需要配置视图解析器
     *
     * @param name
     * @param age
     * @return
     */
    @RequestMapping(value = "/returnString-view.do")
    public String doReturnView(HttpServletRequest request, String name, Integer age) {

        //手工添加数据到request作用域
        request.setAttribute("myname", name);
        request.setAttribute("myage", age);
        //show：逻辑视图名称，项目中配置了视图解析器
        //框架对视图执行的是forward转发操作
        return "show";
    }

    //处理器方法返回String，表示完整视图路径，此时不能配置视图解析器
    @RequestMapping(value = "/returnString-view2.do")
    public String doReturnView2(HttpServletRequest request, String name, Integer age) {

        //手工添加数据到request作用域
        request.setAttribute("myname", name);
        request.setAttribute("myage", age);
        //完整视图路径，项目中不能配置视图解析器
        //框架对视图执行的是forward转发操作
        return "/WEB-INF/jsp/show.jsp";
    }

    //处理器方法返回void，响应ajax请求
    //手工实现ajax，json数据：代码有重复的  1.Java对象传化为json；2.通过HttpServletResponse输出json数据
    @RequestMapping(value = "/returnVoid-ajax.do")
    public void doReturnVoidAjax(HttpServletResponse response, String name, Integer age) throws IOException {

        //处理ajax，使用json做数据的格式
        //假装service调用完成了，使用Student表示处理结果
        Student student = new Student();
        student.setName(name);
        student.setAge(age);
        String json = "";
        //把结果的对象转化为json格式的数据
        if (student != null) {
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(student);
            System.out.println("student转换的json" + json);
        }
        //输出数据，响应ajax的请求
        response.setContentType("application/json;charset=utf-8");
        PrintWriter pw = response.getWriter();
        pw.println(json);
        pw.flush();
        pw.close();
    }

    /**
     * 处理器方法返回一个Student，通过框架转为json，响应ajax请求
     * @ResponseBody:
     *      作用：把处理器方法返回对象json后，通过HttpServletResponse输出给浏览器
     *      位置：在方法的定义上面，和其他注解没有先后顺序的关系
     * 返回对象框架的处理流程
     *      1.框架会把返回的Student 类型，调用框架中的ArrayList<HttpMessageConverter>
     *          中的每个类的canWrite()方法，来检查HttpMessageConverter接口的实现类能处理
     *          student数据类型的数据
     *      2.框架会调用实现类的write(),MappingJackson2HttpMessageConverter的write方法
     *          把刘皇叔的student对象转化为json，调用jackson的ObjectMapper实现转化json
     *      3.框架会调用@ResponseBodu把2的结果数据输出到浏览器，ajax请求处理完成
     *
     */
    @RequestMapping(value = "/returnStudentJson.do")
    @ResponseBody
    public Student doStudentJsonObject(String name,Integer age){
        Student student = new Student();
        student.setName("刘皇叔");
        student.setAge(21);
        return student;//转化为json数据
    }

    /**
     * 处理器方法返回List<Student>
     * 返回对象框架的处理流程
     *      1.框架会把返回的List<Student> 类型，调用框架中的ArrayList<HttpMessageConverter>
     *          中的每个类的canWrite()方法，来检查HttpMessageConverter接口的实现类能处理
     *          student数据类型的数据
     *      2.框架会调用实现类的write(),MappingJackson2HttpMessageConverter的write方法
     *          把刘皇叔的student对象转化为json，调用jackson的ObjectMapper实现转化json array
     *      3.框架会调用@ResponseBodu把2的结果数据输出到浏览器，ajax请求处理完成
     *
     */
    @RequestMapping(value = "/returnStudentJsonArray.do")
    @ResponseBody
    public List<Student> doStudentJsonObjectArray(String name, Integer age){
        List<Student> list = new ArrayList<>();
        Student student = new Student();
        student.setName("刘皇叔");
        student.setAge(21);
        list.add(student);

        student = new Student();
        student.setName("李红敏");
        student.setAge(24);
        list.add(student);
        return list;

    }

    /**
     * 处理器方法返回的是String,String表示的是数据，不是视图
     * 区分返回值String是数据，还是视图，就看有没有@ResponseBody
     * 如果有@ResponseBody注解，返货string就是数据，反之就是视图
     *
     * 默认使用“text/plain;charset=ISO-8859-1"作为contentType，导致中文乱码
     * 解决方法：给RequestMapping增加一个produces，使用这个属性指定心得contentType.
     * 返回对象框架的处理流程
     *      1.框架会把返回的String 类型，调用框架中的ArrayList<HttpMessageConverter>
     *          中的每个类的canWrite()方法，来检查HttpMessageConverter接口的实现类能处理
     *          String数据类型的数据--StringHttpMessageConverter
     *      2.框架会调用实现类的write(),StringHttpMessageConverter的write方法
     *          把字符串按照指定的编码来处理，默认使用“text/plain;charset=ISO-8859-1"
     *      3.框架会调用@ResponseBodu把（2）的结果数据输出到浏览器，ajax请求处理完成
     *
     */
    @RequestMapping(value = "returnStringData.do",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String doStringData(String name,Integer age){
        return "有@ResponseBody，返回对象，表示数据";
    }
}
