<%@ page import="vo.User" %>
<%
    session.setAttribute("url","User.jsp");
    User user = (User) session.getAttribute("user");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="row justify-content-md-center">
    <h2>个人中心</h2>
</div>
<div class="row justify-content-md-center">
<div class="card" style="width: auto; margin: 20px;">
    <ul class="list-group list-group-flush">
        <li class="list-group-item">用户名：<%=user.getUsername()%></li>
        <li class="list-group-item">邮箱地址：<%=user.getEmail()%></li>
        <li class="list-group-item">电话：<%=user.getNumber()%></li>
        <li class="list-group-item">地址：<%=user.getAddress()%></li>
        <li class="list-group-item">个性签名：XXXXXXXXXXXX</li>
    </ul>
</div></div>
</body>
</html>
