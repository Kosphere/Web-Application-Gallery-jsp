<%@ page contentType="text/html;charset=UTF-8"%>



<%
    session.setAttribute("url","User.jsp");
    String strSQL = (String) session.getAttribute("sql");
    java.sql.Connection sqlCon; //数据库连接对象

    java.sql.Statement sqlStmt; //SQL语句对象

    java.sql.ResultSet sqlRst;  //结果集对象



    java.lang.String strCon;    //数据库连接字符串





    int intPageSize;           //一页显示的记录数

    int intRowCount;           //记录总数

    int intPageCount;          //总页数

    int intPage;               //待显示页码



    java.lang.String strPage;



    int i;



    //设置一页显示的记录数

    intPageSize = 1;



    //取得待显示页码

    strPage = request.getParameter("page");



    if(strPage==null){

        //表明在QueryString中没有page这一个参数，此时显示第一页数据

        intPage = 1;

    } else {

        //将字符串转换成整型

        intPage =java.lang.Integer.parseInt(strPage);

        if(intPage<1) intPage = 1;

    }





    //装载JDBC驱动程序

    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

    String username = "root"; //用户名

    String password = "123456"; //密码

    String url="jdbc:mysql://localhost:3306/project?useSSL=false&serverTimezone=UTC";

    //连接数据库

    sqlCon=java.sql.DriverManager.getConnection(url,username,password);

    //创建语句对象

    sqlStmt =sqlCon.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);

    //创建查询语句


    //执行SQL语句并获取结果集

    sqlRst = sqlStmt.executeQuery(strSQL);



    //获取记录总数

    sqlRst.last();

    intRowCount = sqlRst.getRow();

    //记算总页数

    intPageCount = (intRowCount+intPageSize-1) /intPageSize;

    //调整待显示的页码

    if(intPage>intPageCount) intPage = intPageCount;

%>





<html>



<head>

    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

    <title>数据分页显示</title>

</head>



<body>

<center><table border=1 cellspacing=0 cellpadding=0>

    <tr>

        <td align=center width=100% colspan=5 bgcolor=#3399ff>

            <font color=#ffffff>成员列表</font>

        </td>

    </tr>

    <tr>

        <th>单词</th>

        <th>词性</th>

        <th>汉语示意</th>

    </tr>



    <% if(intPageCount>0) {

        //将记录指针定位到待显示页的第一条记录上

        sqlRst.absolute((intPage-1)* intPageSize + 1);

        //显示数据

        i = 0;

        while(i<intPageSize &&!sqlRst.isAfterLast()){

    %>



    <tr>

        <td> <%= sqlRst.getString(2) %> </td>

        <td> <%= sqlRst.getString(3) %> </td>

        <td> <%= sqlRst.getString(4) %> </td>

    </tr>



    <% sqlRst.next();

        i++;

    }

    }

    %>

</table></center><br>



<center>

    第<%=intPage%>页 共<%=intPageCount%>页



        <% //以下是分页的“上一页”“下一页”，有上一页就有链接，没有就为文字，下一页同理%>

        <% if(intPage>1){ %>

    <a href="SearchResult.jsp?page=<%=intPage-1%>">上一页</a>

        <% }else{ %>

    上一页

        <%}%>



        <% if(intPage<intPageCount){ %>

    <a href="SearchResult.jsp?page=<%=intPage+1%>">下一页</a>

        <% }else{ %>

    下一页

        <%}%>

    <center>

</body>



</html>



<%

    //关闭结果集

    sqlRst.close();

    //关闭SQL语句对象

    sqlStmt.close();

    //关闭数据库

    sqlCon.close();

%>