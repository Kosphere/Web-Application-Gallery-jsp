<%@ page import="vo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title></title>
</head>
<body>
<header>
<div class="container">
    <div class="row align-items-center justify-content-around" style="margin: 20px">
        <div class="col-sm-4 text-center">
            <section>
                <h2>在线博物馆</h2>
                <p><i>marvelous</i></p>
            </section>
        </div>
        <div class="col-sm-6">
            <div class="nav nav-justified">
                <div class="col-sm">
                    <div class="nav-item">
                        <a class="nav-link disabled" href="#">搜索</a>
                    </div>
                </div>
                <% Object headerPermission = session.getAttribute("permission");
                User headerUser = (User)session.getAttribute("user");
                if (headerPermission == null || (Integer)headerPermission < 1) {%>
                <div class="col-sm">
                    <div class="nav-item">
                        <a class="nav-link disabled" href="Login.jsp">登录</a>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="nav-item">
                        <a class="nav-link disabled" href="Register.jsp">注册</a>
                <%} else {%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span><%= headerUser.getUsername()%>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">个人中心</a></li>
                        <li><a href="#">好友</a></li>
                        <li><a href="#">收藏夹</a></li>
                        <li><a href="#">信箱</a></li>
                        <li class="divider"></li>
                        <li><a href="#">退出登录</a></li>
                    </ul>
                </li>
                <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</header>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
