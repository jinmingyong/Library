<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Avalon
  Date: 2019/11/10
  Time: 23:18
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
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html">图书管理系统</a>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="borrow.jsp">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">借阅管理系统</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
                <a class="nav-link" href="charts.html">
                    <i class="fa fa-fw fa-area-chart"></i>
                    <span class="nav-link-text">上架管理系统</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                <a class="nav-link" href="tables.html">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">违规处罚系统</span>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>
    </div>
</nav>
<div class="content-wrapper">
    <div class="container-fluid">
        <div class="card mb-3">
            <div class="card-header">
                <i class="fa fa-table"></i> 上架管理系统
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="container">
                        <div id="main">
                            <div>
                                <ul>
                                    <li><a href="bookInuse/findInuseAll"><button id="btn1">查看inuse信息 </button></a></li>
                                    <li>
                                        <form >
                                            <input type="text" id="isbn" placeholder="输入isbn">
                                            <input id="btn2" type="button" value="isbn查询">
                                        </form>
                                    </li>
                                    <li><button id="btn3">上架图书</button></li>
                                    <li><button id="btn4">图书补货</button></li>
                                    <li>
                                        <form >
                                            <input type="text" id="account" placeholder="输入指定数目查询">
                                            <input id="btn5" type="button" value="指定数目查询">
                                        </form>
                                    </li>
                                </ul>
                            </div>
                            <div>
                                <div id="showAll">
                                    <%--id="dataTable"--%>
                                    <table class="table table-bordered"  width="100%" cellspacing="0">
                                        <thead>
                                        <tr align="center">
                                            <th>inuse_id</th>
                                            <th>isbn</th>
                                            <th>book_name</th>
                                            <th>inusetime</th>
                                            <th>amount</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${inuseList}" var="inuse">
                                            <tr>
                                                <td id="td">${inuse.inuId}</td>
                                                <td id="td1">${inuse.isbn}</td>
                                                    <%--maki:添加了图书表的姓名--%>
                                                <td>${inuse.bookRes.bname}</td>
                                                <td>${inuse.inusetime}</td>
                                                <td>${inuse.amount}</td>
                                                    <%--<td><button id="btn5">删除</button> </td>--%>
                                            </tr>
                                        </c:forEach>
                                        </tbody>

                                    </table>
                                </div>

                                <div id="updateISBN">
                                    <form action="bookInuse/updateBookInuse" method="post">
                                        ISBN:<input type="text" name="isbn" placeholder="上货的ISBN"><br>
                                        上架数量：<input type="text" name="account"><br>
                                        <input type="submit" value="提交">
                                    </form>
                                </div>
                                <div id="insertInuse">
                                    <form action="bookInuse/insertBookInuse" method="post">
                                        ISBN:<input type="text" name="isbn" placeholder="上架的ISBN"><br>
                                        上架数量：<input type="text" name="account"><br>
                                        <input type="submit" value="提交">
                                    </form>
                                </div>


                                <div id="showInfor">
                                    <table class="table table-bordered"  width="100%" cellspacing="0">
                                        <thead>
                                        <tr align="center">
                                            <th>inuse_id</th>
                                            <th>isbn</th>
                                            <th>图书名</th>
                                            <th>inusetime</th>
                                            <th>amount</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    $(function () {
        $("#updateISBN").hide();
        $("#insertInuse").hide();
        $("#showInfor").hide();
        $("#showAll").show();


        $("#btn2").click(function () {
            $("#updateISBN").hide();
            $("#insertInuse").hide();
            $("#showInfor").show();
            $("#showAll").hide();
            var isbn=$("#isbn").val();
            $.ajax({
                url:"bookInuse/FindByIsbn",
                data:{isbn:isbn},
                dateType:'json',
                type:"post",
                success:function (data) {
                    var result=''
                    $.each(data, function (i, el) {
                        result += "<tr>"
                        result += "<td id='delId'>" + el.inuId + "</td>"
                        result += "<td>" + el.isbn + "</td>"
                        result += "<td>" + el.bookRes.bname + "</td>"
                        result += "<td>" + el.inusetime + "</td>"
                        result += "<td>" + el.amount + "</td>"
                        result +="<td> <button id='del'>删除</button></td>"
                        result += "</tr>"
                    });
                    $("#showInfor").children().children("tbody").html(result);
                }
            })
        });
        $("#btn3").click(function () {
            $("#updateISBN").hide();
            $("#insertInuse").show();
            $("#showInfor").hide();
            $("#showAll").hide();
        });
        $("#btn4").click(function () {
            $("#updateISBN").show();
            $("#insertInuse").hide();
            $("#showInfor").hide();
            $("#showAll").hide();
        });
        $("#btn5").click(function () {
            $("#updateISBN").hide();
            $("#insertInuse").hide();
            $("#showInfor").show();
            $("#showAll").hide();
            var account=$("#account").val();
            $.ajax({
                url:"bookInuse/selectByAccount",
                data:{account:account},
                dateType:'json',
                type:"post",
                success:function (data) {
                    if (data!=null){
                        var result=''
                        $.each(data, function (i, el) {
                            result += "<tr>"
                            result += "<td>" + el.inuId + "</td>"
                            result += "<td id='elIsbn'>" + el.isbn + "</td>"
                            result += "<td>" + el.bookRes.bname + "</td>"
                            result += "<td>" + el.inusetime + "</td>"
                            result += "<td>" + el.amount + "</td>"
                            result +="<td> <button id='insertAccount'>增加数量</button></td>"
                            result += "</tr>"
                        });
                        $("#showInfor").children().children("tbody").html(result);
                    } else {
                        alert("没有您要查询的信息");
                    }
                }
            })
        });
        $("tbody").on("click","#del",function () {
            var id=$(this).parents("tr").find("#delId").text();
            $.ajax({
                url:"bookInuse/deleteBookInuse",
                data:{id:id},
                dateType:'json',
                type:"post",
                success:function (data) {
                    if (data=="success"){
                        alert("删除成功！");
                        window.location.href="/findInuseAll";
                    }else {
                        alert("删除失败！")
                    }
                }
            })
        });
        $("tbody").on("click","#insertAccount",function () {
            var isbn=$(this).parents("tr").find("#elIsbn").text();
            var account="10";
            $.ajax({
                url:"bookInuse/updateBookInuseMoren",
                data:{isbn:isbn,account:account},
                dateType:'json',
                type:"post",
                success:function (data) {
                    if (data=="success"){
                        alert("添加成功！");
                        window.location.href="/findInuseAll";
                    } else {
                        alert("添加失败！");
                    }
                }
            })
        })
    })
</script>
</html>
