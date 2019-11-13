<%@ page import="com.entity.Admin" %><%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2019/11/8
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Salary</title>
    <link rel="stylesheet" href="css/salary.css">
</head>
<body>

<div id="salary">
    <div id="salary_aid" style="display: none">
        <%
            Admin admin= (Admin) session.getAttribute("admin");
            System.out.println(admin);
        %>
        <%=admin.getA_id()%>
    </div>
    <div id="salary_ym">
        <div id="salary_y">
            年：<select id="salary_year">
            <option>2019</option>
            <option>2018</option>
            <option>2017</option>
            <option>2016</option>
            <option>2015</option>
        </select>
        </div>
        <div id="salary_m">
            月：<select id="salary_month">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
            <option>6</option>
            <option>7</option>
            <option>8</option>
            <option>9</option>
            <option>10</option>
            <option selected>11</option>
            <option>12</option>
        </select>
        </div>
        <button type="button" id="salary_btn">查询该月的工资</button>
    </div>
    <hr>
    <ul>
        <li>本月您的出勤天数为：<span id="salary_span_f"></span></li>
        <li>本月您的迟到天数为：<span id="salary_span_s"></span></li>
        <li>本月您的工资为：<span id="salary_span_t" style="color: red"></span></li>
    </ul>
</div>

<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/salary.js" type="text/javascript"></script>
</body>
</html>
