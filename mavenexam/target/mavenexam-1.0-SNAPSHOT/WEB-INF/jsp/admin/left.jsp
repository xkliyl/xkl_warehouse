<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/4/3
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="static/css/bootstrap.min.css"/>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
    <style type="text/css">
        li, ul {
            text-align: center;
        }

        .container-fluid>div>ul>li>a{
            list-style: none;
            color: #000000;
        }
        .container-fluid>div>ul>li>ul>li>a{
            list-style: none;
            color: #000000;
        }
        body {
            overflow-x: hidden;
        }
        a{
            color: #0f0f0f;
        }

    </style>

</head>
<body>
<div class="container-fluid">
    <div class="row">
        <ul id="leftUl" class="nav nav-stacked list-unstyled col-md-1"
            style="background: #b8b7b6;padding: 0px;height: 634px;">
            <li><a id="teacherManger" class="active" href="#findAllTer" aria-controls="findAllTer"
                   data-toggle="tab">教师管理<span class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="teacherMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="allTeacher" href="#findAllTer" aria-controls="findAllTer" data-toggle="tab" onclick="findAllTeacher(1)">所有教师</a></li>
                    <li><a id="addTeacher" href="#addTer" aria-controls="addTer" data-toggle="tab">新增教师</a></li>
                    <li><a id="updateTeacher" href="#updateTer" aria-controls="updateTer" data-toggle="tab">修改教师信息</a></li>
                    <li><a id="InitialPwdTeacher" href="#InitialPwd" aria-controls="InitialPwd" data-toggle="tab">恢复教师初始密码</a></li>
                    <li><a id="deleteTeacher" href="#dleteTer" aria-controls="deleteTer" data-toggle="tab">删除教师</a></li>

                </ul>
            </li>
            <li><a id="classManger" href="#findAllCls" aria-controls="findAllCls" data-toggle="tab" >班级管理<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="classMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="allClass" href="#findAllCls" aria-controls="findAllCls" data-toggle="tab" onclick="findAllClass()">所有班级</a></li>
                    <li><a id="addClass" href="#addCls" aria-controls="addCls" data-toggle="tab">新增班级</a></li>
                    <li><a id="updateClass" href="#updateCls" aria-controls="updateCls" data-toggle="tab">修改班级</a></li>
                    <li><a id="deleteClass" href="#dleteCls" aria-controls="deleteCls" data-toggle="tab">删除班级</a></li>
                </ul>
            </li>
            <li><a id="studentManger" href="#findAllStu" aria-controls="findAllStu" data-toggle="tab">学生管理<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="studentMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="findAllStudent" href="#findAllStu" aria-controls="findAllStu" data-toggle="tab">所有学生</a>
                    </li>
                    <li><a id="addStudent" href="#addStu" aria-controls="addStu" data-toggle="tab">新增学生</a></li>
                    <li><a id="updateStudent" href="#updateStu" aria-controls="updateStu" data-toggle="tab">修改学生信息</a>
                    </li>
                    <li><a id="StuInitialPwdTeacher" href="#StuInitialPwd" aria-controls="StuInitialPwd" data-toggle="tab">恢复学生初始密码</a></li>

                    <li><a id="deleteStudent" href="#deleteStu" aria-controls="deleteStu" data-toggle="tab">删除学生</a>
                    </li>
                </ul>
            </li>
            <li><a id="courseManger" href="#findAllCru" aria-controls="findAllCru" data-toggle="tab" >课程管理<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="courseMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="findAllCruse" href="#findAllCru" aria-controls="findAllCru" data-toggle="tab" onclick="findAllCourse()">所有课程</a></li>
                    <li><a id="addCruse" href="#addCru" aria-controls="addCru" data-toggle="tab">新增课程</a></li>
                    <li><a id="teacherAllCourse" href="#teacherAllCru" aria-controls="teacherAllCru" data-toggle="tab" onclick="findTeacherCrouse()">老师授课科目</a></li>

                    <li><a id="teacheraddCourse" href="#teacheraddCru" aria-controls="teacheraddCru" data-toggle="tab">分配课程</a></li>
                    <li><a id="deleteteachertoCourse" href="#deleteteachertoCru" aria-controls="deleteteachertoCru" data-toggle="tab">取消授课</a></li>

                    <li><a id="updateCruse" href="#updateCru" aria-controls="updateCru" data-toggle="tab">修改课程信息</a></li>
                    <li><a id="deleteCruse" href="#deleteCru" aria-controls="deleteCru" data-toggle="tab">删除课程</a></li>

                </ul>
            </li>
            <li><a id="noticeManger" href="#findAllNot" aria-controls="findAllNot" data-toggle="tab">公告管理<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="noticeMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="findAllNotice" href="#findAllNot" aria-controls="findAllNot" data-toggle="tab" onclick="findAllNoticeBtn()">所有公告</a>
                    </li>
                    <li><a id="addNotice" href="#addNot" aria-controls="addNot" data-toggle="tab">新增公告</a></li>
                    <li><a id="updateNotice" href="#updateNot" aria-controls="updateNot" data-toggle="tab">修改公告</a></li>
                    <li><a id="deleteNotice" href="#deleteNot" aria-controls="deleteNot" data-toggle="tab">删除公告</a></li>

                </ul>
            </li>
            <li><a id="myself" href="#myselfinformation" aria-controls="myselfinformation" data-toggle="tab">个人信息<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="myselfMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="myselfinfo" href="#myselfinformation" aria-controls="myselfinformation" data-toggle="tab">我的个人信息</a>
                    </li>
                    <li><a id="updatemyself" href="#updatemyselfinfo" aria-controls="updatemyselfinfo" data-toggle="tab">修改密码</a>
                    </li>
                </ul>
            </li>

        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="findAllTer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>序号</td>
                                <td>教师ID</td>
                                <td>姓名</td>
                                <td>性别</td>
                                <td>年龄</td>
                                <td>密码</td>
                                </thead>
                                <tbody id="teacherBody">
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-5 col-md-offset-4">
                            <nav aria-label="Page navigation">
                                <ul class="pagination" id="btnarray">
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="addTer">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputUid" class="col-md-2 control-label">教师ID</label><span id="teacherIdSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputUid" placeholder="教师ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputName" class="col-md-2 control-label">教师姓名</label><span id="teacherNameSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputName" placeholder="教师姓名">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label  class="col-md-2 control-label">教师性别</label>
                            <div class="col-md-5">
                                <input type="checkbox" id="man" value="男">男
                                <input type="checkbox" id="woman" value="女">女

                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputbirthday" class="col-md-2 control-label">教师出生日期</label>
                            <div class="col-md-5">
                                <input type="date" class="form-control" id="inputbirthday">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputpassword" class="col-md-2 control-label">教师密码</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputpassword" value="1234" disabled="disabled">
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" id="addTerBtn" value="添加教师"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="updateTer">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputUid" class="col-md-2 control-label">教师ID</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateUid" placeholder="教师ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputName" class="col-md-2 control-label">教师姓名</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateName" placeholder="教师姓名">
                            </div>
                        </div>

                        <div class="col-md-8 col-md-offset-1">
                            <input type="button" id="updateTerBtn"  value="更新教师信息"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="InitialPwd">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="inputUid" class="col-md-2 control-label" style="margin-top: 10px">教师ID</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="InitialPwdUid" placeholder="教师ID">
                        </div>
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" id="initPwdBtn"  value="恢复教师初始密码" style="margin-top: 7px"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="dleteTer">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="inputUid" class="col-md-2 control-label" style="margin-top: 10px">教师ID</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="deleteUid" placeholder="教师ID">
                        </div>
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" id="deleteTerBtn" onclick="deleteTeacher()" value="删除教师" style="margin-top: 7px"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="findAllCls">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>班级ID</td>
                                <td>班级名称</td>
                                <td>所属专业</td>
                                </thead>
                                <tbody id="classBody">

                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-5 col-md-offset-4">
                            <nav aria-label="Page navigation">
                                <ul class="pagination" id="classPage">

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="addCls">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="form-group col-md-8" style="margin-top: 10px;">
                                <label for="inputCid" class="col-md-2 control-label" style="margin-top: 10px">班级ID</label>
                                <span id="inputCidSpan" style="color: red"></span>
                                <div class="col-md-5">
                                    <input type="text" class="form-control" id="inputCid" placeholder="班级ID">
                                </div>
                            </div>
                            <div class="form-group col-md-8" style="margin-top: 10px;">
                                <label for="inputCname" class="col-md-2 control-label" style="margin-top: 10px">班级名称</label>
                                <span id="inputCnameSpan" style="color: red"></span>
                                <div class="col-md-5">
                                    <input type="text" class="form-control" id="inputCname" placeholder="班级名称">
                                </div>
                            </div>
                            <div class="form-group col-md-8" style="margin-top: 10px;">
                                <label  class="col-md-2 control-label" style="margin-top: 10px">专业名称</label>
                                <div class="col-md-5">
<%--                                    <input type="text" class="form-control" id="inputMid" placeholder="专业ID">--%>
                                    <select id="majorSelect" style="margin-top: 10px">
                                        <option value="">请选择专业</option>
                                        <option value="000101">计算机科学与技术</option>
                                        <option value="000102">智能科学技术</option>
                                        <option value="000103">数字媒体技术</option>
                                        <option value="000201">金融学</option>
                                        <option value="000202">国际经济与贸易</option>
                                        <option value="000301">建筑设计</option>
                                        <option value="000302">土木工程</option>
                                        <option value="000401">会计学</option>
                                        <option value="000402">财务管理</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-8 col-md-offset-1" >
                                <input type="button" id="addClassBtn" value="添加班级"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="updateCls">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputUid" class="col-md-2 control-label">班级ID</label>
                            <span id="updateCidSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateCid" placeholder="班级ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputName" class="col-md-2 control-label">班级名称</label>
                            <span id="updateCnameSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateCname" placeholder="班级名称">
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1">
                            <input type="button" id="updateClsBtn" value="更新班级信息"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="dleteCls">
                <div class="row">
                    <div class="form-group col-md-10" style="margin-top: 10px;">
                        <label for="inputUid" class="col-md-2 control-label" style="margin-top: 10px">班级ID</label>
                        <span id="deleteCidSpan" style="color: red"></span>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="deleteCid" placeholder="班级ID">
                        </div>
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" id="deleteClsBtn" value="删除班级" style="margin-top: 7px"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="findAllStu">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>序号</td>
                                <td>学号</td>
                                <td>姓名</td>
                                <td>性别</td>
                                <td>年龄</td>
                                <td>班级</td>
                                </thead>
                                <tbody>
                                <td>1</td>
                                <td>41802211</td>
                                <td>李牧子</td>
                                <td>女</td>
                                <td>20</td>
                                <td>18级计算机科学01班</td>
                                </tbody>
                                <tbody>
                                <td>2</td>
                                <td>41802314</td>
                                <td>张浩楠</td>
                                <td>男</td>
                                <td>21</td>
                                <td>19级会计01班</td>
                                </tbody>
                                <tbody>
                                <td>3</td>
                                <td>41802332</td>
                                <td>雪莉</td>
                                <td>女</td>
                                <td>19</td>
                                <td>18级计算机科学02班</td>
                                </tbody>
                                <tbody>
                                <td>4</td>
                                <td>41803366</td>
                                <td>汪德文</td>
                                <td>男</td>
                                <td>21</td>
                                <td>18级计算机科学02班</td>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-5 col-md-offset-4">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li>
                                        <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li><a href="#">1</a></li>
                                    <li>
                                        <a href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="addStu">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputSno" class="col-md-2 control-label">学号</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputSno" placeholder="学号">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputStuName" class="col-md-2 control-label">学生姓名</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputStuName" placeholder="学生姓名">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputStuSex" class="col-md-2 control-label">学生性别</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputStuSex" placeholder="学生性别">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputStuBirthday" class="col-md-2 control-label">学生出生日期</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputStuBirthday" placeholder="学生出生日期">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputStuCid" class="col-md-2 control-label">学生班级</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputStuCid" placeholder="学生班级">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputstupassword" class="col-md-2 control-label">学生密码</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputstupassword" value="123456" disabled="disabled">
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" onclick="addTeacher()" value="添加学生"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="updateStu">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="updateSno" class="col-md-2 control-label">学号</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateSno" placeholder="学号">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="updateStuName" class="col-md-2 control-label">学生姓名</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateStuName" placeholder="学生姓名">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="updateStuCid" class="col-md-2 control-label">学生班级</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateStuCid" placeholder="学生班级">
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" onclick="addTeacher()" value="更新学生信息"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="StuInitialPwd">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="StuInitialPwdUid" class="col-md-2 control-label" style="margin-top: 10px">学号</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="StuInitialPwdUid" placeholder="学号">
                        </div>
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" onclick="TeacherInitialPwd()" value="恢复学生初始密码" style="margin-top: 7px"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="deleteStu">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="deleteSno" class="col-md-2 control-label" style="margin-top: 10px">学号</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="deleteSno" placeholder="学号">
                        </div>
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" onclick="deleteTeacher()" value="删除学生" style="margin-top: 7px"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="findAllCru">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>课程ID</td>
                                <td>课程名称</td>
                                <td>所属专业</td>
                                </thead>
                                <tbody id="courseBody">

                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-5 col-md-offset-4">
                            <nav aria-label="Page navigation">
                                <ul class="pagination" id="coursePages">

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="addCru">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="CourseID" class="col-md-2 control-label">课程ID</label>
                            <span id="CourseIDSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="CourseID" placeholder="课程ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="CourseName" class="col-md-2 control-label">课程名称</label>
                            <span id="CourseNameSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="CourseName" placeholder="课程名称">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="CourseToMajor" class="col-md-2 control-label">所属专业ID</label>
                            <div class="col-md-5" style="margin-top: 10px">
                                <select id="CourseToMajor">
                                    <option value="">请选择专业</option>
                                    <option value="000101">计算机科学与技术</option>
                                    <option value="000102">智能科学技术</option>
                                    <option value="000103">数字媒体技术</option>
                                    <option value="000201">金融学</option>
                                    <option value="000202">国际经济与贸易</option>
                                    <option value="000301">建筑设计</option>
                                    <option value="000302">土木工程</option>
                                    <option value="000401">会计学</option>
                                    <option value="000402">财务管理</option>
                                </select>

                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" id="addCourseBtn" value="添加课程"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="teacherAllCru">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1" style="margin-top: 10px">
                            <input type="text" id="teacherCourseSelect" placeholder="教师ID" style="width: 400px">
                            <button style="width: 40px;height: 25px" onclick="findLectureByTid()"><span class="glyphicon glyphicon-search" style="font-size: 8px"></span> </button>
                        </div>
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>教师ID</td>
                                <td>学科名称</td>
                                <td>班级名称</td>
                                </thead>
                                <tbody id="teacherAllCruBody">

                                </tbody>

                            </table>
                        </div>
                        <div class="col-md-5 col-md-offset-4">
                            <nav aria-label="Page navigation">
                                <ul class="pagination" id="allTeacherCruPages">

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="teacheraddCru">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="teacherCourseID" class="col-md-2 control-label">课程ID</label>
                            <span id="teacherCourseIDSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="teacherCourseID" placeholder="课程ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="teacherIDToCourse" class="col-md-2 control-label">教师ID</label>
                            <span id="teacherIDToCourseSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="teacherIDToCourse" placeholder="教师ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="CIDToCourse" class="col-md-2 control-label">班级ID</label>
                            <span id="CIDToCourseSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="CIDToCourse" placeholder="班级ID">
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" id="addTeacherAndCourse" value="添加课程授课老师"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="deleteteachertoCru">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="deleteteacherCourseID" class="col-md-2 control-label">课程ID</label>
                            <span id="deleteteacherCourseIDSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="deleteteacherCourseID" placeholder="课程ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="deleteteacherIDToCourse" class="col-md-2 control-label">教师ID</label>
                            <span id="deleteteacherIDToCourseSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="deleteteacherIDToCourse" placeholder="教师ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="dCIDToCourse" class="col-md-2 control-label">班级ID</label>
                            <span id="dCIDToCourseSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="dCIDToCourse" placeholder="班级ID">
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" id="deleteTeacherForCourse" value="取消课程授课老师"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="updateCru">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="updateCourseID" class="col-md-2 control-label">课程ID</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateCourseID" placeholder="课程ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="updateCourseName" class="col-md-2 control-label">课程名称</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateCourseName" placeholder="课程名称">
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" onclick="addTeacher()" value="更新课程信息"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="deleteCru">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="deleteCourse" class="col-md-2 control-label" style="margin-top: 10px">课程ID</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="deleteCourse" placeholder="课程ID">
                        </div>
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" onclick="deleteTeacher()" value="删除课程" style="margin-top: 7px"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="findAllNot">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1" style="margin-top: 10px">
                            <input type="text" placeholder="公告标题" style="width: 400px" id="oneNoticeTitle">
                            <button style="width: 40px;height: 25px" onclick="findOneNotice()"><span class="glyphicon glyphicon-search" style="font-size: 8px"></span></button>
                        </div>
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>公告ID</td>
                                <td>公告标题</td>
                                <td>发布时间</td>
                                </thead>
                                <tbody id="noticeBody">

                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-5 col-md-offset-4">
                            <nav aria-label="Page navigation">
                                <ul class="pagination" id="noticePages">

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="addNot">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="noticetitle" class="col-md-2 control-label">公告标题</label>
                            <span id="noticetitleSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="noticetitle" placeholder="公告标题">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="ncontent" class="col-md-2 control-label">公告内容</label>
                            <span id="ncontentSpan" style="color: red"></span>
                            <div class="col-md-5">
                                <textarea type="textarea" class="form-control" id="ncontent" style="resize: none;width: 500px;height: 100px"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="noticepower" class="col-md-2 control-label">公告权限</label>
                            <div class="col-md-5">
                                <select id="noticepower" style="margin-top: 10px">
                                    <option value="">请选择权限</option>
                                    <option value="all">所有人</option>
                                    <option value="teacher">教师</option>
                                    <option value="student">学生</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" id="addNoticeBtn" value="添加公告"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="updateNot">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="updatenoticeid" class="col-md-2 control-label">公告ID</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updatenoticeid" placeholder="公告ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="updatenoticetitle" class="col-md-2 control-label">公告标题</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updatenoticetitle" placeholder="公告标题">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="updatencontent" class="col-md-2 control-label">公告内容</label>
                            <div class="col-md-5">
                                <textarea type="textarea" class="form-control" id="updatencontent" style="resize: none;width: 500px;height: 100px"></textarea>
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" id="updateNoticeBtn" value="修改公告"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="deleteNot">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="deletenoticeid" class="col-md-2 control-label" style="margin-top: 10px">公告ID</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="deletenoticeid" placeholder="公告ID">
                        </div>
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" onclick="deleteTeacher()" value="删除公告" style="margin-top: 7px"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="myselfinformation">
                <div class="container-fluid">
                    <div class="row" style="margin-top: 10px">
                        <div class="col-md-2 col-md-offset-1" style="background-color: #aeb0b2">
                            <label >管理员ID</label>
                        </div>
                        <div class="col-md-2" style="background-color: #b8b7b6">
                            <label>admin</label>
                        </div>
                        <div class="col-md-2" style="background-color: #aeb0b2">
                            <label >姓名</label>
                        </div>
                        <div class="col-md-3" style="background-color: #b8b7b6">
                            <label>马冬梅</label>
                        </div>

                    </div>
                </div>
            </div>
            <div class="tab-pane" id="updatemyselfinfo">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="StuInitialPwdUid" class="col-md-2 control-label" style="margin-top: 10px">旧密码</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="oldpassword" placeholder="旧密码">
                        </div>
                    </div>
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="StuInitialPwdUid" class="col-md-2 control-label" style="margin-top: 10px">新密码</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="newpassword" placeholder="新密码">
                        </div>
                    </div>
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" id="updatePwdBtn" value="修改密码" style="margin-top: 7px"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="text" id="adminUid" hidden="hidden" value="<%String aa=request.getParameter("uid");
        out.print(aa);%>">
</body>
<script type="text/javascript">
    $(function () {
        var teacherMangerElt = document.getElementById("teacherManger");
        var classMangerElt = document.getElementById("classManger");
        var studentMangerElt = document.getElementById("studentManger");
        var courseMangerElt = document.getElementById("courseManger");
        var noticeMangerElt = document.getElementById("noticeManger");
        var myselfElt = document.getElementById("myself");

        var teacherMangerMenuElt = document.getElementById("teacherMangerMenu");
        var classMangerMenuElt = document.getElementById("classMangerMenu");
        var studentMangerMenuElt = document.getElementById("studentMangerMenu");
        var courseMangerMenuElt = document.getElementById("courseMangerMenu");
        var noticeMangerMenuElt = document.getElementById("noticeMangerMenu");
        var myselfMenuElt = document.getElementById("myselfMangerMenu");

        teacherMangerElt.onclick = function () {
            if (teacherMangerMenuElt.hidden == true){
                teacherMangerMenuElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;
            studentMangerMenuElt.hidden = true;
            courseMangerMenuElt.hidden = true;
            noticeMangerMenuElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        classMangerElt.onclick = function () {
            findAllClass();
            if (classMangerMenuElt.hidden == true) {
                classMangerMenuElt.hidden = false;

            }

            studentMangerMenuElt.hidden = true;
            courseMangerMenuElt.hidden = true;
            noticeMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        studentMangerElt.onclick = function () {

            if (studentMangerMenuElt.hidden == true) {
                studentMangerMenuElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;
            courseMangerMenuElt.hidden = true;
            noticeMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            myselfMenuElt.hidden = true;

        }
        courseMangerElt.onclick = function () {
            findAllCourse();
            if (courseMangerMenuElt.hidden == true) {
                courseMangerMenuElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;
            studentMangerMenuElt.hidden = true;
            noticeMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        noticeMangerElt.onclick = function () {
            findAllNoticeBtn();
            if (noticeMangerMenuElt.hidden == true) {
                noticeMangerMenuElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;
            studentMangerMenuElt.hidden = true;
            courseMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        myselfElt.onclick = function () {
            if (myselfMenuElt.hidden == true){
                myselfMenuElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;
            studentMangerMenuElt.hidden = true;
            courseMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            noticeMangerMenuElt.hidden = true;
        }
        findAllTeacher(1);
        var tsex1 = document.getElementById("man");
        var tsex2 = document.getElementById("woman");
        tsex1.onclick = function () {
            tsex2.checked =false;
        }
        tsex2.onclick = function () {
            tsex1.checked =false;
        }

        var teacherId = document.getElementById("inputUid");
        var teacherName = document.getElementById("inputName");
        var teacherIdSpanElt = document.getElementById("teacherIdSpan");
        var teacherNameSpanElt = document.getElementById("teacherNameSpan");
        teacherId.onfocus = function () {
            teacherIdSpanElt.innerText = "";
        }
        teacherName.onfocus = function () {
            teacherNameSpanElt.innerText = "";
        }
        teacherId.onblur = function () {
            var teacherIdValue = teacherId.value;
            teacherIdValue.trim();
            if (teacherIdValue == ""){
                teacherIdSpanElt.innerText = "ID不能为空";
            }
        }
        teacherName.onblur = function () {
            var teacherNameValue = teacherName.value;
            if (teacherNameValue == ""){
                teacherNameSpanElt.innerText = "姓名不能为空"
            }
        }
        var addTerBtnElt = document.getElementById("addTerBtn");
        addTerBtnElt.onclick = function () {
            teacherId.focus();
            teacherId.blur();
            teacherName.focus();
            teacherName.blur();
            if (teacherIdSpanElt.innerText == "" && teacherNameSpanElt.innerText == ""){
                addTeacher();
            }
            teacherId.value = "";
            teacherName.value = "";
            var birthday = document.getElementById("inputbirthday");
            birthday.value = null;
            var manElt = document.getElementById("man");
            manElt.checked = false;
            var womanElt = document.getElementById("woman");
            womanElt.checked = false;
        }
        var updateTerBtnElt = document.getElementById("updateTerBtn");
        updateTerBtnElt.onclick = function () {
            updateTeacher();
            var tid = document.getElementById("updateUid");
            var tname = document.getElementById("updateName");
            tid.value = "";
            tname.value = "";
        }
        var initPwdBtnElt = document.getElementById("initPwdBtn");
        initPwdBtnElt.onclick = function () {
            TeacherInitialPwd();
            var tid = document.getElementById("InitialPwdUid");
            tid.value = "";
        }
        var deleteTerBtnElt = document.getElementById("deleteTerBtn");
        deleteTerBtnElt.onclick = function () {
            deleteTeacher();
            document.getElementById("deleteUid").value = "";
        }
        var inputCidElt = document.getElementById("inputCid");
        var inputCnameElt = document.getElementById("inputCname");
        var inputCidSpanElt = document.getElementById("inputCidSpan");
        var inputCnameSpanElt = document.getElementById("inputCnameSpan");
        var majorSelectElt = document.getElementById("majorSelect");
        var addClassBtnElt = document.getElementById("addClassBtn");
        inputCidElt.onfocus = function () {
            inputCidSpanElt.innerText = "";
        }
        inputCnameElt.onfocus = function () {
            inputCnameSpanElt.innerText = "";
        }
        inputCidElt.onblur = function () {
            var cidElt = inputCidElt.value;
            cidElt.trim();
            if (cidElt == ""){
                inputCidSpanElt.innerText = "班级ID不能为空";
            }
        }
        inputCnameElt.onblur = function () {
            var cnameElt = inputCnameElt.value;
            cnameElt.trim();
            if (cnameElt == ""){
                inputCnameSpanElt.innerText = "班级名称不能为空";
            }
        }
        var majorValue = "";
        majorSelectElt.onchange = function () {
            majorValue = majorSelectElt.value;
        }
        addClassBtnElt.onclick = function () {
            $.ajax({
                url:"admin/insertClass",
                type:"post",
                data:{
                    cid:inputCidElt.value,
                    classname:inputCnameElt.value,
                    mid:majorValue
                },
                dataType:"json",
                success:function (resp) {
                    if (resp == 1){
                        alert("添加成功");
                        inputCidElt.value = "";
                        inputCnameElt.value = "";
                        majorSelectElt.value = "";
                    }else if(resp == 0){
                        alert("该班级已存在");
                    }else {
                        alert("请选择专业");
                    }

                }
            })
        }
        var updateCidElt = document.getElementById("updateCid");
        var updateCnameElt = document.getElementById("updateCname");
        var updateCidSpanElt = document.getElementById("updateCidSpan");
        var updateCnameSpanElt = document.getElementById("updateCnameSpan");
        var updateClsBtnElt = document.getElementById("updateClsBtn");
        updateCidElt.onfocus = function () {
            updateCidSpanElt.innerText = "";
        }
        updateCnameElt.onfocus = function () {
            updateCnameSpanElt.innerText = "";
        }
        updateCidElt.onblur = function () {
            var cidValue = updateCidElt.value;
            cidValue.trim();
            if (cidValue == ""){
                updateCidSpanElt.innerText = "班级ID不能为空";
            }
        }
        updateCnameElt.onblur = function () {
            var cnameValue = updateCnameElt.value;
            cnameValue.trim();
            if (cnameValue == ""){
                updateCnameSpanElt.innerText = "班级名称不能为空";
            }
        }
        updateClsBtnElt.onclick = function () {
            $.ajax({
                url:"admin/updateClass",
                data:{
                    cid:updateCidElt.value,
                    classname:updateCnameElt.value
                },
                success:function (resp) {
                    if (resp == 1){
                        alert("修改成功");
                    }else {
                        alert("没有该班级");
                    }
                }
            })
        }
        var deleteClsElt = document.getElementById("deleteCid");
        var deleteCidSpanElt = document.getElementById("deleteCidSpan");

        document.getElementById("deleteClsBtn").onclick = function () {
            $.ajax({
                url:"admin/deleteClass",
                data:{
                    cid:deleteClsElt.value
                },
                success:function (resp) {
                    if (resp == 1){
                        alert("删除成功");
                    }else {
                        alert("没有该班级");
                    }
                }
            })
        }
        var teacherCourseIDElt = document.getElementById("teacherCourseID");
        var teacherCourseIDSpanElt = document.getElementById("teacherCourseIDSpan");
        var teacherIDToCourseElt = document.getElementById("teacherIDToCourse");
        var teacherIDToCourseSpanElt = document.getElementById("teacherIDToCourseSpan");
        var CIDToCourseElt = document.getElementById("CIDToCourse");
        var CIDToCourseSpanElt = document.getElementById("CIDToCourseSpan");
        var addTeacherAndCourseElt = document.getElementById("addTeacherAndCourse");
        teacherCourseIDElt.onfocus = function () {
            teacherCourseIDSpanElt.innerText = "";
        }
        teacherIDToCourseElt.onfocus = function () {
            teacherIDToCourseSpanElt.innerText = "";
        }
        CIDToCourseElt.onfocus = function () {
            CIDToCourseSpanElt.innerText = "";
        }
        teacherCourseIDElt.onblur = function () {
            var teacherCourseIDValue = teacherCourseIDElt.value;
            teacherCourseIDValue.trim();
            if (teacherCourseIDValue == ""){
                teacherCourseIDSpanElt.innerText = "课程ID不能为空";
            }
        }
        teacherIDToCourseElt.onblur = function () {
            var teacherIDToCourseValue = teacherIDToCourseElt.value;
            teacherIDToCourseValue.trim();
            if (teacherIDToCourseValue == ""){
                teacherIDToCourseSpanElt.innerText = "教师ID不能为空";
            }
        }
        CIDToCourseElt.onblur = function () {
            var CIDToCourseValue = CIDToCourseElt.value;
            CIDToCourseValue.trim();
            if (CIDToCourseValue == ""){
                CIDToCourseSpanElt.innerText = "班级ID不能为空";
            }
        }
        addTeacherAndCourseElt.onclick = function () {
            teacherCourseIDElt.focus();
            teacherCourseIDElt.blur();
            teacherIDToCourseElt.focus();
            teacherIDToCourseElt.blur();
            CIDToCourseElt.focus();
            CIDToCourseElt.blur();
            if (teacherCourseIDSpanElt.innerText == "" && teacherIDToCourseSpanElt.innerText == ""
                    && CIDToCourseSpanElt.innerText == ""){
                $.ajax({
                    url:"admin/insertLecture",
                    data:{
                        tid:teacherIDToCourseElt.value,
                        cid:CIDToCourseElt.value,
                        crid:teacherCourseIDElt.value
                    },
                    dataType:"json",
                    success:function (resp) {
                        if (resp == 1){
                            teacherIDToCourseElt.value = "";
                            CIDToCourseElt.value = "";
                            teacherCourseIDElt.value = "" ;
                            alert("添加成功");
                        }else if (resp == 2){
                            alert("该教师不存在");
                            teacherIDToCourseElt.value = "";
                        } else if (resp == 3){
                            alert("该课程不存在");
                            teacherCourseIDElt.value = "" ;
                        } else if (resp == 4){
                            alert("该班级不存在");
                            CIDToCourseElt.value = "";
                        }
                        else {
                            alert("已有该课程");
                        }

                    }
                })
            }

        }
        var deleteteacherCourseIDElt = document.getElementById("deleteteacherCourseID");
        var deleteteacherCourseIDSpanElt = document.getElementById("deleteteacherCourseIDSpan");
        var deleteteacherIDToCourseElt = document.getElementById("deleteteacherIDToCourse");
        var deleteteacherIDToCourseSpanElt = document.getElementById("deleteteacherIDToCourseSpan");
        var dCIDToCourseElt = document.getElementById("dCIDToCourse");
        var dCIDToCourseSpanElt = document.getElementById("dCIDToCourseSpan");
        var deleteTeacherForCourseElt = document.getElementById("deleteTeacherForCourse");
        deleteteacherCourseIDElt.onfocus = function () {
            deleteteacherCourseIDSpanElt.innerText = "";
        }
        deleteteacherIDToCourseElt.onfocus = function () {
            deleteteacherIDToCourseSpanElt.innerText = "";
        }
        dCIDToCourseElt.onfocus = function () {
            dCIDToCourseSpanElt.innerText = "";
        }
        deleteteacherCourseIDElt.onblur = function () {
            var values = deleteteacherCourseIDElt.value;
            values.trim();
            if (values == ""){
                deleteteacherCourseIDSpanElt.innerText = "课程ID不能为空";
            }
        }
        deleteteacherIDToCourseElt.onblur = function () {
            var values = deleteteacherIDToCourseElt.value;
            values.trim();
            if (values == ""){
                deleteteacherIDToCourseSpanElt.innerText = "教师ID不能为空";
            }
        }
        dCIDToCourseElt.onblur = function () {
            var values = dCIDToCourseElt.value;
            values.trim();
            if (values == ""){
                dCIDToCourseSpanElt.innerText = "班级ID不能为空";
            }
        }
        deleteTeacherForCourseElt.onclick = function () {
            deleteteacherCourseIDElt.focus();
            deleteteacherCourseIDElt.blur();
            deleteteacherIDToCourseElt.focus();
            deleteteacherIDToCourseElt.blur();
            dCIDToCourseElt.focus();
            dCIDToCourseElt.blur();
            if (dCIDToCourseSpanElt.innerText == "" && deleteteacherIDToCourseSpanElt.innerText == ""
                    && deleteteacherCourseIDSpanElt.innerText == ""){
                $.ajax({
                    url:"admin/deleteLecture",
                    type:"post",
                    data:{
                        tid:deleteteacherIDToCourseElt.value,
                        cid:dCIDToCourseElt.value,
                        crid:deleteteacherCourseIDElt.value
                    },
                    dataType:"json",
                    success:function (resp) {
                        if (resp == 1){
                            deleteteacherCourseIDElt.value = "";
                            deleteteacherIDToCourseElt.value = "";
                            dCIDToCourseElt.value = "" ;
                            alert("删除成功");
                        }else if (resp == 2){
                            alert("该教师不存在");
                            deleteteacherIDToCourseElt.value = "";
                        } else if (resp == 3){
                            alert("该课程不存在");
                            deleteteacherCourseIDElt.value = "" ;
                        } else if (resp == 4){
                            alert("该班级不存在");
                            dCIDToCourseElt.value = "";
                        }
                        else {
                            alert("没有授课信息");
                        }
                    }
                })
            }

        }
        var noticetitleElt = document.getElementById("noticetitle");
        var noticetitleSpanElt = document.getElementById("noticetitleSpan");
        var ncontentElt = document.getElementById("ncontent");
        var ncontentSpanElt = document.getElementById("ncontentSpan");
        var noticepowerElt = document.getElementById("noticepower");
        noticetitleElt.onfocus = function () {
            noticetitleSpanElt.innerText = "";
        }
        ncontentElt.onfocus = function () {
            ncontentSpanElt.innerText = "";
        }
        noticetitleElt.onblur = function () {
            var values = noticetitleElt.value;
            values.trim();
            if (values == ""){
                noticetitleSpanElt.innerText = "公告标题不能为空";
            }
        }
        ncontentElt.onblur = function () {
            var values = ncontentElt.value;
            values.trim();
            if (values == ""){
                ncontentSpanElt.innerText = "公告内容不能为空";
            }
        }
        var noticePowerValue = "";
        noticepowerElt.onchange = function () {
            noticePowerValue = noticepowerElt.value;
        }
        document.getElementById("addNoticeBtn").onclick = function () {
            noticetitleElt.focus();
            noticetitleElt.blur();
            ncontentElt.focus();
            ncontentElt.blur();
            if (ncontentSpanElt.innerText == "" && noticetitleSpanElt.innerText == ""){
                $.ajax({
                    url:"admin/insertNotice",
                    type:"post",
                    data:{
                        ntitle:noticetitleElt.value,
                        ncontent:ncontentElt.value,
                        power:noticePowerValue
                    },
                    success:function () {
                        alert("添加成功");
                        noticepowerElt.value = "";
                    }
                })
            }
        }
        var CourseIDElt = document.getElementById("CourseID");
        var CourseIDSpanElt = document.getElementById("CourseIDSpan");
        var CourseNameElt = document.getElementById("CourseName");
        var CourseNameSpanElt = document.getElementById("CourseNameSpan");
        var CourseToMajorElt = document.getElementById("CourseToMajor");
        var addCourseBtnElt = document.getElementById("addCourseBtn");
        CourseIDElt.onfocus = function () {
            CourseIDSpanElt.innerText = "";
        }
        CourseNameElt.onfocus = function () {
            CourseNameSpanElt.innerText = "";
        }
        CourseIDElt.onblur = function () {
            var values = CourseIDElt.value;
            values.trim();
            if (values == ""){
                CourseIDSpanElt.innerText = "课程ID不能为空";
            }
        }
        CourseNameElt.onblur = function () {
            var values = CourseIDElt.value;
            values.trim();
            if (values == ""){
                CourseNameSpanElt.innerText = "课程ID不能为空";
            }
        }
        var courseToMajorValue = ""
        CourseToMajorElt.onchange = function () {
            courseToMajorValue = CourseToMajorElt.value;
        }
        addCourseBtnElt.onclick = function () {
            CourseIDElt.focus();
            CourseIDElt.blur();
            CourseNameElt.focus();
            CourseNameElt.blur();
            if (CourseNameSpanElt.innerText == "" && CourseIDSpanElt.innerText == ""){
                $.ajax({
                    url:"admin/insertCourse",
                    type:"post",
                    data:{
                        crid:CourseIDElt.value,
                        crname:CourseNameElt.value,
                        mid:courseToMajorValue
                    },
                    success:function (resp) {
                        if(resp == 1){
                            CourseIDElt.value = "";
                            CourseNameElt.value = "";
                            CourseToMajorElt.value = "";
                            alert("添加成功");
                        }else {
                            alert("该课程已存在");
                        }
                    }
                })
            }
        }
        var updatenoticeidElt = document.getElementById("updatenoticeid");
        var updatenoticetitleElt = document.getElementById("updatenoticetitle");
        var updatencontentElt = document.getElementById("updatencontent");
        document.getElementById("updateNoticeBtn").onclick = function () {
            $.ajax({
                url:"admin/updateNotice",
                type:"post",
                data:{
                    noticeid:updatenoticeidElt.value,
                    ntitle:updatenoticetitleElt.value,
                    ncontent:updatencontentElt.value
                },
                success:function (resp) {
                    if (resp == 1){
                        updatenoticeidElt.value = "";
                        updatenoticetitleElt.value = "";
                        updatencontentElt.value = "";
                        alert("修改成功");
                    }else {
                        alert("该公告不存在");
                    }
                }
            })
        }

        var oldpasswordElt = document.getElementById("oldpassword");
        var newpassword = document.getElementById("newpassword");
        var updatePwdBtn = document.getElementById("updatePwdBtn");
        var adminUidElt = document.getElementById("adminUid");
        var adminUidValue = adminUidElt.value;
        updatePwdBtn.onclick = function () {
            $.ajax({
                url:"admin/updateAdmin",
                type:"post",
                data:{
                    uid:adminUidValue,
                    oldPassword:oldpasswordElt.value,
                    newPassword:newpassword.value
                },
                success:function (resp) {
                    if (resp == 1){
                        oldpasswordElt.value = "";
                        newpassword.value = "";
                        alert("修改成功");
                    }else {
                        alert("旧密码错误");
                    }
                }
            })
        }
    })

    var findAllTeacher = function (x) {
        var btnarrayElt = document.getElementById("btnarray");

        $.ajax({
            url:"admin/allTeacher",
            type:"post",
            data:{
                page:x
            },
            dataType:"json",
            success:function (resp) {
                // var ss =[];
                var ss = eval(resp)
                var teacherarray = [];
                teacherarray = ss.list;
                var tlength = teacherarray.length;
                var pageElt = tlength%10;
                var pages = 0;
                if (pageElt != 0){
                    pages = tlength/10+1;
                }else {
                    pages = tlength/10;
                }
                var html = "";
                for (var i = 0;i < teacherarray.length;i++){
                    var teacher = teacherarray[i];
                    var today = new Date().getTime();
                    var birthday = new Date(teacher.tbirthday).getTime();
                    var age = Math.ceil((today-birthday)/31536000000);
                    html += "<tr>";
                    html += "<td>"+(i+1)+"</td>";
                    html += "<td>"+teacher.tid+"</td>";
                    html += "<td>"+teacher.tname+"</td>";
                    html += "<td>"+teacher.tsex+"</td>";
                    html += "<td>"+age+"</td>";
                    html += "<td>"+teacher.password+"</td>";
                    html += "</tr>";
                }
                var teacherInfo = document.getElementById("teacherBody");
                teacherInfo.innerHTML = html;
                var btnHtml = "";
                btnHtml += "<li><a href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
                for (var i = 1;i <= pages;i++){
                    btnHtml += "<li><a>"+i+"</a></li>";
                }
                btnHtml += "<li><a href=\"#\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
                btnarrayElt.innerHTML = btnHtml;
            }
        })
    }
    var addTeacher = function () {
        var teacherId = document.getElementById("inputUid");
        var teacherName = document.getElementById("inputName");
        var tsex1 = document.getElementById("man");
        var tsex2 = document.getElementById("woman");
        var teacherBirthday = document.getElementById("inputbirthday");
        var teacherPassword = document.getElementById("inputpassword");
        var sexTrue ="";
        if (tsex1.checked == true){
            sexTrue = tsex1.value;
        }else if (tsex2.checked == true){
            sexTrue = tsex2.value;
        }
        var teacherIdValue = teacherId.value;
        var teacherNameValue = teacherName.value;
        var teacherBirthdayValue = teacherBirthday.value;

        $.ajax({
            url:"admin/insertTeacher",
            type:"post",
            data:{
                uid:teacherIdValue,
                tname:teacherNameValue,
                tsex:sexTrue,
                date:teacherBirthdayValue
            },
            dataType:"json",
            success:function (response) {
                if (response == 1){
                    alert("添加成功")
                }else if (response == 2){
                    alert("该用户已存在")
                }
            }
        })
    }
    var updateTeacher = function () {
        var teacherId = document.getElementById("updateUid");
        var teacherName = document.getElementById("updateName");
        teacherIdValue = teacherId.value;
        teacherNameValue = teacherName.value;
        $.ajax({
            url:"admin/updateTeacher",
            type:"post",
            data:{
                "tid":teacherIdValue,
                "tname":teacherNameValue
            },
            dataType:"json",
            success:function (resp) {
                if (resp == 0){
                    alert("没有该用户");
                }else {
                    alert("修改成功")
                }
            }
        })
    }
    var TeacherInitialPwd = function () {
        var teacherId = document.getElementById("InitialPwdUid");
        teacherIdValue = teacherId.value;
        $.ajax({
            url:"admin/updateInitialPwd",
            type:"post",
            data:{
                "uid":teacherIdValue,
            },
            success:function (response) {
                if (response == 1){
                    alert("修改成功")
                }else {
                    alert("没有该用户")
                }
            }
        })
    }
    var deleteTeacher = function () {
        var teacherId = document.getElementById("deleteUid");
        teacherIdValue = teacherId.value;
        $.ajax({
            url:"admin/deleteTeacher",
            type:"post",
            data:{
                "tid":teacherIdValue
            },
            success:function (response) {
                if (response == 1){
                    alert("删除成功")
                }else {
                    alert("没有该用户")
                }
            }
        })
    }
    var findAllClass = function () {
        var classBodyElt = document.getElementById("classBody");
        var classPageElt = document.getElementById("classPage");
        $.ajax({
            url:"admin/findAllClass",
            dataType:"json",
            success:function (resp) {
                var classJson = [];
                classJson = eval(resp);
                var classJsonLength = classJson.length;
                var pageElt = classJsonLength%10;
                var pages = 0;
                if (pageElt != 0){
                    pages = classJsonLength/10+1;
                }else {
                    pages = classJsonLength/10;
                }
                var html = "";
                for (var i = 0;i < classJson.length;i++){
                    var classElt = classJson[i];
                    html += "<tr>";
                    html += "<td>"+classElt.cid+"</td>";
                    html += "<td>"+classElt.classname+"</td>";
                    html += "<td>"+classElt.majorname+"</td>";
                    html += "</tr>";
                }
                classBodyElt.innerHTML = html;
                var classPageHtml = "";
                classPageHtml = "<li><a href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
                for (var i = 1;i <= pages;i++){
                    classPageHtml += "<li><a>"+i+"</a></li>";
                }
                classPageHtml += "<li><a href=\"#\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
                classPageElt.innerHTML = classPageHtml;
            },
            error:function () {
                alert("error")
            }
        })
    }
    var findAllCourse = function () {
        var courseBodyElt = document.getElementById("courseBody");
        var coursePagesElt = document.getElementById("coursePages");
        $.ajax({
            url:"admin/findAllCourse",
            dataType:"json",
            success:function (resp) {
                var courseArray = [];
                courseArray = eval(resp);
                var courseLength = courseArray.length;
                var pageElt = courseLength%10;
                var pages = 0;
                if (pageElt != 0){
                    pages = courseLength/10+1;
                }else {
                    pages = courseLength/10;
                }
                var html = "";
                for (var i = 0;i < courseArray.length;i++){
                    var course = courseArray[i];
                    html += "<tr>";
                    html += "<td>"+course.crid+"</td>";
                    html += "<td>"+course.crname+"</td>";
                    html += "<td>"+course.majorname+"</td>";
                    html += "</tr>";
                }
                courseBodyElt.innerHTML = html;
                var coursePageHtml = "";
                coursePageHtml = "<li><a href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
                for (var i = 1;i <= pages;i++){
                    coursePageHtml += "<li><a>"+i+"</a></li>";
                }
                coursePageHtml += "<li><a href=\"#\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
                coursePagesElt.innerHTML = coursePageHtml;
            }
        })
    }
    var findTeacherCrouse = function () {
        var courseBodyElt = document.getElementById("teacherAllCruBody");
        var coursePagesElt = document.getElementById("allTeacherCruPages");
        $.ajax({
            url:"admin/findAllLecture",
            dataType:"json",
            success:function (resp) {
                var allCourse = [];
                allCourse = eval(resp);
                var courseLength = allCourse.length;
                var pageElt = courseLength%10;
                var pages = 0;
                if (pageElt != 0){
                    pages = courseLength/10+1;
                }else {
                    pages = courseLength/10;
                }
                var html = "";
                for (var i = 0;i < allCourse.length;i++){
                    var course = allCourse[i];
                    html += "<tr>";
                    html += "<td>"+course.tid+"</td>";
                    html += "<td>"+course.crname+"</td>";
                    html += "<td>"+course.classname+"</td>";
                    html += "</tr>";
                }
                courseBodyElt.innerHTML = html;
                var coursePageHtml = "";
                coursePageHtml = "<li><a href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
                for (var i = 1;i <= pages;i++){
                    coursePageHtml += "<li><a>"+i+"</a></li>";
                }
                coursePageHtml += "<li><a href=\"#\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
                coursePagesElt.innerHTML = coursePageHtml;
            }
        })
    }
    var findLectureByTid = function () {
        var courseBodyElt = document.getElementById("teacherAllCruBody");
        var coursePagesElt = document.getElementById("allTeacherCruPages");
        var teacherCourseSelectElt = document.getElementById("teacherCourseSelect");
        $.ajax({
            url:"admin/findAllLectureByTid",
            data:{
                tid:teacherCourseSelectElt.value
            },
            dataType:"json",
            success:function (resp) {
                if (resp != null){
                    var allCourse = [];
                    allCourse = eval(resp);
                    var courseLength = allCourse.length;
                    var pageElt = courseLength%10;
                    var pages = 0;
                    if (pageElt != 0){
                        pages = courseLength/10+1;
                    }else {
                        pages = courseLength/10;
                    }
                    var html = "";
                    for (var i = 0;i < allCourse.length;i++){
                        var course = allCourse[i];
                        html += "<tr>";
                        html += "<td>"+course.tid+"</td>";
                        html += "<td>"+course.crname+"</td>";
                        html += "<td>"+course.classname+"</td>";
                        html += "</tr>";
                    }
                    courseBodyElt.innerHTML = html;
                    var coursePageHtml = "";
                    coursePageHtml = "<li><a href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
                    for (var i = 1;i <= pages;i++){
                        coursePageHtml += "<li><a>"+i+"</a></li>";
                    }
                    coursePageHtml += "<li><a href=\"#\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
                    coursePagesElt.innerHTML = coursePageHtml;
                }else {
                    alert("没有该教师")
                }

            }
        })
    }
    var findAllNoticeBtn = function () {
        var noticeBodyElt = document.getElementById("noticeBody");
        var noticePagesElt= document.getElementById("noticePages");
        $.ajax({
            url:"admin/findAllNotice",
            type:"post",
            dataType:"json",
            success:function (resp) {
                var noticeArray = [];
                noticeArray = eval(resp);
                var noticeLength = noticeArray.length;
                var pageElt = noticeLength%10;
                var pages = 0;
                if (pageElt != 0){
                    pages = noticeLength/10+1;
                }else {
                    pages = noticeLength/10;
                }
                var html = "";
                for (var i = 0;i < noticeArray.length;i++){
                    var notice = noticeArray[i];
                    var noticeTime =new Date(notice.ntime) ;
                    var year = noticeTime.getFullYear();
                    var month = noticeTime.getMonth();
                    var day = noticeTime.getDate();
                    var ntime = year + "年" + (month+1) + "年" + day + "日";

                    html += "<tr>";
                    html += "<td>"+notice.noticeid+"</td>";
                    html += "<td><a href=\"admin/noticeInfo?noticeid="+notice.noticeid+"\">"+notice.ntitle+"</a></td>";
                    html += "<td>"+ntime+"</td>";
                    html += "</tr>";
                }
                noticeBodyElt.innerHTML = html;
                var noticePageHtml = "";
                noticePageHtml = "<li><a href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
                for (var i = 1;i <= pages;i++){
                    noticePageHtml += "<li><a>"+i+"</a></li>";
                }
                noticePageHtml += "<li><a href=\"#\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
                noticePagesElt.innerHTML = noticePageHtml;
            }
        })
    }
    var findOneNotice = function () {
        var oneNoticeTitleElt = document.getElementById("oneNoticeTitle");
        var noticeBodyElt = document.getElementById("noticeBody");
        var noticePagesElt= document.getElementById("noticePages");
        $.ajax({
            url:"admin/findNoticeLike",
            type:"post",
            data:{
                ntitle:oneNoticeTitleElt.value
            },
            dataType:"json",
            success:function (resp) {
                if (resp != null){
                    var noticeArray = [];
                    noticeArray = eval(resp);
                    var noticeLength = noticeArray.length;
                    var pageElt = noticeLength%10;
                    var pages = 0;
                    if (pageElt != 0){
                        pages = noticeLength/10+1;
                    }else {
                        pages = noticeLength/10;
                    }
                    var html = "";
                    for (var i = 0;i < noticeArray.length;i++){
                        var notice = noticeArray[i];
                        var noticeTime =new Date(notice.ntime) ;
                        var year = noticeTime.getFullYear();
                        var month = noticeTime.getMonth();
                        var day = noticeTime.getDate();
                        var ntime = year + "年" + (month+1) + "年" + day + "日";
                        html += "<tr>";
                        html += "<td>"+notice.noticeid+"</td>";
                        html += "<td><a href=\"admin/noticeInfo?noticeid="+notice.noticeid+"\">"+notice.ntitle+"</td>";
                        html += "<td>"+ntime+"</td>";
                        html += "</tr>";
                    }
                    noticeBodyElt.innerHTML = html;
                    var noticePageHtml = "";
                    noticePageHtml = "<li><a href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
                    for (var i = 1;i <= pages;i++){
                        noticePageHtml += "<li><a>"+i+"</a></li>";
                    }
                    noticePageHtml += "<li><a href=\"#\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
                    noticePagesElt.innerHTML = noticePageHtml;
                }else {
                    alert("没有该公告");
                }

            }
        })



    }
</script>
</html>
