ch07-ssm:SSM整合开发
SSM：SpringMVC+Spring+MyBatis
SpringMVC:界面层，视图层，负责接收请求，显示处理结果。
Spring:业务层，管理service，dao，工具类对象
MyBatis:持久层，访问数据库

用户发起请求--使用SpirngMVC接受请求--Spring中的Service对象----MyBatis处理数据

整合中容器
1.SpringMVC容器，管理Controller控制器对象的
2.Spring容器，管理Service和Dao和工具类对象的
我们要做的是把使用的对象要交给合适的容器创建，管理，把Controller和web开发的相关对象
    交给SpringMVC容器，这些web用的对象写在SpringMVC配置文件中
service，dao，对象定义在spring的配置文件中，让spring管理这些对象。
springmvc容器和spring容器是有关系的，已经确定好了
springmvc容器是spring容器的子容器，类似Java的继承，但不等于。子可以访问父的内容
在子容器中的Controller对象可以访问父容器的Service对象，就可以实现controller使用service对象
实现步骤：
0.使用spring的MySQL数据库，表使用user
1.新建maven web项目，
2.加入依赖
    springmvc，spring，mybatis三个框架的依赖，jackson依赖，mysql驱动，druid连接池
    jsp，servlet依赖
3.写web.xml文件
    1）注册DispatcherServlet，目的：1.创建springmvc的容器对象，才能创建Controller类的对象。
                                  2.创建的是Servlet，才能接收用户的请求。
    2）注册spring的监听器，ContextLoaderListener，目的：创建spring容器对象，才能创建service，dao对象
    3）注册字符集过滤器，解决post请求乱码的问题
4.创建包，controller包，service，dao，实体类包名
5.写springmvc，spring，mybatis的配置文件
    1）springmvc配置文件
    2）spring配置文件
    3）mybatis配置文件
    4）数据库的属性配置文件
6.写代码，dao接口和mapper文件，service和实现类，controller，实体类
7.写jsp页面