<%session.setAttribute("url","Search.jsp");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索</title>
    <script charset="UTF-8" type="text/javascript" src="js/search.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container" style="margin-left: 30%">
<div class="row justify-content-left">
    <h5>输入一项或多项搜索</h5>
</div>
</div>
    <div class="row justify-content-md-center">

        <div class="col-md-6">
            <form class="form-horizontal" action="SearchServlet" method="post"  onsubmit="return searchFunction()">
                <div class="form-group register-form-group">
                    <label for="inputName" class="col-sm-3 control-label">展品名称</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputName" name="name" placeholder="请输入展品名称">
                    </div>
                </div>
                <div class="form-group register-form-group">
                    <label for="inputDescription" class="col-sm-3 control-label">展品简介</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="inputDescription" name="description" placeholder="请输入展品简介">
                    </div>
                </div>
                <div class="form-group register-form-group">
                    <label for="inputLocation" class="col-sm-3 control-label">馆藏地点</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputLocation" name="location" placeholder="请输入馆藏地点">
                    </div>
                </div>
                <div class="form-group register-button register-form-group">
                    <div class="col-sm-6">
                        <button type="submit" id="register-btn" class="btn btn-primary btn-block" onclick="return searchFunction()">搜索</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</body>
</html>

