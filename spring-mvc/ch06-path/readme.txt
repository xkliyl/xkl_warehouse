ch06-path:解决jsp页面中的路径问题，用"/"还是不用

在jsp，html页面中使用的地址都是在前端页面中的地址，都是相对地址
地址分类：
1.绝对地址，带有协议名称的是绝对地址：http://www.baidu.com
2.相对地址，没有协议开头的，例如user/some.do,/user/some.do
            相对地址不能单独使用，必须有一个参考地址，通过参考地址+相对地址本身才能指定资源。
3.参考地址
    当地址没有斜杠开头，例如 user/some.do,访问点击链接时，访问地址是当前页面的地址加上连接的地址
加”/“和不加他们的参考地址会变化，相差一个项目名称
加”/“路径访问问题处理，<a href="${pageContext.request.contextPath}/user/some.do">发起user/some.do的get请求</a>
${pageContext.request.contextPath},可以代表项目名称那部分路径
4.base标签，是html语言中的标签，表示当前页面中访问的地址的基地址
    页面中所有不以”/“开头的地址，都是以base标签中的地址为参考地址
    使用base中的地址+user/some.do