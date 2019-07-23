<%@ page import="service.ItemService" %>
<%@ page import="vo.Item" %>
<%

    ItemService itemService = new ItemService();
    String itemId = request.getParameter("id");
    String URL = "Item.jsp?id=" + itemId;
    session.setAttribute("url",URL);
    Item item;
    if (itemId != null) {
        item = itemService.getItem(Integer.parseInt(itemId));
        itemService.addHot(item.getId());
    } else item = itemService.getItem(1);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style type="text/css">
        .videolist { position:relative;  width:100px; height:100px;  }
        .videolist:hover{ cursor: pointer; }
        .videoed { display:none; width:50px; height:50px; position: absolute; left:25%; top:50%; z-index:99; border-radius:100%; }
        .videos{ display:none; border: 1px solid #080808; position:fixed; left:50%; top:50%; margin-left:-320px; margin-top:-210px; z-index:100; width:640px; height:360px; }
        .vclose { position:absolute;right:1%; top:1%; border-radius:100%; cursor: pointer; }
    </style>
    <title>详情</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container-fluid" style="background-color:rgb(228,231,237); height: 92%; padding-top: 10px">
<div class="container" >
    <div class="row">
        <div class="col-lg-6">
            <img src="<%=item.getImage()%>" class="image" style="width: 100%;" alt="图片">

        </div>
        <div class="col-lg-4">
            <h2><%=item.getName()%></h2>
            <p>简介：<%=item.getDescription()%></p>
            <p>馆藏地点：<%=item.getAddress()%></p>
            <p>作品完成时间：<%=item.getDate()%></p>
            <p>热度：<%=item.getHot()%></p>
            <div class="video">
                <div class="container" style="margin-top: 1px; margin-bottom: 45px; margin-left: -15px">
                    <div class="videolist" vpath="img/v.jpg" ipath="<%=item.getVideo()%>">
                        <div class="vtit">视频</div>
                        <img src="img/v.jpg"/>
                        <img src="img/play.png" class="videoed"/>
                    </div>
                    <div class="videos"></div>
                </div>
            </div>
            <div class="btn-group" data-toggle="buttons">
                        <%if (headerPermission == null || (Integer)headerPermission < 1) {%>
                    <button type="button"  name="options" class="btn btn-primary item-button"> 登录后收藏 </button>
                            <% } else {%>
                    <button type="button" name="options" class="btn btn-primary item-button"> 收藏 </button>
                                <% } %>
            </div>
        </div>
        <div class="col-lg-2">
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
    <div class="card" style="max-width: 1920px; padding: 20px;">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="<%=item.getImage()%>" class="card-img" style="width: 100%" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h1 class="card-title"><%=item.getName()%></h1>
                    <h2 class="card-text"><%=item.getDescription()%></h2>
                    <div class="container">
                    <div style="position: absolute;right: 0px; bottom: 0px;">
                    <div class="btn-group btn-group-lg" data-toggle="buttons">
                        <button type="button"  name="options" class="btn btn-primary item-button"> 1 </button>
                        <button type="button" name="options" class="btn btn-primary item-button"> 2 </button>
                        <button type="button" name="options" class="btn btn-primary item-button"> 3 </button>
                    </div></div></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script>
    $('.videolist').each(function(){ //遍历视频列表
        $(this).hover(function(){ //鼠标移上来后显示播放按钮
            $(this).find('.videoed').show();
        },function(){
            $(this).find('.videoed').hide();
        });
        $(this).click(function(){ //这个视频被点击后执行
            var img = $(this).attr('vpath');//获取视频预览图
            var video = $(this).attr('ipath');//获取视频路径
            $('.videos').html("<video id=\"video\" poster='"+img+"' style='width: 640px' src='"+video+"' preload=\"auto\" controls=\"controls\" autoplay=\"autoplay\"></video><img onClick=\"close1()\" class=\"vclose\" src=\"img/gb.png\" width=\"25\" height=\"25\"/>");
            $('.videos').show();
        });
    });

    function close1(){
        var v = document.getElementById('video');//获取视频节点
        $('.videos').hide();//点击关闭按钮关闭暂停视频
        v.pause();
        $('.videos').html();
    }
</script>
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
</body>
</html>
