<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()+"://"+
            request.getServerName()+":"+request.getServerPort()
            +request.getContextPath()+"/";
%>
<html>
<head>
    <title>查询学生ajax</title>
    <base href="<%=basePath%>"/>
    <script type="text/javascript" src="static/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //在当前页面dom对象加载后，执行loadStudentData（）
            loadStudentData();
            $("#btnLoader").click(function () {

                loadStudentData();
            })
        })
        function loadStudentData() {
            $.ajax({
                url:"queryStudent",
                type:"get",
                dataType:"json",
                success:function (resp) {
                    //清楚旧的数据
                    $("#info").html("");
                    //增加新的数据
                    $.each(resp,function (i,n) {
                        $("#info").append("<tr>")
                            .append("<td>"+n.id+"</td>")
                            .append("<td>"+n.name+"</td>")
                            .append("<td>"+n.age+"</td>")
                            .append("</tr>")

                    })
                }
            })
        }
    </script>
</head>
<body>
    <div align="center">
        <table>
            <thead>
                <tr>
                    <td>学号</td>
                    <td>姓名</td>
                    <td>年龄</td>
                </tr>
            </thead>
            <tbody id="info">

            </tbody>
        </table>
        <input type="button" id="btnLoader" value="查询数据">
    </div>

</body>
</html>
