<%@ page import="vo.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="http://cdn.repository.webfont.com/wwwroot/js/wf/youziku.api.min.js"></script>
    <script type="text/javascript">
        $webfont.load("body", "07f83f9f2c414989bdc80ccf417988bf", "Source-Han-Light");
        /*$webfont.load("#id1,.class1,h1", "07f83f9f2c414989bdc80ccf417988bf", "Source-Han-Light");*/
        /*．．．*/
        $webfont.draw();
    </script>
    <style>
        a{ color:rgb(216,216,218)/*颜色自定义*/;}/*未访问的链接,已访问的链接,点击激活链接*/
        a:hover{ color:white/*颜色自定义*/}/* 鼠标在链接上 */
    </style>
    <title></title>
</head>
<header style="background-color: rgb(73,79,92);">
<div class="container" >
    <div class="row align-items-center justify-content-around" style="padding-top: 15px; padding-bottom: 15px">
        <div class="col-sm-4 text-center">
                <a href="index.jsp"><h2 style="color: white">在线博物馆</h2></a>
        </div>
        <div class="col-sm-6">
            <div class="nav nav-justified">
                <div class="col-sm">
                    <div class="nav-item" style="padding-left: 150px">
                        <a class="nav-link" href="Search.jsp"><i class="fa fa-search"></i>&nbsp;搜索</a>
                    </div>
                </div>
                <% Object headerPermission = request.getSession().getAttribute("permission");
                User headerUser = (User)session.getAttribute("user");
                if (headerUser == null || (Integer)headerPermission < 1) {%>
                <div class="col-sm">
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button" class="btn btn-secondary" onclick = "location.href='Login.jsp'"><i class="fa fa-user"></i>&nbsp;登录</button>
                        <button type="button" class="btn btn-secondary" onclick = "location.href='Register.jsp'"><i class="fa fa-user-plus"></i>&nbsp;注册</button>
                    </div>
                </div>
                <%} else {%>
                        <div class="col-sm">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    欢迎，<%= headerUser.getUsername()%>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="User.jsp">个人中心</a>
                                    <a class="dropdown-item" href="#">好友</a>
                                    <a class="dropdown-item" href="#">收藏夹</a>
                                    <a class="dropdown-item" href="#">信箱</a>
                                   <a class="dropdown-item" href="index.jsp" onclick="Logout()">退出登录</a>
                            </div>
                        </div>
                        <%}%>
                        <% if(session.getAttribute("user") != null && (Integer)(session.getAttribute("permission")) == 2) {%>
                        <div class = "col-sm"><div class="nav-item">
                            <a class="nav-link disabled" href="#">控制台</a>
                        </div></div>
                        <%}%>
                    </div>
            </div>
        </div>
    </div>


</header>
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
    $('.dropdown-toggle').dropdown();
    function Logout() {
        <%session.removeAttribute("user");
        session.removeAttribute("permission");
        %>
        alert("已退出")
    }
</script>
</html>
