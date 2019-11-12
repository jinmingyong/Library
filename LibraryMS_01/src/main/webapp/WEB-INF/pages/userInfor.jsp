<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/11/5
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>

    <base href="<%=basePath%>">
    <title>信息完善</title>
</head>
<link rel="stylesheet" href="/css/userInfor.css">
<body>
<c:forEach items="${list}" var="reader">
    <div id="main" class="elegant-aero">
    <h1>欢迎${reader.rphone}注册进入系统！
    <span>完善一下我们的信息吧(*╹▽╹*)</span>
    </h1>
    <form action="reader/readerRegiser?phone=${reader.rphone}" method="post" class="STYLE-NAME" enctype="multipart/form-data">
    <label>
    <span>昵称：</span>
    <input type="text" name="name" placeholder="填一个属于自己的昵称偶->_->">
    </label>
    <label>
    <span>邮箱：</span>
    <input type="email" name="email" placeholder="记得写对格式偶！" required="required" pattern="^([a-z0-9A-Z]+[-|_|\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-zA-Z]{2,}$">
    </label>
    <label>
    <span>性别：</span>
    <input type="text" name="sex" placeholder="更好的找到对象">
    </label>
        <label>
            <span>地址：</span>
            <input type="text" name="address" placeholder="是地址偶，必须要写的！" required="required">
        </label>
    <label>
    <span>头像：</span>
    <input type="file" name="fileUp" placeholder="这是必须弄的偶(  ｰ̀ωｰ́ )⊃⌒" required="required">
    </label>

    <input type="submit" class="button" value="提交">
    <input type="reset" class="button" value="重置">
    </form>
    </div>
</c:forEach>
<script>
</script>
</body>
</html>
