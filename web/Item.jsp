<%@ page import="service.ItemService" %>
<%@ page import="vo.Item" %>
<%
    session.setAttribute("url","Item.jsp");
    ItemService itemService = new ItemService();
    Object itemId = session.getAttribute("id");
    Item item;
    if (itemId != null) {
        item = itemService.getItem((Integer) itemId);
        itemService.addHot(item.getId());
    } else item = itemService.getItem(1);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>详情</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <img src="<%=item.getImage()%>" class="image" style="width: 100%;" alt="图片">
        </div>
        <div class="col-md-5 item-right-border">
            <h2><%=item.getName()%></h2>
            <p>简介：<%=item.getDescription()%></p>
            <p>馆藏地点：<%=item.getAddress()%></p>
            <p>作品完成时间：<%=item.getDate()%></p>
            <p>热度：<%=item.getHot()%></p>
            <div class="btn-group" data-toggle="buttons">
                        <%if (headerPermission == null || (Integer)headerPermission < 1) {%>
                    <button type="button"  name="options" class="btn btn-primary item-button"> 登录后收藏 </button>
                            <% } else {%>
                    <button type="button" name="options" class="btn btn-primary item-button"> 收藏 </button>
                                <% } %>
            </div>
        </div>
        <div class="col-md-2 item-right-border">
            <table class="table table-hover text-center">
                <caption class="text-center">好友推荐</caption>
                <tbody>
                <tr>
                    <td>刘明涵</td>
                </tr>
                <tr>
                    <td>刘美含</td>
                </tr>
                <tr>
                    <td>涵涵涵</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
