package com.tfsuefe.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tfsuefe.vo.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
    @RequestMapping(value = "/some")
    public ModelAndView doSome( String name, Integer age) {

        ModelAndView mv = new ModelAndView();
        mv.addObject("name",name);
        mv.addObject("age",age);
        mv.setViewName("show");
        return mv;
    }

}