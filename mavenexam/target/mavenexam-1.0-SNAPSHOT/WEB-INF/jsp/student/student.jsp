<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生</title>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="static/css/bootstrap.min.css"/>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid" style="padding: 0">
        <div class="row" style="background:#aeb0b2;width: 1394px">
            <div class="col-md-2">
                <h3 style="color: #0a0a0a;margin-left: 10px;font-family: 'Microsoft Himalaya'">课程考试系统</h3>
            </div>
            <div class="col-md-2 col-md-offset-6" style="margin-top: 20px;margin-right: -17px">
                <div class="row">
                    <div class="col-md-9 col-md-offset-3">
                        <a style="text-decoration: none;color: #0a0a0a;">
                            <span class="glyphicon glyphicon-user" style="margin-top: 2px;color: #0a0a0a;"></span>
                            欢迎你，<span id="username" value="">${status.username}</span>
                        </a>
                    </div>
                </div>

            </div>
            <div class="col-md-2" style="margin-top: 20px;">
                <div class="row">
                    <div class="col-md-4">
                        <a style="text-decoration: none;color: #0a0a0a;" >
                            <span class="glyphicon glyphicon-cog" style="font-size:2px;color: #0a0a0a; "></span>
                            设置
                        </a>
                    </div>
                    <div class="col-md-6">
                        <a style="text-decoration: none;color: #0a0a0a;" href="index.jsp">
                            <span class="glyphicon glyphicon-share-alt" style="color: #0a0a0a;"></span>
                            退出系统
                        </a>
                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="left.jsp">
            <jsp:param name="uid" value="${status.uid}"/>
            <jsp:param name="password" value="${status.password}"/>
        </jsp:include>
    </div>
</body>
</html>
