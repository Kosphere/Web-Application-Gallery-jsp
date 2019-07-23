<%session.setAttribute("url","Search.jsp");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索</title>
    <script charset="UTF-8" type="text/javascript" src="js/search.js"></script>
    <link href="css/layui.css" type="text/css" rel="stylesheet">
</head>
<body style="height: 100%">
<%@include file="header.jsp"%>
<div class="container-fluid" style="background-color:rgb(228,231,237); height: 92%">
    <div class="row justify-content-lg-center" style="padding-left: 6%; padding-top: 20px">

        <div class="col-lg-4">
            <form class="form-horizontal" action="SearchServlet" method="get"  onsubmit="return searchFunction()">
                <div class="form-group register-form-group">
                    <label for="inputName" class="col-sm-3 control-label">展品名称</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="inputName" name="name" placeholder="请输入展品名称">
                    </div>
                </div>
                <div class="form-group register-form-group">
                    <label for="inputDescription" class="col-sm-3 control-label">展品简介</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="inputDescription" name="description" placeholder="请输入展品简介">
                    </div>
                </div>
                <div class="form-group register-form-group">
                    <label for="inputLocation" class="col-sm-3 control-label">馆藏地点</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="inputLocation" name="location" placeholder="请输入馆藏地点">
                    </div>
                </div>
                <div class="form-group register-button register-form-group">
                    <div class="col-lg-2" style="margin-left: 166px" >
                        <button type="button" id="register-btn" class="btn btn-primary btn-block" onclick='
                        $.ajax({
                        type: "GET",
                        dataType: "html",
                        url: "./SearchServlet",
                        data: $(".form-horizontal").serialize(),
                        success: function (result) {
                        json  = JSON.parse(result);
                        $(function () {
                            nicePage.setCfg({
                            table: "table",
                            bar: "pageBar",
                            limit: 5,
                            color: "#1E9FFF",
                            layout: ["count", "prev", "page", "next", "skip"]
                            });
                        });
                        nice();
                        },
                        error: function(data) {
                        console.log("error:"+data.responseText);
                        }
                        });return searchFunction();
'>搜索</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<div class="container">
    <div class="align-items-center justify-content-around" style="width: 640px;padding-top: 10px; height: auto; background-color: white; padding-left: 20px; padding-right:20px; margin-left: 220px">
        <div class="col text-center">
            <h4 style="padding-bottom: 8px">搜索结果</h4>
        </div>
        <div id="table"></div>
        <div id="pageBar" style="padding-left: 86px"></div>
    </div>
</div>
</div>
<script charset="UTF-8" type="text/javascript" src="js/layui.js"></script>
<script charset="UTF-8" type="text/javascript" src="js/nicePage.js"></script>
<script charset="UTF-8" type="text/javascript">
    var json;
    var nameList = ['name', 'description', 'address', 'image'] //table的列名
    var widthList = [120, 120, 120, 120] //table每列的宽度

</script>
</body>
</html>

