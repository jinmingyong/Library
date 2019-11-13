<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Avalon
  Date: 2019/11/11
  Time: 1:31
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
</head>

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

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html">图书馆管理后台系统</a>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="bookBorrow/borrowFindAll">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">借阅管理系统</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
                <a class="nav-link" href="bookInuse/findInuseAll">
                    <i class="fa fa-fw fa-area-chart"></i>
                    <span class="nav-link-text">上架管理系统</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                <a class="nav-link" href="penalty/findAllPenalty">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">违规处罚系统</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                <a class="nav-link" href="staffManage.jsp">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">管理员管理</span>
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
                <i class="fa fa-table"></i> 违规处罚系统
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="container">
                        <div id="main">

                            <div>
                                <div>
                                    <ul>
                                        <li><a href="penalty/findAllPenalty"><button type="button">显示处罚信息</button></a>  </li>
                                        <li>
                                            <form >
                                                <input type="text" name="rid" id="rid" placeholder="读者id">
                                                <input id="selByRid" type="button" value="查询">
                                            </form>
                                        </li>
                                    </ul>
                                </div>

                            </div>

                            <div id="showInfor">
                                <table class="table table-bordered"  width="100%" cellspacing="0">
                                    <thead>
                                        <%--<tr align="center">--%>
                                        <tr>
                                            <th>id</th>
                                            <th>isbn</th>
                                            <th>rid</th>
                                            <th>penType</th>
                                            <th>repay</th>
                                            <th>penTime</th>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="/js/jquery-3.3.1.min.js"></script>
<script>
    $(function () {
        $("#selByRid").click(function () {
            var rid=$("#rid").val();
            console.log(rid)
            $.ajax({
                url:"penalty/findPenaltyByRid",
                data:{rid:rid},
                dateType:'json',
                type:"post",
                success:function (data) {
                    if (data!=""){
                        var result='';
                            $.each(data, function (i, el) {
                                result += "<tr>"
                                result += "<td >" + el.penId + "</td>"
                                result += "<td>" + el.isbn + "</td>"
                                result += "<td>" + el.rid + "</td>"
                                result += "<td>" + el.penType + "</td>"
                                result += "<td>" + el.repay + "</td>"
                                result += "<td>" + el.penTime + "</td>"
                                result += "</tr>"
                        });
                        $("#showInfor").children().children("tbody").html(result);
                    } else {
                        alert("您查询的信息不存在！");
                    }
                }
            })
        });
    })
</script>
</html>
