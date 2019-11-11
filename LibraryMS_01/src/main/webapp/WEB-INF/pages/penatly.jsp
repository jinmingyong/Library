<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Avalon
  Date: 2019/11/11
  Time: 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <div>
            <ul>
                <li><a href="/findAllPenalty"><button type="button">显示处罚信息</button></a>  </li>
                <li>
                    <form action="/findPenaltyByRid" method="post">
                        <input type="text" name="rid" placeholder="学生id">
                        <input id="selByRid" type="submit" value="查询">
                    </form>
                </li>
            </ul>
        </div>
        <div id="showInfor">
            <table border="1px">
                <thead>
                    <tr align="center">
                        <td>id</td>
                        <td>isbn</td>
                        <td>rid</td>
                        <td>penType</td>
                        <td>repay</td>
                        <td>penTime</td>
                    </tr>
                </thead>

                <tbody>
                <c:forEach items="${pen}" var="penalty">
                <tr>
                    <td>${penalty.penId}</td>
                    <td>${penalty.isbn}</td>
                    <td>${penalty.rid}</td>
                    <td>${penalty.penType}</td>
                    <td>${penalty.repay}</td>
                    <td>${penalty.penTime}</td>
                </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <%--<div id="showByRid">--%>
            <%--<table border="1px">--%>
                <%--<thead>--%>
                <%--<tr align="center">--%>
                    <%--<td>id</td>--%>
                    <%--<td>isbn</td>--%>
                    <%--<td>rid</td>--%>
                    <%--<td>penType</td>--%>
                    <%--<td>repay</td>--%>
                    <%--<td>penTime</td>--%>
                <%--</tr>--%>
                <%--</thead>--%>
                <%--<tbody>--%>
                <%--</tbody>--%>
            <%--</table>--%>
        <%--</div>--%>
    </div>
</body>
<script src="/js/jquery-3.3.1.min.js"></script>
<%--<script>--%>
    <%--$(function () {--%>
        <%--$("#showInfor").show();--%>
        <%--$("#selByRid").click(function () {--%>
            <%--var rid=$("#rid").val();--%>
            <%--$.ajax({--%>
                <%--url:"findPenaltyByRid",--%>
                <%--data:{rid:rid},--%>
                <%--dateType:'json',--%>
                <%--type:"post",--%>
                <%--success:function (data) {--%>
                    <%--var result='';--%>
                    <%--$.each(data, function (i, el) {--%>
                        <%--result += "<tr>"--%>
                        <%--result += "<td >" + el.penId + "</td>"--%>
                        <%--result += "<td>" + el.isbn + "</td>"--%>
                        <%--result += "<td>" + el.rid + "</td>"--%>
                        <%--result += "<td>" + el.penType + "</td>"--%>
                        <%--result += "<td>" + el.repay + "</td>"--%>
                        <%--result += "<td>" + el.penTime + "</td>"--%>
                        <%--result += "</tr>"--%>
                    <%--});--%>
                    <%--$("#showInfor").children().children("tbody").append(result);--%>
                <%--}--%>
            <%--})--%>
        <%--});--%>
    <%--})--%>
<%--</script>--%>
</html>
