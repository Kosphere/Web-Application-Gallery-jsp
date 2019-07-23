<%@ page import="vo.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.ItemService" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
  session.setAttribute("url","index.jsp");
  ItemService index_item_service = new ItemService();
  ArrayList<Item> latest = index_item_service.getLatest();
  ArrayList<Item> hottest = index_item_service.getHottest();
%>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body {
            background-color: rgb(38,43,49)
        }
        p {
            color: white;
        }
    </style>
  <title>在线博物馆</title>
</head>
<body style="text-align: center">
<%@include file="header.jsp"%>
<div class="container-fluid" style="background-color:rgb(38,43,49)">
<div class="container" style="padding-top: 2px">
    <div class="row" style="padding-left: 100px; padding-right: 100px; background-color: rgb(73,79,92)">
        <h3 style="padding-top: 20px; padding-bottom: 10px; color: rgb(255,255,255)">热门展品</h3>
  <div id="carouselCaptions" class="carousel slide" data-ride="carousel" >
    <ol class="carousel-indicators">
      <li data-target="#carouselCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselCaptions" data-slide-to="1"></li>
      <li data-target="#carouselCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="<%=hottest.get(0).getImage()%>" class="d-block w-100" alt="..." style="width: 800px; height: 600px">
        <div class="carousel-caption d-none d-md-block">
          <h5><a href="Item.jsp?id=<%=hottest.get(0).getId()%>"><%=hottest.get(0).getName()%></a></h5>
          <p><%=hottest.get(0).getDescription()%></p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="<%=hottest.get(1).getImage()%>" class="d-block w-100" alt="..."  style="width: 800px; height: 600px">
        <div class="carousel-caption d-none d-md-block">
          <h5><a href="Item.jsp?id=<%=hottest.get(1).getId()%>"><%=hottest.get(1).getName()%></a></h5>
          <p><%=hottest.get(1).getDescription()%></p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="<%=hottest.get(2).getImage()%>" class="d-block w-100" alt="..."  style="width: 800px; height: 600px">
        <div class="carousel-caption d-none d-md-block">
          <h5><a href="Item.jsp?id=<%=hottest.get(2).getId()%>"><%=hottest.get(2).getName()%></a></h5>
          <p><%=hottest.get(2).getDescription()%></p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
        <h3 style="padding-top: 40px; padding-bottom: 10px; padding-left: 15px; color: rgb(255,255,255)">最新展品</h3>
        <div class="container" style="padding-bottom: 20px">
            <div class="row">
                <div class = "col-lg">
                    <div class="card" style="border-color: #0C0C0C">
                        <img src="<%=latest.get(0).getImage()%>" alt="<%=latest.get(0).getId()%>" class="card-img-top"  style="height: 12rem">
                        <div class="card-body" style="background-color: rgb(40,44,52)">
                            <h5><a href="Item.jsp?id=<%=latest.get(0).getId()%>"><%=latest.get(0).getName()%></a></h5>
                            <p><%=latest.get(0).getDescription()%></p>
                        </div>
                    </div>
                </div>
                <div class = "col-lg">
                    <div class="card" style="border-color: #0C0C0C">
                        <img src="<%=latest.get(1).getImage()%>" alt="<%=latest.get(1).getId()%>" class="card-img-top"  style="height: 12rem">
                        <div class="card-body" style="background-color: rgb(40,44,52)">
                            <h5><a href="Item.jsp?id=<%=latest.get(1).getId()%>"><%=latest.get(1).getName()%></a></h5>
                            <p><%=latest.get(1).getDescription()%></p>
                        </div>
                    </div>
                </div>
                <div class = "col-lg">
                    <div class="card" style="border-color: #0C0C0C">
                        <img src="<%=latest.get(2).getImage()%>" alt="<%=latest.get(2).getId()%>" class="card-img-top"  style="height: 12rem">
                        <div class="card-body" style="background-color: rgb(40,44,52)">
                            <h5><a href="Item.jsp?id=<%=latest.get(2).getId()%>"><%=latest.get(2).getName()%></a></h5>
                            <p><%=latest.get(2).getDescription()%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>

</div>
<%@include file="footer.jsp"%>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
