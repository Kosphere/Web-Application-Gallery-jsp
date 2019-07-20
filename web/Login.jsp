<% session.setAttribute("url","Login.jsp"); %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container-fluid login-body">
    <div class="row">
        <div class="col-md-7"></div>
        <div class="col-md-3">
            <form class="form-horizontal login-form" action="LoginServlet" method="post">
                <div class="form-group login-form-group">
                    <label for="inputUsername" class="col-sm-4 control-label">用户名</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputUsername" name="username" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group login-form-group">
                    <label for="inputPassword" class="col-sm-4 control-label">密码</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group login-button login-form-group">
                    <div class="col-sm-12">
                        <button type="submit" id="login-btn" class="btn btn-primary btn-block">登录</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
</html>

