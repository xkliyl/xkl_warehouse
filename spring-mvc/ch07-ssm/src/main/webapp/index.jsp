<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()+"://"+
            request.getServerName()+":"+request.getServerPort()
            +request.getContextPath()+"/";
%>
<html>
<html>
<head>
    <title>功能入口</title>
    <base href="<%=basePath%>"/>
</head>
<body>
    <div align="center">
        <p>SSM 整合的例子</p>
        <img src="static/images/sakura.jpg"/>
        <table>
            <tr>
                <td><a href="addStudent.jsp">注册学生</a> </td>
            </tr>
            <tr>
                <td><a href="listStudnet.jsp">浏览学生</a> </td>
            </tr>
        </table>
    </div>


</body>
</html>
