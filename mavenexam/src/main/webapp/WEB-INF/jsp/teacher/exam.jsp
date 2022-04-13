<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/4/9
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</head>
<body>
<%String cid = request.getParameter("cid");
    String crid = request.getParameter("crid");
    String tid = request.getParameter("tid");%>
<input type="hidden" id="mytid" value="<%=tid%>">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <table class="tab table-striped table-hover" style="width:1000px">
                    <thead>
                    <td>学号</td>
                    <td>姓名</td>
                    <td>试卷名称</td>
                    <td>分数</td>
                    <td>操作</td>
                    </thead>
                    <tbody id="gradeBody">
                        <c:forEach items="${testPaperList}" var="test1">
                            <tr>
                                <td>${test1.sno}</td>
                                <td>${test1.sname}</td>
                                <td>${test1.testtitle}</td>
                                <td>${test1.grade}</td>
                                <td>
                                    <a href="http://localhost:8080/teacher/findTeacherTestPaper?sno=${test1.sno}&testid=${test1.testid}&tid=<%=tid%>">打分</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-md-2 col-md-offset-5">
                <input type="button" value="返回" id="backBtn">
            </div>
        </div>
    </div>
<input type="hidden" id="teacherUid" value="${teacherUid}">
<input type="hidden" id="teacherPwd" value="${password}">
</body>
<script type="text/javascript">
    $(function () {
        document.getElementById("backBtn").onclick = function () {
            var teacherUidElt = document.getElementById("teacherUid");
            var teacherPwd = document.getElementById("teacherPwd");
            window.location.href = "http://localhost:8080/denglu?uid="+teacherUidElt.value+"&pwd="+teacherPwd.value;
        }

    })
    var backHome = function () {


    }
</script>
</html>
