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

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<!-- Custom styles for this template-->
<link rel="stylesheet" href="css/penatly.css">

<link href="css/sb-admin.css" rel="stylesheet">
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<body>

<div >
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
                                        <li class="penatlyLiCss"><a href="penalty/findAllPenalty"><button type="button" class="btn btn-primary btn-lg" type="button">显示处罚信息</button></a>  </li>
                                        <hr>
                                        <li class="penatlyLiCss">

                                            <form class="form-inline" role="form">
                                                <div class="form-group">
                                                    <label class="sr-only" for="rid">读者id</label>
                                                    <input type="text" class="form-control" id="rid" name="rid"
                                                           placeholder="请输入读者id">
                                                </div>
                                                <input type="button" class="btn btn-default" id="selByRid" value="读者查询">
                                            </form>


                                            <%--<form >--%>
                                                <%--<input type="text" name="rid" id="rid" placeholder="读者id">--%>
                                                <%--<input id="selByRid" type="button" value="查询">--%>
                                            <%--</form>--%>
                                        </li>
                                    </ul>
                                </div>

                            </div>

                            <div id="showInfor">
                                <table class="table table-bordered"  width="100%" cellspacing="0">
                                    <thead>
                                        <%--<tr align="center">--%>
                                        <tr>
                                            <th>违规号</th>
                                            <th>isbn</th>
                                            <th>读者号</th>
                                            <th>违规状态</th>
                                            <th>扣分值</th>
                                            <th>违规时间</th>

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
