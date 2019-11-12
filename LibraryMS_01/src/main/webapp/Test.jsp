<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Avalon
  Date: 2019/11/8
  Time: 22:14
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
    <button><a href="bookBorrow/borrowFindAll">显示borrow信息</a> </button><br>
    <%--<button><a href="/borrowFindType">显示borrow没有归还的信息</a> </button><br>--%>
    <%--<p>测试borrow的信息添加</p>--%>
    <%--<form action="/insertBorrow" method="post">--%>
        <%--图书编号：<input type="text" name="isbn"><br>--%>
        <%--学生学号：<input type="text" name="stuId"><br>--%>
        <%--<input type="submit" value="提交">--%>
        <%--<input type="reset" value="重置">--%>
    <%--</form><br>--%>
<%--<h3>测试还书</h3>--%>
    <%--<button><a href="/updateBorrowBackType">还书</a> </button>--%>
    <%--<h3>根据读者id查询信息</h3>--%>
    <%--<form action="/findBookInuseByRid" method="post">--%>
        <%--rid:<input type="text" name="rid">--%>
        <%--<input type="submit" value="查询">--%>
    <%--</form><br>--%>
    <%--<h3>根据borrow查询逾期未还的信息</h3>--%>
    <%--<form action="/findBookInuseByOverdue" method="post">--%>
        <%--<input type="submit" value="查询逾期">--%>
    <%--</form>--%>
<h3></h3>
<%--<h3>测试inuse</h3>--%>
    <button><a href="bookInuse/findInuseAll">查看inuse信息</a> </button><br>
<%--<h3>测试ISBN查询</h3>--%>
    <%--<form action="/FindByIsbn" method="post">--%>
        <%--isbn:<input type="text" name="isbn">--%>
        <%--<input type="submit" value="查询">--%>
    <%--</form>--%>
<%--<br>--%>
<%--<h3>修改inuse数量</h3>--%>
<%--<form action="/updateBookInuse" method="post">--%>
    <%--ISBN:<input type="text" name="isbn"><br>--%>
    <%--上架数量：<input type="text" name="account"><br>--%>
    <%--<input type="submit" value="提交">--%>
<%--</form><br>--%>
<%--<h3>删除inuse单条信息</h3>--%>
<%--<form action="/deleteBookInuse" method="post">--%>
    <%--id:<input type="text" name="id">--%>
    <%--<input type="submit" value="删除">--%>
<%--</form><br>--%>
<%--<h3>插入inuse信息</h3>--%>
<%--<form action="/insertBookInuse" method="post">--%>
    <%--ISBN:<input type="text" name="isbn"><br>--%>
    <%--上架数量：<input type="text" name="account"><br>--%>
    <%--<input type="submit" value="提交">--%>
<%--</form><br>--%>
<%--<h3>查询小于指定值的信息</h3>--%>
<%--<form action="/selectByAccount" method="post">--%>
    <%--输入数目：<input type="text" name="account">--%>
    <%--<input type="submit" value="查询">--%>
<%--</form><br>--%>
    <h3></h3>
<%--<h3>处罚表信息</h3>--%>
<a href="penalty/findAllPenalty"><button type="button">查看处罚信息</button></a>
<br>
<%--<h3>根据rid查询处罚表信息</h3>--%>
<%--<form action="/findPenaltyByRid" method="post">--%>
    <%--rid:<input type="text" name="rid">--%>
    <%--<input type="submit" value="查询">--%>
<%--</form>--%>
<%--<h3>增加处罚信息</h3>--%>
<%--<form action="/inserPenatly" method="post">--%>
    <%--isbn:<input type="text" name="isbn"><br>--%>
    <%--rid:<input type="text" name="rid"><br>--%>
    <%--pen_type:<input type="text" name="penType"><br>--%>
    <%--repay:<input type="text" name="repay"><br>--%>
    <%--<input type="submit" value="提交">--%>
    <%--<input type="reset" value="重置">--%>
<%--</form>--%>
</body>
</html>
