<%@ page import="vo.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
                        <a class="nav-link" href="Search.jsp">搜索</a>
                    </div>
                </div>
                <% Object headerPermission = request.getSession().getAttribute("permission");
                User headerUser = (User)session.getAttribute("user");
                if (headerUser == null || (Integer)headerPermission < 1) {%>
                <div class="col-sm">
                    <div class="nav-item">
                        <a class="nav-link" href="Login.jsp">登录</a>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="nav-item">
                        <a class="nav-link" href="Register.jsp">注册</a>
                <%} else {%>
                        <div class="col-sm">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <%= headerUser.getUsername()%>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="User.jsp">个人中心</a>
                                    <a class="dropdown-item" href="#">好友</a>
                                    <a class="dropdown-item" href="#">收藏夹</a>
                                    <a class="dropdown-item" href="#">信箱</a>
                                    <a class="dropdown-item" href="#">退出登录</a>
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
    </div>

</div>
</header>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
    $('.dropdown-toggle').dropdown()
</script>>
</body>
</html>
