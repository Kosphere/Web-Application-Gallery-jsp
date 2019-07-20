<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container" >
    <div class="row">
        <div class="col-md-6"></div>
        <div class="col-md-4">
            <form class="form-horizontal" action="RegisterServlet" method="post">
                <div class="form-group register-form-group">
                    <label for="inputUsername" class="col-sm-3 control-label">用户名</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputUsername" name="username" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group register-form-group">
                    <label for="inputPassword" class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group register-form-group">
                    <label for="inputUsername" class="col-sm-3 control-label">邮箱</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputEmail" name="email" placeholder="请输入邮箱">
                    </div>
                </div>
                <div class="form-group register-form-group">
                    <label for="inputUsername" class="col-sm-3 control-label">电话</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputNumber" name="number" placeholder="请输入电话号码">
                    </div>
                </div>
                <div class="form-group register-form-group">
                    <label for="inputUsername" class="col-sm-3 control-label">地址</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputAddress" name="address" placeholder="请输入地址">
                    </div>
                </div>
                <div class="form-group register-button register-form-group">
                    <div class="col-sm-12">
                        <button type="submit" id="register-btn" class="btn btn-primary btn-block">注册</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
</html>