<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/3/13
  Time: 12:00
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

        .container-fluid > div > ul > li > a {
            list-style: none;
            color: #000000;
        }

        .container-fluid > div > ul > li > ul > li > a {
            list-style: none;
            color: #000000;
        }

        body {
            overflow-x: hidden;
        }

        a {
            color: #0f0f0f;
        }

    </style>

</head>
<body>
<input type="hidden" id="studentUid" value="<%String uid=request.getParameter("uid");
        out.print(uid);%>">
<input type="hidden" id="studentpwd" value="<%String password=request.getParameter("password");
        out.print(password);%>">
<div class="container-fluid">
    <div class="row">
        <ul id="leftUl" class="nav nav-stacked list-unstyled col-md-1"
            style="background: #b8b7b6;padding: 0px;height: 634px;">
            <li><a id="classManger" href="#findAllCls" aria-controls="findAllCls" data-toggle="tab">我的考试<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="classMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="allClass" href="#findAllCls" onclick="studentFindCourse()" aria-controls="findAllCls" data-toggle="tab">未答试卷</a></li>
                    <li><a id="relaseClass" href="#relasetest" onclick="findCourseHistory()" aria-controls="relasetest" data-toggle="tab">历史试卷成绩</a>
                    </li>
                </ul>
            </li>
            <li><a id="myself" href="#findAllStu" aria-controls="findAllStu" data-toggle="tab">个人信息<span
                    class="caret"></span></a>
                <ul class="list-unstyled" hidden="hidden" id="myselfMangerMenu"
                    style="background-color:#eeeaea;color: #3e3b3b">
                    <li><a id="myselfinfo" href="#findAllStu" aria-controls="findAllStu" data-toggle="tab">我的个人信息</a>
                    </li>
                    <li><a id="updatemyself" href="#updatemyselfinfo" aria-controls="updatemyselfinfo"
                           data-toggle="tab">修改密码</a>
                    </li>
                </ul>
            </li>
            <li><a id="noticeManger" href="#findAllNot" aria-controls="findAllNot" data-toggle="tab">公告</a></li>

        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="findAllCls">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>课程ID</td>
                                <td>课程</td>
                                </thead>
                                <tbody id="classBody">

                                </tbody>
                            </table>
                        </div>
                        <div class="modal fade" id="mytestpaper" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4>试卷</h4>
                                    </div>
                                    <div class="modal-body" id="testDiv">

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
            <div class="tab-pane" id="relasetest">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>课程ID</td>
                                <td>课程</td>
                                </thead>
                                <tbody id="courseHistoryBody">

                                </tbody>
                            </table>
                        </div>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">试卷</h4>
                                    </div>
                                    <div class="modal-body">
                                        <table class="tab table-striped table-hover" style="width:500px">
                                            <thead>
                                            <td>试卷名称</td>
                                            <td>成绩</td>
                                            </thead>
                                            <tbody id="historyTestBody">

                                            </tbody>
                                        </table>
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

            <div class="tab-pane" id="findAllStu">
                <div class="container-fluid">
                    <div class="row" style="margin-top: 10px">
                        <div class="col-md-2 col-md-offset-1" style="background-color: #aeb0b2">
                            <label>学号</label>
                        </div>
                        <div class="col-md-2" style="background-color: #b8b7b6">
                            <label>41802211</label>
                        </div>
                        <div class="col-md-2" style="background-color: #aeb0b2">
                            <label>姓名</label>
                        </div>
                        <div class="col-md-3" style="background-color: #b8b7b6">
                            <label>李牧子</label>
                        </div>
                        <div class="col-md-2 col-md-offset-1" style="background-color: #aeb0b2">
                            <label>性别</label>
                        </div>
                        <div class="col-md-2" style="background-color: #b8b7b6">
                            <label>女</label>
                        </div>
                        <div class="col-md-2 " style="background-color: #aeb0b2">
                            <label>年龄</label>
                        </div>
                        <div class="col-md-3" style="background-color: #b8b7b6">
                            <label>20</label>
                        </div>
                        <div class="col-md-2 col-md-offset-1" style="background-color: #aeb0b2">
                            <label>班级</label>
                        </div>
                        <div class="col-md-2" style="background-color: #b8b7b6">
                            <label>18级计算机科学01班</label>
                        </div>
                        <div class="col-md-2 " style="background-color: #aeb0b2">
                            <label>专业</label>
                        </div>
                        <div class="col-md-3" style="background-color: #b8b7b6">
                            <label>计算机科学与技术</label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane" id="findAllNot">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1" style="margin-top: 10px">
                            <input type="text" placeholder="公告标题" style="width: 400px">
                            <button style="width: 40px;height: 25px"><span class="glyphicon glyphicon-search" style="font-size: 8px"></span></button>
                        </div>
                        <div class="col-md-10 col-md-offset-1">
                            <table class="tab table-striped table-hover" style="width:1000px">
                                <thead>
                                <td>序号</td>
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
            <div class="tab-pane" id="updatemyselfinfo">
                <div class="row">
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="teacherID" class="col-md-2 control-label" style="margin-top: 10px">旧密码</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="teacherID" placeholder="旧密码">
                        </div>
                    </div>
                    <div class="form-group col-md-8" style="margin-top: 10px;">
                        <label for="teacherpassword" class="col-md-2 control-label" style="margin-top: 10px">新密码</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="teacherpassword" placeholder="新密码">
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
</body>
<script type="text/javascript">
    $(function () {
        var studentUidElt = document.getElementById("studentUid");
        var classMangerElt = document.getElementById("classManger");
        var noticeMangerElt = document.getElementById("noticeManger");
        var myselfElt = document.getElementById("myself");

        var classMangerMenuElt = document.getElementById("classMangerMenu");
        var myselfMenuElt = document.getElementById("myselfMangerMenu");
        studentFindCourse();
        classMangerElt.onclick = function () {
            studentFindCourse();
            if (classMangerMenuElt.hidden == true) {
                classMangerMenuElt.hidden = false;
            }
            myselfMenuElt.hidden = true;
        }

        noticeMangerElt.onclick = function () {
            findNotice();
            classMangerMenuElt.hidden = true;
            myselfMenuElt.hidden = true;
        }
        myselfElt.onclick = function () {
            if (myselfMenuElt.hidden == true) {
                myselfMenuElt.hidden = false;
            }
            classMangerMenuElt.hidden = true;

        }
    })
    var studentFindCourse = function () {
        var studentUidElt = document.getElementById("studentUid");
        var classBodyElt = document.getElementById("classBody");
        $.ajax({
            url: "student/findStudentCourse",
            type: "post",
            data: {
                sno:studentUidElt.value
            },
            success:function (resp) {
                var courseArray = [];
                courseArray = eval(resp);
                var html = "";
                for (var i = 0;i < courseArray.length;i++){
                    html +="<tr>";
                    html +="<td>"+courseArray[i].crid+"</td>";
                    html +='<td><a onclick="myCrid(\''+courseArray[i].crid+'\')" data-toggle=\"modal\" data-target=\"#mytestpaper\">'+courseArray[i].crname+'</a></td>';
                    html +="</tr>";
                }
                classBodyElt.innerHTML = html;
            }
        })
    }
    var myCrid = function (x) {
        var studentUidElt = document.getElementById("studentUid");
        var studentpwdElt = document.getElementById("studentpwd");
        $.ajax({
            url:"student/findNoDoTestPaper",
            type: "post",
            data: {
                sno:studentUidElt.value,
                crid:x
            },
            success:function (resp) {
                var testDivElt = document.getElementById("testDiv");
                var tests = [];
                tests = eval(resp);
                var html = "";
                for (var i = 0;i < tests.length;i++){
                    html +="<a href=\"student/testContent?sno="+studentUidElt.value+"&pwd="+studentpwdElt.value+"&testid="+tests[i].testid+"\">"+tests[i].testtitle+"</a>";
                }
                testDivElt.innerHTML = html;
            }
        })
    }
    var findCourseHistory = function () {
        var studentUidElt = document.getElementById("studentUid");
        var courseHistoryBodyElt = document.getElementById("courseHistoryBody");
        $.ajax({
            url:"student/findStudentCourse",
            type:"post",
            data:{
                sno:studentUidElt.value
            },
            success:function (resp) {
                var courselist = [];
                courselist = eval(resp);
                var html = "";
                for (var i = 0;i < courselist.length;i++){
                    html +="<tr>";
                    html +="<td>"+courselist[i].crid+"</td>";
                    html +='<td><a onclick="findHistoryTest(\''+courselist[i].crid+"\',\'"+studentUidElt.value+'\')" data-toggle=\"modal\" data-target=\"#myModal\">'+courselist[i].crname+'</a></td>';
                    html +="</tr>";
                }
                courseHistoryBodyElt.innerHTML = html;
            }
        })
    }

    var findHistoryTest = function (crid,sno) {
        var historyTestBodyElt = document.getElementById("historyTestBody");
        $.ajax({
            url:"student/findCompleteTest",
            type:"post",
            data:{
                crid:crid,
                sno:sno
            },
            success:function (resp) {
                var myTest = [];
                myTest = eval(resp);
                var html = "";
                for (var i = 0;i < myTest.length;i++){
                    html +="<tr>";
                    html +="<td>"+myTest[i].testtitle+"</td>";
                    html +="<td>"+myTest[i].grade+"</td>";
                    html +="</tr>";
                }
                historyTestBodyElt.innerHTML = html;
            },
            error:function () {
                alert("error")
            }
        })
    }
    var findNotice = function () {
        var noticeBodyElt = document.getElementById("noticeBody");
        var noticePagesElt= document.getElementById("noticePages");
        var studentUidElt = document.getElementById("studentUid");
        $.ajax({
            url:"student/studentFindNotice",
            type:"post",
            data:{
                sno:studentUidElt.value
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
