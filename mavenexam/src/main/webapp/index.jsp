<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script type="text/javascript" src="/static/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="static/css/bootstrap.min.css"/>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
    <style type="text/css">
        span{
            color: #ff0000;
            font-size: 12px;
        }
        body{
            background: #91d4ee;
        }
        #loginDiv{
            margin-top: 200px;

        }
        input{
            margin:10px 10px;

        }
    </style>
    <script type="text/javascript">
        $(function () {
            //获取用户名和密码的组件
            var usernameElt = document.getElementById("username");
            var passwordElt = document.getElementById("password");

            //用户名的正则表达式
            var UserRegExp = /^[4a-z][a-z0-9]{3,20}[a-z|0-9]$/
            //密码的正则表达式
            var pwdRegExp = /^[a-zA-Z0-9][a-zA-Z0-9.]{1,20}[a-zA-Z0-9.]$/
            //获取用户名后的span标签
            var userSpanElt = document.getElementById("userSpan");
            //获取密码后的span标签
            var pwdSpanElt = document.getElementById("pwdSpan");
            usernameElt.onblur = function(){
                var username = usernameElt.value;
                username = username.trim();

                if (username != ""){
                    var flag = UserRegExp.test(username);
                    if (!flag){
                        userSpanElt.innerText = "用户名为字母或数字4开头，只能使用数字和字母，长度为5-22";
                    }
                }else {
                    userSpanElt.innerText = "用户名不能为空";
                }
            }
            usernameElt.onfocus = function () {
                userSpanElt.innerText = "";
            }

            passwordElt.onblur = function () {
                password = passwordElt.value;
                password = password.trim();

                if (password != ""){
                    var flag = pwdRegExp.test(password);
                    if (!flag){
                        pwdSpanElt.innerText = "密码格式错误";
                    }
                }else{
                    pwdSpanElt.innerText = "密码不能为空";
                }

            }
            passwordElt.onfocus = function () {
                pwdSpanElt.innerText = "";
            }

            $("#login").click(function () {
                usernameElt.focus();
                usernameElt.blur();

                passwordElt.focus();
                passwordElt.blur();
                if (userSpanElt.innerText == "" && pwdSpanElt.innerText == ""){
                    var loginElt = document.getElementById("login");
                    var loginFormElt = document.getElementById("loginForm");
                    loginFormElt.action = "http://localhost:8080/denglu"
                    // window.location.href = "http://localhost:8080/denglu?uid="+usernameElt.value+"&pwd="+passwordElt.value;
                    loginFormElt.submit();
                }
            })

        })


    </script>
</head>
<body>

<div class="container" id="loginDiv">

    <div class="row">
        <h2 class="col-md-4 col-md-offset-5" >考试系统登录</h2>
        <div class="col-md-4 col-sm-4 col-lg-4 col-md-offset-4" style="background: #1cbbea;height: 200px">
            <form method="post" id="loginForm" class="form-control form-search " style="margin:20px 0; height: 150px;">
                <label class="sr-only" for="username"></label>
                <input type="text" id="username" name="uid" placeholder="用户名"/><span id="userSpan" ></span><br>
                <label class="sr-only" for="password"></label>
                <input type="password" id="password" name="pwd" placeholder="密码"/><span id="pwdSpan"></span><br>
                <label class="sr-only" for="login"></label>
                <input class="btn btn-primary" type="button" id="login" value="登录">


            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

</script>
</html>
