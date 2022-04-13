<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/4/10
  Time: 17:46
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
                    <input type="hidden" id="testSno" value="${myself}">
                    <input type="hidden" id="stuPwd" value="${password}">
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
                            .<strong>（${list.correct}分）</strong>${list.title}()
                        </p>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block" value="A">A.${list.optiona}</p>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block" value="B">B.${list.optionb}</p>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block" value="C">C.${list.optionc}</p>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block" value="D">D.${list.optiond}</p>
                    </div>
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
                        </p>
                    </div>
                    <div class="col-md-2 col-md-offset-1">
                        <p><input type="checkbox" style="display: inline-block" value="true">A.正确</p>
                    </div>
                    <div class="col-md-2 ">
                        <p><input type="checkbox" style="display: inline-block" value="false">B.错误</p>
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
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <textarea style="resize: none;width: 1000px;height: 300px;margin-bottom: 40px"></textarea>
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
        var testSnoElt = document.getElementById("testSno");
        var stuPwdElt = document.getElementById("stuPwd");
        var overBtnElt = document.getElementById("overBtn");
        overBtnElt.onclick = function () {
            writeAnswer();
            // alert(testSnoElt.value+"==="+stuPwdElt.value)
            window.location.href = "http://localhost:8080/denglu?uid="+testSnoElt.value+"&pwd="+stuPwdElt.value;
        }
    })
    var writeAnswer = function () {
        var myAnswer = [];
        var qidArray = [];
        var checkBoxInput = $(":checkbox");
        for (var i = 0;i <checkBoxInput.length;i++){
            if (checkBoxInput[i].checked == true){
                myAnswer.push(checkBoxInput[i].value);
            }
        }
        var textareaAnswer = $("textarea");
        for (var i = 0;i < textareaAnswer.length;i++){
            myAnswer.push(textareaAnswer[i].value);
        }

        var hiddenInput = $(".questionID");
        for (var i = 0;i < hiddenInput.length;i++){
            qidArray.push(hiddenInput[i].value);
        }
        var testidElt = document.getElementById("testID");
        var testSnoElt = document.getElementById("testSno");

        alert(testidElt.value+"==="+testSnoElt.value)
        $.ajax({
            url:"/student/writeTestPaper",
            type:"post",
            traditional:true,
            data:{
                sno:testSnoElt.value,
                testid:testidElt.value,
                qid:qidArray,
                myanswer:myAnswer
            },
            success:function (resp) {
                if (resp == 1){
                    alert("success")
                }
            }
        })
    }
</script>
</html>
