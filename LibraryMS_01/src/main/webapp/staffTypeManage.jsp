<%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2019/11/9
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工职位管理</title>
    <link rel="stylesheet" href="css/staffTypeManage.css">
</head>
<body>
<%
    String a_id = request.getParameter("a_id");
    System.out.println(a_id);
    int aid=Integer.parseInt(a_id);
%>
<div id="staffTypeUpdate">
    <ul>
        <li>要更改员工的id：<input id="aid" class="staffTypeUpdateInput" type="text" name="a_id" value="<%=a_id%>" readonly></li>
        <li>请选择员工职位：<input type="radio" name="position" value="2">高级管理员
            <input type="radio" name="position" value="1">普通管理员</li>
        <li><button type="button" class="btn" id="staffTypeUpdate_btn">职位更改</button></li>
    </ul>
</div>

<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/staffTypeManage.js" type="text/javascript"></script>
</body>
</html>
