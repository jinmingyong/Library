<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/11/6
  Time: 17:07
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
<form action="test/uploadfile" method="post" enctype="multipart/form-data">
    <input type="text" name="bname">
    <input type="file" name="pic">
    <button type="submit">提交</button>
</form>
</body>
</html>
