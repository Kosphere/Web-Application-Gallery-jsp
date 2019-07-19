<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<form action="RegisterServlet" method="post">
    Username: <input type="text" name="username" placeholder="enter username">
    <br>
    Password: <input type="password" name="password" placeholder="enter password">
    <br>
    Email: <input type="text" name="email" placeholder="enter email">
    <br>
    Number: <input type="text" name="number" placeholder="enter phone number">
    <br>
    Address: <input type="text" name="address" placeholder="enter address">
    <br>
    <button type="submit">Signup</button>
</form>
</body>
</html>