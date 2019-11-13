<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/11/4
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<body>
<form action="chat/readerlogin" method="post">
    username:<input type="text" name="rname">
    pwd:<input type="password" name="rpwd">
    <button type="submit">开始聊天</button>
</form>
</body>
</html>
