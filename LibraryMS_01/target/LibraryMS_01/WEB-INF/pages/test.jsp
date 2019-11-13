<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Avalon
  Date: 2019/11/8
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>对borrow的信息操作显示</h3>
    <table border="1px">
        <tr>
            <td>id</td>
            <td>isbn</td>
            <td>rid</td>
            <td>bor_time</td>
            <td>ret_time</td>
            <td>real_time</td>
            <td>bor_type</td>
            <td>操作</td>
        </tr>

        <c:forEach items="${list}" var="borrow">
        <tr>
            <td>${borrow.borId}</td>
            <td>${borrow.isbn}</td>
            <td>${borrow.rid}</td>
            <td>${borrow.borTime}</td>
            <td>${borrow.retTime}</td>
            <td>${borrow.realTime}</td>
            <td>${borrow.borType}</td>
            <td>  <button><a href="/updateBorrowBackType?id=${borrow.borId}">还书</a> </button></td>
        </tr>
        </c:forEach>
    </table>
<h3>----------------------------------------------------</h3>
    <h3>查看inuse全部信息</h3>
    <table border="1px">
        <tr>
            <td>id</td>
            <td>isbn</td>
            <td>inuse_time</td>
            <td>account</td>
        </tr>

        <c:forEach items="${inuseList}" var="inuse">
            <tr>
                <td>${inuse.inuId}</td>
                <td>${inuse.isbn}</td>
                <td>${inuse.inusetime}</td>
                <td>${inuse.amount}</td>
            </tr>
        </c:forEach>
    </table>
<h3>isbn查询结果显示</h3>
    <table border="1px">
        <tr>
            <td>id</td>
            <td>isbn</td>
            <td>inuse_time</td>
            <td>account</td>
        </tr>
        <tr>
            <td>${bookInuse.inuId}</td>
            <td>${bookInuse.isbn}</td>
            <td>${bookInuse.inusetime}</td>
            <td>${bookInuse.amount}</td>
        </tr>
    </table>
<br>
<h3>查询指定数量</h3>
<table border="1px">
    <tr>
        <td>id</td>
        <td>isbn</td>
        <td>inuse_time</td>
        <td>account</td>
        <td>操作</td>
    </tr>
    <c:forEach var="account" items="${account}">
    <tr>
        <td>${account.inuId}</td>
        <td>${account.isbn}</td>
        <td>${account.inusetime}</td>
        <td>${account.amount}</td>
        <td><a href="/updateBookInuse?isbn=${account.isbn}&account=10"><button type="button">添加数量</button> </a></td>
    </tr>
    </c:forEach>
</table>
<h3>---------------------------------------</h3>
<h3>逾期未还信息</h3>
<table border="1px">
    <tr>
        <td>id</td>
        <td>isbn</td>
        <td>rid</td>
        <td>bor_time</td>
        <td>ret_time</td>
        <td>real_time</td>
        <td>bor_type</td>
        <td>操作</td>
    </tr>

    <c:forEach items="${bor}" var="borrow">
        <tr>
            <td>${borrow.borId}</td>
            <td>${borrow.isbn}</td>
            <td>${borrow.rid}</td>
            <td>${borrow.borTime}</td>
            <td>${borrow.retTime}</td>
            <td>${borrow.realTime}</td>
            <td>${borrow.borType}</td>
            <td><a href="/inserPenatly?isbn=${borrow.isbn}&rid=${borrow.rid}&penType=1"><button type="button">处罚</button></a> </td>
        </tr>
    </c:forEach>
</table>
<h3>-----------------------------处罚表--------------------------------</h3>
<table border="1px">
    <tr>
        <td>id</td>
        <td>isbn</td>
        <td>rid</td>
        <td>penType</td>
        <td>repay</td>
        <td>penTime</td>
    </tr>

    <c:forEach items="${pen}" var="penalty">
        <tr>
            <td>${penalty.penId}</td>
            <td>${penalty.isbn}</td>
            <td>${penalty.rid}</td>
            <td>${penalty.penType}</td>
            <td>${penalty.repay}</td>
            <td>${penalty.penTime}</td>
    </c:forEach>
</table>
</body>
</html>
