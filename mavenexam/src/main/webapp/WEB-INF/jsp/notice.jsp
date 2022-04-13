<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/4/5
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title text-center">${oneNotice.ntitle}</h3>
            </div>
            <div class="panel-body">
                ${oneNotice.ncontent}

            </div>
        </div>
    </div>
</body>
</html>
