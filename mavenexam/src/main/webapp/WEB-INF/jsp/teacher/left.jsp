<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/3/13
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
                   data-toggle="tab">试题管理<span class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="teacherMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="allTeacher" onclick="findAllQuestion()" href="#findAllTer" aria-controls="findAllTer" data-toggle="tab">所有试题</a></li>
                    <li><a id="addTeacher" href="#addTer" aria-controls="addTer" data-toggle="tab">新增试题</a></li>
                    <li><a id="updateTeacher" href="#updateTer" aria-controls="updateTer" data-toggle="tab">修改试题</a></li>
                    <li><a id="deleteTeacher" href="#dleteTer" aria-controls="deleteTer" data-toggle="tab">删除试题</a></li>
                </ul>
            </li>
            <li><a id="classManger" href="#findAllCls" aria-controls="findAllCls" data-toggle="tab">试卷管理<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="classMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="allClass" href="#findAllCls" aria-controls="findAllCls"  data-toggle="tab">所有试卷</a></li>
                    <li><a id="relaseClass" href="#relasetest" aria-controls="relasetest" data-toggle="tab">已发布试卷</a></li>
                    <li><a id="addClass" onclick="findTeachingClass()" href="#addCls" aria-controls="addCls" data-toggle="tab">新增试卷</a></li>
                    <li><a id="deleteClass" href="#dleteCls" aria-controls="deleteCls" data-toggle="tab">删除试卷</a></li>
                </ul>
            </li>
            <li><a id="studentManger" href="#findAllStu" aria-controls="findAllStu" data-toggle="tab">学生管理<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="studentMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="findAllStudent" onclick="findMyTeachingClass()" href="#findAllStu" aria-controls="findAllStu" data-toggle="tab">所有学生</a></li>
                    <li><a id="StuInitialPwdTeacher" href="#StuInitialPwd" aria-controls="StuInitialPwd" data-toggle="tab">恢复学生初始密码</a></li>
                </ul>
            </li><li><a id="correctTest" href="#correctStudentTest" onclick="findClassAndExam()" aria-controls="correctStudentTest" data-toggle="tab">考试管理<span
                class="caret"></span></a>
            <ul class="list-unstyled" hidden="hidden" id="correctTestMenu"
                style="background-color:#eeeaea;color: #3e3b3b">
                <li><a id="correctClassTest" href="#correctStudentTest" aria-controls="correctStudentTest" data-toggle="tab">批改试卷</a>
                </li>
            </ul>
        </li>
            <li><a id="noticeManger" href="#findAllNot" aria-controls="findAllNot" data-toggle="tab">公告管理<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="noticeMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="findAllNotice" href="#findAllNot" onclick="findAllNoticeBtn()" aria-controls="findAllNot" data-toggle="tab">所有公告</a>
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
                                <td>题目ID</td>
                                <td>题目</td>
                                </thead>
                                <tbody id="questionBodyBtn">
                                
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-5 col-md-offset-4">
                            <nav aria-label="Page navigation">
                                <ul class="pagination" id="questionPages">
                                    
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
                            <label for="inputName" class="col-md-2 control-label">题目</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="inputName" placeholder="题目">
                                <input type="text" placeholder="分数" style="width: 50px" id="questionMark"></br>
                                <select style="margin-top: 10px" id="questionTypeOption">
                                    <option value="">--请选择题目类型--</option>
                                    <option value="选择题" href="#choose">选择题</option>
                                    <option value="判断题" href="#decide">判断题</option>
                                    <option value="简答题" href="#Briefanswer">简答题</option>
                                </select>
                            </div>
                            <div class="col-md-12" id="questionTypeDiv">

                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="answer" class="col-md-2 control-label" style="margin-top: 10px">正确答案</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="answer" placeholder="正确答案">
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1" >
                            <input type="button" value="添加题目" id="addQuestionBtn"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="updateTer">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="updateQid" class="col-md-2 control-label">题目ID</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateQid" placeholder="题目ID">
                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="inputName" class="col-md-2 control-label">题目</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateQName" placeholder="题目">
                                <input type="text" placeholder="分数" style="width: 50px" id="updateMark"></br>
                                <select style="margin-top: 10px" id="updateQuestionOption">
                                    <option value="">--请选择题目类型--</option>
                                    <option value="选择题" href="#choose">选择题</option>
                                    <option value="判断题" href="#decide">判断题</option>
                                    <option value="简答题" href="#Briefanswer">简答题</option>
                                </select>
                            </div>
                            <div class="col-md-12" id="updateQuestionDiv">

                            </div>
                        </div>
                        <div class="form-group col-md-8" style="margin-top: 10px;">
                            <label for="answer" class="col-md-2 control-label" style="margin-top: 10px">正确答案</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="updateAnswer" placeholder="正确答案">
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-1">
                            <input type="button" id="updateQuestionBtn" value="修改题目"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="dleteTer">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="deleteUid" class="col-md-2 control-label" style="margin-top: 10px">题目ID</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="deleteUid" placeholder="题目ID">
                        </div>
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" onclick="deleteTeacher()" value="删除题目" style="margin-top: 7px"/>
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
                                <td>试卷ID</td>
                                <td>试卷标题</td>
                                <td>操作</td>
                                </thead>
                                <tbody id="allExamBody">
                                </tbody>
                            </table>
                        </div>
                        <div class="modal fade" id="myPublish" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="publish">发布试卷</h4>
                                    </div>
                                    <div class="modal-body" id="classListDiv">
                                        <select id="classSelect">

                                        </select>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary" id="publishOK">确认</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="relasetest">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <h3>已发布试卷</h3>
                        </div>
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>试卷ID</td>
                                <td>试卷标题</td>
                                <td>班级</td>
                                <td>操作</td>
                                </thead>
                                <tbody id="noReleaseExam">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="addCls">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="form-group col-md-8" style="margin-top: 10px;">
                                <label for="addTestid" class="col-md-2 control-label" style="margin-top: 10px">试卷ID</label>
                                <div class="col-md-5">
                                    <input type="text" class="form-control" id="addTestid" placeholder="试卷ID">
                                </div>
                            </div>
                            <div class="form-group col-md-8" style="margin-top: 10px;">
                                <label for="inputTestname" class="col-md-2 control-label" style="margin-top: 10px">试卷标题</label>
                                <div class="col-md-5">
                                    <input type="text" class="form-control" id="inputTestname" placeholder="试卷标题">
                                </div>
                            </div>
                            <div class="form-group col-md-8" style="margin-top: 10px;">
                                <label for="addTestid" class="col-md-2 control-label" style="margin-top: 10px">课程</label>
                                <div class="col-md-5">
                                    <select id="myTeacheingClass">

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-8 col-md-offset-1" >
                                <input type="button" value="新增试卷" id="addTestAndQuestion" data-toggle="modal" data-target="#mytest"/>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="mytest" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myquestion">添加题目</h4>
                                        </div>
                                        <div class="modal-body" id="questionDiv">

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button type="button" class="btn btn-primary" id="addQuestion">确认</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="dleteCls">
                <div class="row">
                    <div class="form-group col-md-8 " style="margin-top: 10px;">
                        <label for="deleteCid" class="col-md-2 control-label" style="margin-top: 10px;">试卷ID</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control"  id="deleteCid" placeholder="试卷ID">
                        </div>
                        <div class="col-md-2 col-md-offset-1">
                            <input type="button" onclick="deleteTestByTestid()" value="删除试卷" style="margin-top: 7px"/>
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
                                <td>班级ID</td>
                                <td>班级名称</td>
                                </thead>
                                <tbody id="myTeachingClassBody">

                                </tbody>
                            </table>
                        </div>
                        <div class="modal fade" id="myStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <label><input type="text" placeholder="学号">
                                            <button style="width: 40px;height: 25px;" ><span class="glyphicon glyphicon-search"></span></button></label>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-10">
                                                <table class="tab table-striped table-hover" style="width:500px">
                                                    <thead>
                                                    <td>学号</td>
                                                    <td>姓名</td>
                                                    </thead>
                                                    <tbody id="classToStudentBody">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
            <div class="tab-pane" id="correctStudentTest">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>班级名称</td>
                                <td>课程名称</td>
                                <td>试卷名称</td>
                                <td>操作</td>
                                </thead>
                                <tbody id="classExamBody">

                                </tbody>
                            </table>
                        </div>
                        <div class="modal fade" id="myStudentTest" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-10">
                                                <table class="tab table-striped table-hover" style="width:500px">
                                                    <thead>
                                                    <td>序号</td>
                                                    <td>试卷标题</td>
                                                    </thead>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <%--                                        <button type="button" class="btn btn-primary">Save changes</button>--%>
                                    </div>
                                </div>
                            </div>
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
                            <input type="button" onclick="addTeacher()" value="修改公告"/>
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
                            <label >教师ID</label>
                        </div>
                        <div class="col-md-2" style="background-color: #b8b7b6">
                            <label>wanghong</label>
                        </div>
                        <div class="col-md-2" style="background-color: #aeb0b2">
                            <label >姓名</label>
                        </div>
                        <div class="col-md-3" style="background-color: #b8b7b6">
                            <label>王红</label>
                        </div>
                        <div class="col-md-2 col-md-offset-1"style="background-color: #aeb0b2">
                            <label>性别</label>
                        </div>
                        <div class="col-md-2" style="background-color: #b8b7b6">
                            <label>女</label>
                        </div>
                        <div class="col-md-2 "style="background-color: #aeb0b2">
                            <label>年龄</label>
                        </div>
                        <div class="col-md-3" style="background-color: #b8b7b6">
                            <label>33</label>
                        </div>

                    </div>
                </div>
            </div>
            <div class="tab-pane" id="updatemyselfinfo">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="StuInitialPwdUid" class="col-md-2 control-label" style="margin-top: 10px">旧密码</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="oldpwd" placeholder="旧密码">
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
                            <input type="button" onclick="TeacherInitialPwd()" value="修改密码" style="margin-top: 7px"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<input type="hidden" id="teacherUid" value="<%String uid=request.getParameter("uid");
        out.print(uid);%>">
<input type="hidden" id="teacherPwd" value="<%String pwd = request.getParameter("password");
        out.print(pwd);%>">
</body>
<script type="text/javascript">
    $(function () {
        var teacherUidElt = document.getElementById("teacherUid");

        var teacherMangerElt = document.getElementById("teacherManger");
        var classMangerElt = document.getElementById("classManger");
        var studentMangerElt = document.getElementById("studentManger");
        var noticeMangerElt = document.getElementById("noticeManger");
        var correctTestElt = document.getElementById("correctTest");
        var myselfElt = document.getElementById("myself");

        var teacherMangerMenuElt = document.getElementById("teacherMangerMenu");
        var classMangerMenuElt = document.getElementById("classMangerMenu");
        var studentMangerMenuElt = document.getElementById("studentMangerMenu");
        var noticeMangerMenuElt = document.getElementById("noticeMangerMenu");
        var correctTestMenyElt = document.getElementById("correctTestMenu");
        var myselfMenuElt = document.getElementById("myselfMangerMenu");
        findAllQuestion();

        teacherMangerElt.onclick = function () {
            findAllQuestion();
            if (teacherMangerMenuElt.hidden == true){
                teacherMangerMenuElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;
            studentMangerMenuElt.hidden = true;
            noticeMangerMenuElt.hidden = true;
            correctTestMenyElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        classMangerElt.onclick = function () {
            findAllExam(teacherUidElt.value);
            if (classMangerMenuElt.hidden == true) {
                classMangerMenuElt.hidden = false;
            }
            studentMangerMenuElt.hidden = true;
            noticeMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            correctTestMenyElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        studentMangerElt.onclick = function () {
            findMyTeachingClass();
            if (studentMangerMenuElt.hidden == true) {
                studentMangerMenuElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;
            noticeMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            correctTestMenyElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        correctTestElt.onclick = function(){
            findClassAndExam();
            if (correctTestMenyElt.hidden == true){
                correctTestMenyElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;
            noticeMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            studentMangerMenuElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        noticeMangerElt.onclick = function () {
            findAllNoticeBtn()
            if (noticeMangerMenuElt.hidden == true) {
                noticeMangerMenuElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;
            studentMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            correctTestMenyElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        myselfElt.onclick = function () {
            if (myselfMenuElt.hidden == true){
                myselfMenuElt.hidden = false;
            }
            noticeMangerMenuElt.hidden = true;
            classMangerMenuElt.hidden = true;
            studentMangerMenuElt.hidden = true;
            teacherMangerMenuElt.hidden = true;
            correctTestMenyElt.hidden = true;
        }


        var inputNameElt = document.getElementById("inputName");
        var questionMarkElt = document.getElementById("questionMark");
        var questionTypeOptionElt = document.getElementById("questionTypeOption");
        var questionTypeDiv = document.getElementById("questionTypeDiv");
        var answerElt = document.getElementById("answer");
        var addQuestionBtn = document.getElementById("addQuestionBtn");
        var questionTypeOptionValue = "";
        questionTypeOptionElt.onchange = function () {
            var optionHtml = ""
            questionTypeOptionValue = questionTypeOptionElt.value;
            if (questionTypeOptionElt.value == "选择题"){
                optionHtml += "<div class=\"row\" style=\"margin-left: 100px;margin-top: 10px\">\n" +
                    "                                    <div class=\"col-md-5\"><label><span>A</span><input type=\"text\" id=\"SelectA\"></label></div>\n" +
                    "                                    <div class=\"col-md-5\"><label><span>B</span><input type=\"text\" id=\"SelectB\"></label></div>\n" +
                    "                                    <div class=\"col-md-5\"><label><span>C</span><input type=\"text\" id=\"SelectC\"></label></div>\n" +
                    "                                    <div class=\"col-md-5\"><label><span>D</span><input type=\"text\" id=\"SelectD\"></label></div>\n" +
                    "                                </div>";
                questionTypeDiv.innerHTML = optionHtml;
            }else if (questionTypeOptionElt.value == "判断题"){
                optionHtml += "<div class=\"row\" style=\"margin-left: 100px;margin-top: 10px\">" +
                    "                                    <div class=\"col-md-5\"><label><input type=\"checkbox\" id=\"checkTrue\" value=\"true\"><span>正确</span></label></div>\n" +
                    "                                    <div class=\"col-md-5\"><label><input type=\"checkbox\" id=\"checkFalse\" value=\"false\"><span>错误</span></label></div>\n" +
                    "</div>";
                questionTypeDiv.innerHTML = optionHtml;
            }else if (questionTypeOptionElt.value == "简答题"){
                optionHtml = "";
                questionTypeDiv.innerHTML = optionHtml;
            }
        }
        addQuestionBtn.onclick = function () {
            if (questionTypeOptionElt.value == "选择题"){
                var SelectAElt = document.getElementById("SelectA");
                var SelectBElt = document.getElementById("SelectB");
                var SelectCElt = document.getElementById("SelectC");
                var SelectDElt = document.getElementById("SelectD");
                $.ajax({
                    url:"teacher/insertQuestion",
                    type: "post",
                    data:{
                        questiontype:questionTypeOptionElt.value,
                        title:inputNameElt.value,
                        optiona:SelectAElt.value,
                        optionb:SelectBElt.value,
                        optionc:SelectCElt.value,
                        optiond:SelectDElt.value,
                        answer:answerElt.value,
                        correct:questionMarkElt.value,
                        power:teacherUidElt.value
                    },
                    success:function (resp) {
                        inputNameElt.value = "";
                        questionMarkElt.value = "";
                        questionTypeOptionElt.value = "";
                        questionTypeDiv.innerHTML = "";
                        alert("添加成功");
                    }
                })
            }else if (questionTypeOptionElt.value == "判断题"){
                var checkTrueElt = document.getElementById("checkTrue");
                var checkFalseElt = document.getElementById("checkFalse");
                var rightAnswer = "";
                if (checkTrueElt.checked == true){
                    rightAnswer = checkTrueElt.value;
                }else if (checkFalseElt.checked == true){
                    rightAnswer = checkFalseElt.value;
                }
                $.ajax({
                    url:"teacher/insertQuestion",
                    type: "post",
                    data:{
                        questiontype:questionTypeOptionElt.value,
                        title:inputNameElt.value,
                        optiona:checkTrueElt.value,
                        optionb:checkFalseElt.value,
                        answer:rightAnswer,
                        correct:questionMarkElt.value,
                        power:teacherUidElt.value
                    },
                    success:function (resp) {
                        inputNameElt.value = "";
                        questionMarkElt.value = "";
                        questionTypeOptionElt.value = "";
                        questionTypeDiv.innerHTML = "";
                        alert("添加成功");
                    }
                })
            }else if (questionTypeOptionElt.value == "简答题"){
                $.ajax({
                    url:"teacher/insertQuestion",
                    type: "post",
                    data:{
                        questiontype:questionTypeOptionElt.value,
                        title:inputNameElt.value,
                        correct:questionMarkElt.value,
                        power:teacherUidElt.value
                    },
                    success:function (resp) {
                        inputNameElt.value = "";
                        questionMarkElt.value = "";
                        questionTypeOptionElt.value = "";
                        questionTypeDiv.innerHTML = "";
                        alert("添加成功");
                    }
                })
            }
        }

        var updateQidElt = document.getElementById("updateQid");
        var updateQNameElt = document.getElementById("updateQName");
        var updateMarkElt = document.getElementById("updateMark");
        var updateQuestionOptionElt = document.getElementById("updateQuestionOption");
        var updateQuestionDivElt = document.getElementById("updateQuestionDiv");
        var updateAnswerElt = document.getElementById("updateAnswer");
        var updateQuestionBtnElt = document.getElementById("updateQuestionBtn");
        updateQidElt.onblur = function () {
            var values = updateQidElt.value;
            values.trim();
            if (values != ""){
                $.ajax({
                    url:"teacher/findOneQuestion",
                    type:"post",
                    data:{
                        qid:values,
                        power:teacherUidElt.value
                    },
                    success:function (resp) {
                        var ques = eval(resp);
                        updateQNameElt.value = ques.title;
                        updateMarkElt.value = ques.correct;
                        var optionHtml = "";
                        if (ques.questiontype == "选择题"){
                            updateQuestionOptionElt.value = "选择题";
                            optionHtml += "<div class=\"row\" style=\"margin-left: 100px;margin-top: 10px\">\n" +
                                "<div class=\"col-md-5\"><label><span>A</span><input type=\"text\" id=\"updateSelectA\" value=\""+ques.optiona+"\"></label></div>\n" +
                                "<div class=\"col-md-5\"><label><span>B</span><input type=\"text\" id=\"updateSelectB\" value=\""+ques.optionb+"\"></label></div>\n" +
                                "<div class=\"col-md-5\"><label><span>C</span><input type=\"text\" id=\"updateSelectC\" value=\""+ques.optionc+"\"></label></div>\n" +
                                "<div class=\"col-md-5\"><label><span>D</span><input type=\"text\" id=\"updateSelectD\" value=\""+ques.optiond+"\"></label></div>\n" +
                                "</div>";
                            updateQuestionDivElt.innerHTML = optionHtml;
                            updateAnswerElt.value = ques.answer;
                        }else if (ques.questiontype == "判断题"){
                            updateQuestionOptionElt.value = "判断题";
                            optionHtml += "<div class=\"row\" style=\"margin-left: 100px;margin-top: 10px\">" +
                                "                                    <div class=\"col-md-5\"><label><input type=\"checkbox\" id=\"updateCheckTrue\" value=\"true\"><span>正确</span></label></div>\n" +
                                "                                    <div class=\"col-md-5\"><label><input type=\"checkbox\" id=\"updateCheckFalse\" value=\"false\"><span>错误</span></label></div>\n" +
                                "</div>";
                            updateQuestionDivElt.innerHTML = optionHtml;
                            if (ques.answer == "true"){
                                document.getElementById("updateCheckTrue").checked = true;
                            }else {
                                document.getElementById("updateCheckFalse").checked = true;
                            }
                        }else {
                            updateQuestionOptionElt.value = "简答题";
                        }
                    }
                })
            }
        }
        var updateOptionChangeElt = "";
        updateQuestionOptionElt.onchange = function(){
            updateOptionChangeElt = updateQuestionOptionElt.value;
            var optionHtml = ""
            updateQuestionDivElt.innerHTML = "";
            if (updateQuestionOptionElt.value == "选择题"){
                optionHtml += "<div class=\"row\" style=\"margin-left: 100px;margin-top: 10px\">\n" +
                    "<div class=\"col-md-5\"><label><span>A</span><input type=\"text\" id=\"updateSelectA\"></label></div>\n" +
                    "<div class=\"col-md-5\"><label><span>B</span><input type=\"text\" id=\"updateSelectB\"></label></div>\n" +
                    "<div class=\"col-md-5\"><label><span>C</span><input type=\"text\" id=\"updateSelectC\"></label></div>\n" +
                    "<div class=\"col-md-5\"><label><span>D</span><input type=\"text\" id=\"updateSelectD\"></label></div>\n" +
                    "</div>";
                updateQuestionDivElt.innerHTML = optionHtml;
            }else if (updateQuestionOptionElt.value == "判断题"){
                optionHtml += "<div class=\"row\" style=\"margin-left: 100px;margin-top: 10px\">" +
                    "                                    <div class=\"col-md-5\"><label><input type=\"checkbox\" id=\"updateCheckTrue\" value=\"true\"><span>正确</span></label></div>\n" +
                    "                                    <div class=\"col-md-5\"><label><input type=\"checkbox\" id=\"updateCheckFalse\" value=\"false\"><span>错误</span></label></div>\n" +
                    "</div>";
                updateQuestionDivElt.innerHTML = optionHtml;
            }else if (updateQuestionOptionElt.value == "简答题"){
                optionHtml = "";
                questionTypeDiv.innerHTML = optionHtml;
            }
        }

        updateQuestionBtnElt.onclick = function () {
            if (updateOptionChangeElt == "选择题"){
                var updateSelectAElt = document.getElementById("updateSelectA");
                var updateSelectBElt = document.getElementById("updateSelectB");
                var updateSelectCElt = document.getElementById("updateSelectC");
                var updateSelectDElt = document.getElementById("updateSelectD");
                $.ajax({
                    url:"teacher/updateQuestion",
                    type:"post",
                    data:{
                        qid:updateQidElt.value,
                        questiontype:updateOptionChangeElt,
                        title:updateQNameElt.value,
                        optiona:updateSelectAElt.value,
                        optionb:updateSelectBElt.value,
                        optionc:updateSelectCElt.value,
                        optiond:updateSelectDElt.value,
                        answer:updateAnswerElt.value,
                        correct:updateMarkElt.value,
                        power:teacherUidElt.value
                    },
                    success:function (resp) {
                        if (resp == 1){
                            updateQidElt.value = "";
                            inputNameElt.value = "";
                            questionMarkElt.value = "";
                            questionTypeOptionElt.value = "";
                            questionTypeDiv.innerHTML = "";
                            alert("修改成功");
                        }else {
                            alert("修改失败");
                        }
                    }
                })
            }else if (updateOptionChangeElt == "判断题"){
                var updateCheckTrueElt = document.getElementById("updateCheckTrue");
                var updateCheckFalseElt = document.getElementById("updateCheckFalse");
                var updateRightCheck = "";
                if (updateCheckTrueElt.checked == true){
                    updateRightCheck = updateCheckTrueElt.value;
                }else if(updateCheckFalseElt.checked == true){
                    updateRightCheck = updateCheckFalseElt.value;
                }
                $.ajax({
                    url:"teacher/updateQuestion",
                    type:"post",
                    data:{
                        qid:updateQidElt.value,
                        questiontype:updateOptionChangeElt,
                        title:updateQNameElt.value,
                        optiona:updateCheckTrueElt.value,
                        optionb:updateCheckFalseElt.value,
                        answer:updateRightCheck,
                        correct:updateMarkElt.value,
                        power:teacherUidElt.value
                    },
                    success:function (resp) {
                        if (resp == 1){
                            updateQidElt.value = "";
                            inputNameElt.value = "";
                            questionMarkElt.value = "";
                            questionTypeOptionElt.value = "";
                            questionTypeDiv.innerHTML = "";
                            alert("修改成功");
                        }else {
                            alert("修改失败");
                        }
                    }
                })
            }else if (updateOptionChangeElt == "简答题"){
                $.ajax({
                    url:"teacher/updateQuestion",
                    type:"post",
                    data:{
                        qid:updateQidElt.value,
                        questiontype:updateOptionChangeElt,
                        title:updateQNameElt.value,
                        correct:updateMarkElt.value,
                        power:teacherUidElt.value
                    },
                    success:function (resp) {
                        if (resp == 1){
                            updateQidElt.value = "";
                            inputNameElt.value = "";
                            questionMarkElt.value = "";
                            questionTypeOptionElt.value = "";
                            questionTypeDiv.innerHTML = "";
                            alert("修改成功");
                        }else {
                            alert("修改失败");
                        }
                    }
                })
            }

        }

        document.getElementById("allClass").onclick = findAllExam(teacherUidElt.value);

        var classSelectElt = document.getElementById("classSelect");
        var optionValue = "";
        classSelectElt.onchange = function () {
            optionValue = classSelectElt.value;
        }
        var publishOKElt = document.getElementById("publishOK");
        publishOKElt.onclick = function () {
            addExamToClass(myTestId,optionValue,myCrid);
        }

        document.getElementById("relaseClass").onclick = relaseClassEltFind();
        document.getElementById("addTestAndQuestion").onclick = function () {
            testAddQuestion();
        }
        var addQuestionElt = document.getElementById("addQuestion");
        addQuestionElt.onclick = function () {
            var addTestidElt = document.getElementById("addTestid");
            var qidArray12 = [];
            //alert(qidArray[0])
            var qidElt = document.getElementsByClassName("qid");
            for (var i = 0;i < qidElt.length;i++){
                if (qidElt[i].checked == true){
                    var qidValue = qidElt[i].value
                    qidArray12.push(qidValue);
                }

            }
            addTestAndCrid();
            addQuestion(addTestidElt.value,qidArray12);
        }
    })
    var findAllQuestion = function () {
        var teacherUidElt = document.getElementById("teacherUid");
        var questionBodyBtnElt = document.getElementById("questionBodyBtn");
        var questionPagesElt = document.getElementById("questionPages");
        $.ajax({
            url:"teacher/findAllQuestion",
            type:"post",
            data:{
                power:teacherUidElt.value
            },
            success:function (resp) {
                var question = [];
                question = eval(resp);
                var tlength = question.length;
                var pageElt = tlength%10;
                var pages = 0;
                if (pageElt != 0){
                    pages = tlength/10+1;
                }else {
                    pages = tlength/10;
                }
                var html = "";
                for (var i = 0;i < question.length;i++){
                    var ques = question[i];
                    html += "<tr>";
                    html += "<td>"+ques.qid+"</td>";
                    html += "<td>"+ques.title+"</td>";
                    html += "</tr>";
                }
                questionBodyBtnElt.innerHTML = html;
                var pagesHtml = ""
                pagesHtml = "<li><a href=\"#\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
                for (var i = 1;i <= pages;i++){
                    pagesHtml += "<li><a>"+i+"</a></li>";
                }
                pagesHtml += "<li><a href=\"#\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
                questionPagesElt.innerHTML = pagesHtml;
            }
        })
        document.getElementById("allClass").onclick = findAllExam(teacherUidElt.value);

    }
    var findAllExam = function (x) {
        var allExamBodyElt = document.getElementById("allExamBody");
        $.ajax({
            url:"teacher/teacherFindAllExamination",
            dataType:"json",
            data:{
                power:x
            },
            success:function (resp) {
                var examArray = [];
                examArray = eval(resp);
                var html = ""
                for (var i = 0;i < examArray.length;i++){
                    var exam = examArray[i];
                    html += "<tr>";
                    html += "<td>"+exam.testid+"</td>";
                    html += "<td>"+exam.testtitle+"</td>";
                    html += '<td><a onclick="a(\''+exam.testid+"\',\'"+exam.crid+'\')" data-toggle=\"modal\" data-target=\"#myPublish\">发布</a></td>';
                    html += "</tr>";
                }
                allExamBodyElt.innerHTML = html;
            }
        })
    }
    var myCrid = "";
    var myTestId = "";

    var a = function (testid,crid) {

        myTestId = testid;
        myCrid = crid;
        clsAddExam(crid)
    }
    var clsAddExam = function (myCrid) {
        var teacherUidElt = document.getElementById("teacherUid");
        var classSelectElt = document.getElementById("classSelect");
        $.ajax({
            url:"admin/findLectureByTidAndCrid",
            type:"post",
            data:{
                tid:teacherUidElt.value,
                crid:myCrid
            },
            success:function (resp) {
                var classArray = eval(resp);
                var html = "";
                html +="<option value=\"\">请选择班级</option>";

                for (var i = 0;i < classArray.length;i++){

                    html += "<option value=\""+classArray[i].cid+"\">"+classArray[i].classname+"</option>";
                }
                classSelectElt.innerHTML = html;

            }
        })
    }

    var addExamToClass = function (testid,optionValue,crid) {
        var classSelectElt = document.getElementById("classSelect");
        $.ajax({
            url:"teacher/testToStudent",
            type:"post",
            data:{
                testid:testid,
                cid:optionValue,
                crid:crid
            },
            success:function (resp) {
                if (resp == 1){
                    classSelectElt.value = "";
                    alert("添加成功");
                    relaseClassEltFind();
                }else {
                    alert("该试卷已存在");
                }
            }
        })
    }
    var relaseClassEltFind = function () {
        var teacherUidElt = document.getElementById("teacherUid");
        var noReleaseExamElt = document.getElementById("noReleaseExam");
        $.ajax({
            url:"teacher/findAllTestToStudent",
            type:"post",
            data:{
                power:teacherUidElt.value
            },
            success:function (resp) {
                var tests = [];
                tests = eval(resp);
                var html = "";
                for (var i = 0;i < tests.length;i++){
                    var test = tests[i]
                    html += "<tr>";
                    html += "<td>"+test.testid+"</td>";
                    html += "<td>"+test.testtitle+"</td>";
                    html += "<td>"+test.classname+"</td>";
                    html += '<td><a onclick="findReleaseExam(\''+test.testid+"\',\'"+test.crid+"\',\'"+test.cid+'\')">取消发布</a></td>'
                    html += "</tr>";
                }
                noReleaseExamElt.innerHTML = html;
            }
        })
    }
    var findReleaseExam = function (testid,crid,cid) {
        $.ajax({
            url:"teacher/updateTestToStudent",
            type:"post",
            data:{
                testid:testid,
                crid:crid,
                cid:cid
            },
            success:function (resp) {
                alert("修改成功");
                relaseClassEltFind();
            }
        })
    }
    var findTeachingClass = function () {
        var teacherUidElt = document.getElementById("teacherUid");
        var myTeacheingClassElt = document.getElementById("myTeacheingClass");
        $.ajax({
            url:"teacher/findLectureByTidNoRepeat",
            type:"post",
            data:{
                tid:teacherUidElt.value
            },
            success:function (resp) {
                var courses = [];
                courses = eval(resp);
                var html = "";
                html += "<option value=''>请选择课程</option>"
                for (var i = 0;i < courses.length;i++){
                    html += "<option value=\""+courses[i].crid+"\">"+courses[i].crname+"</option>";
                }
                myTeacheingClassElt.innerHTML = html;
            }
        })
    }
    var addTestAndCrid = function () {
        var teacherUidElt = document.getElementById("teacherUid");
        var addTestidElt = document.getElementById("addTestid");
        var inputTestnameElt = document.getElementById("inputTestname");
        var myTeacheingClassElt = document.getElementById("myTeacheingClass");

        $.ajax({
            url:"teacher/insertExamination",
            type:"post",
            data:{
                testid:addTestidElt.value,
                title:inputTestnameElt.value,
                power:teacherUidElt.value,
                crid:myTeacheingClassElt.value
            },
            success:function () {

            }
        })
    }
    var testAddQuestion = function () {
        var teacherUidElt = document.getElementById("teacherUid");
        var questionDivElt = document.getElementById("questionDiv");
        $.ajax({
            url:"teacher/findAllQuestion",
            type:"post",
            data:{
                power:teacherUidElt.value
            },
            success:function (resp) {
               var questions = [];
               questions = eval(resp);
               var html = "";
               for (var i = 0;i < questions.length;i++){
                   html += "<input type='checkbox' class='qid' value=\""+questions[i].qid+"\"><span>"+questions[i].title+"</span>";
                   html += "<br>";
               }
                questionDivElt.innerHTML = html;
            }
        })
    }

    var addQuestion = function (testid,qid) {
        $.ajax({
            url:"teacher/insertQuestionToExamination",
            type:"post",
            traditional:true,
            data:{
                testid:testid,
                qid:qid
            },
            success:function (resp) {
                if (resp == 1){
                    alert("添加成功")
                }else {
                    //alert("error")
                }
            }
        })
    }
    var deleteTestByTestid = function () {
        var deleteCidElt = document.getElementById("deleteCid");
        $.ajax({
            url:"teacher/deleteExamination",
            type:"post",
            data:{
                testid:deleteCidElt.value
            },
            success:function () {
                alert("删除成功");
            }
        })
    }
    var findMyTeachingClass = function () {
        var teacherUidElt = document.getElementById("teacherUid");
        var myTeachingClassBodyElt = document.getElementById("myTeachingClassBody");
        $.ajax({
            url:"teacher/findAllMyTeachingClass",
            type:"post",
            data:{
                tid:teacherUidElt.value
            },
            success:function (resp) {
                var classArray = [];
                classArray = eval(resp);
                var html = "";
                for (var i = 0;i < classArray.length;i++){
                    html += "<tr>";
                    html += "<td>"+(i+1)+"</td>";
                    html += "<td>"+classArray[i].cid+"</td>";
                    html += '<td><a onclick="findMyTeachingStudents(\''+classArray[i].cid+'\')" data-toggle=\"modal\" data-target=\"#myStudent\">'+classArray[i].classname+'</a></td>';
                    html += "</tr>";
                }
                myTeachingClassBodyElt.innerHTML = html;
            }
        })
    }
    var findMyTeachingStudents = function (cid) {
        var classToStudentBodyElt = document.getElementById("classToStudentBody");
        $.ajax({
            url:"teacher/findAllClassStudent",
            type:"post",
            data:{
                cid:cid
            },
            success:function (resp) {
                var students = [];
                students = eval(resp);
                var html = "";
                for (var i = 0;i < students.length;i++){
                    html += "<tr>";
                    html += "<td>"+students[i].sno+"</td>";
                    html += "<td>"+students[i].sname+"</td>";
                    html += "</tr>";
                }
                classToStudentBodyElt.innerHTML = html;
            }
        })
    }
    var findClassAndExam = function () {
        var teacherUidElt = document.getElementById("teacherUid");
        var classExamBodyElt = document.getElementById("classExamBody");
        var teacherPwdElt = document.getElementById("teacherPwd");
        var x = teacherUidElt.value
        $.ajax({
            url:"teacher/findTestByCridAndCid",
            type:"post",
            data:{
                tid:teacherUidElt.value
            },
            success:function (resp) {
                var testArray = [];
                testArray = eval(resp);
                var html = "";
                for (var i = 0;i < testArray.length;i++){
                    html += "<tr>";
                    html += "<td>"+testArray[i].classname+"</td>";
                    html += "<td>"+testArray[i].crname+"</td>";
                    html += "<td>"+testArray[i].testtitle+"</td>";
                    html += "<td><a href=\"teacher/findTestByCid?cid="+testArray[i].cid+"&crid="+testArray[i].crid+"&testid="+testArray[i].testid+"&tid="+x+"&pwd="+teacherPwdElt.value+"\">查看</a></td>";
                    html += "</tr>";
                }
                classExamBodyElt.innerHTML = html;
            }
        })
    }
    var findAllNoticeBtn = function () {
        var teacherUidElt = document.getElementById("teacherUid");
        var noticeBodyElt = document.getElementById("noticeBody");
        var noticePagesElt= document.getElementById("noticePages");
        $.ajax({
            url:"teacher/findAllNotice",
            type:"post",
            dataType:"json",
            data:{
                power:teacherUidElt.value
            },
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
</script>
</html>
