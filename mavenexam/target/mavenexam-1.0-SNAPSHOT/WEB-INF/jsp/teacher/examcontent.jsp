<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/4/10
  Time: 0:16
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
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-md-offset-4">
                <h2><input type="hidden" id="testID" value="${paperList[0].testid}">
                    <input type="hidden" id="testSno" value="${paperList[0].sno}">
                    ${paperList[0].testtitle}
                </h2>
            </div>
            <div class="col-md-10 col-md-offset-1">
                <h3>一、选择题</h3>
            </div>
            <c:forEach items="${paperList}" var="list" varStatus="count">
                <c:if test="${list.questiontype == '选择题'}">
                    <div class="col-md-11 col-md-offset-1">
                        <p><span class="glyphicon glyphicon-asterisk"></span>
                            <input type="hidden" class="questionID" value="${list.qid}">
                            .<strong>（${list.correct}分）</strong>${list.title}
                            <input type="hidden" class="myAnswerInput" value="${list.myanswer}">(${list.myanswer})
                        </p>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block" >A.${list.optiona}</p>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block" >B.${list.optionb}</p>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block" >C.${list.optionc}</p>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block" >D.${list.optiond}</p>
                    </div>
                    <input type="hidden" id="myAnswer" value="${list.myanswer}">
                </c:if>
            </c:forEach>
            <div class="col-md-10 col-md-offset-1">
                <h3>二、判断题</h3>
            </div>
            <c:forEach items="${paperList}" var="list" varStatus="count">
                <c:if test="${list.questiontype == '判断题'}">
                    <div class="col-md-11 col-md-offset-1">
                        <p><span class="glyphicon glyphicon-asterisk"></span>
                            <input type="hidden" class="questionID" value="${list.qid}">
                            .<strong>（${list.correct}分）</strong>${list.title}
                            <input type="hidden" class="myAnswerInput" value="${list.myanswer}">(${list.myanswer})

                        </p>
                    </div>
                    <div class="col-md-2 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block">A.正确</p>
                    </div>
                    <div class="col-md-2 ">
                        <p><input type="checkbox" style="display: inline-block">B.错误</p>
                    </div>
                </c:if>
            </c:forEach>
            <div class="col-md-10 col-md-offset-1">
                <h3>三、简答题</h3>
            </div>
            <c:forEach items="${paperList}" var="list" varStatus="count">
                <c:if test="${list.questiontype == '简答题'}">
                    <div class="col-md-11 col-md-offset-1">
                        <p><span class="glyphicon glyphicon-asterisk"></span>
                            <input type="hidden" class="questionID" value="${list.qid}">
                            .<strong>（${list.correct}分）</strong>${list.title}</p>
                        <label><span>分数</span><input type="text" class="grade" value=""></label>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <textarea style="resize: none;width: 1000px;height: 300px;margin-bottom: 40px">
                            ${list.myanswer}
                        </textarea>
                    </div>
                </c:if>
            </c:forEach>
            <div class="col-md-2 col-md-offset-6">
                <input type="button" id="overBtn"   style="margin-bottom: 100px" value="完成">
            </div>
        </div>
    </div>

</body>
<script type="text/javascript">
    $(function () {
        var qidElt = document.getElementsByClassName("questionID");
        var qidArray = [];
        for (var i = 0;i < qidElt.length;i++){
            var qidValue = qidElt[i].value;
            qidArray.push(qidValue);
        }
        var overBtnElt = document.getElementById("overBtn");
        overBtnElt.onclick = function () {
            var gradeElt = document.getElementsByClassName("grade");
            var values = "";
            var gradeArray = [];
            for (var i = 0;i < gradeElt.length;i++){
                var gradeValue = gradeElt[i].value;
                gradeArray.push(gradeValue);
            }
            submitGrade(qidArray,gradeArray);
            //window.history.back();
            self.location = document.referrer

        }

    })
    var submitGrade = function (qidArray,gradeArray) {
        var testIDElt = document.getElementById("testID");
        var testSnoElt = document.getElementById("testSno");
        $.ajax({
            url:"/teacher/reviewStudentTest",
            type:"post",
            traditional:true,
            data:{
                testid:testIDElt.value,
                sno:testSnoElt.value,
                qid:qidArray,
                correct:gradeArray
            },
            success:function (resp) {
                 alert("批改完成")
            },
            error:function () {
                alert("error")
            }
        })
    }

</script>
</html>
