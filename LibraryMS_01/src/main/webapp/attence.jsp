<%@ page import="com.entity.Admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2019/11/5
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="css/attence.css">
</head>
<body>
<div id="attence_aid">
    <%
        Admin admin= (Admin) session.getAttribute("admin");
        System.out.println(admin);
    %>
    <%=admin.getA_id()%>
</div>
<div id="clockin"><button id="clock_in" type="button">打卡</button></div>
<div id="calendar">
    <ul id="calender_header">
        <li>上一月</li>
        <li></li>
        <li></li>
        <li>下一月</li>
    </ul>
    <table id="calendar_day">
        <tr>
            <th>日</th>
            <th>一</th>
            <th>二</th>
            <th>三</th>
            <th>四</th>
            <th>五</th>
            <th>六</th>
        </tr>
        <tbody id="calendar_body"></tbody>
    </table>
</div>

<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/attence.js" type="text/javascript"></script>
</body>
</html>
