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


<link rel="stylesheet" href="css/bookInUse.css">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</head>

<body>

<div>
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
                                    <li class="bookInUseLiCss"><a href="bookInuse/findInuseAll">
                                        <button id="btn1" class="btn btn-primary btn-lg" type="button">查看inuse信息 </button></a>
                                    </li>
                                    <li class="bookInUseLiCss"><button id="btn3" class="btn btn-primary btn-lg" type="button">上架图书</button></li>
                                    <li class="bookInUseLiCss"><button id="btn4" class="btn btn-primary btn-lg" type="button">图书补货</button></li>
                                    <hr>
                                    <li class="bookInUseLiCss">

                                        <form class="form-inline" role="form">
                                            <div class="form-group">
                                                <label class="sr-only" for="isbn">ISBN</label>
                                                <input type="text" class="form-control" id="isbn" name="isbn"
                                                       placeholder="请输入ISBN">
                                            </div>
                                            <input type="button" class="btn btn-default" id="btn2" value="ISBN查询">
                                        </form>
                                    </li>
                                    <hr>
                                    <li class="bookInUseLiCss">

                                        <form class="form-inline" role="form">
                                            <div class="form-group">
                                                <label class="sr-only" for="account">ISBN</label>
                                                <input type="text" class="form-control" id="account" name="account"
                                                       placeholder="输入指定数目查询">
                                            </div>
                                            <input type="button" class="btn btn-default" id="btn5" value="指定数目查询">
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
                                            <th>上架号</th>
                                            <th>ISBN</th>
                                            <th>图书名</th>
                                            <th>上架时间</th>
                                            <th>架上数量</th>
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

                                    <form class="form-horizontal" role="form" action="bookInuse/updateBookInuse" method="post">
                                        <div class="form-group">
                                            <label for="findISBN" class="col-sm-2 control-label">ISBN</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="findISBN" name="isbn"
                                                       placeholder="请输入ISBN">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="updateCounnt" class="col-sm-2 control-label">补货数量</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="updateCounnt" name="account"
                                                       placeholder="请输入补货数量">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <input type="submit" value="提交" class="btn btn-success">
                                            </div>
                                        </div>

                                    </form>

                                </div>
                                <div id="insertInuse">

                                    <form class="form-horizontal" role="form" action="bookInuse/insertBookInuse" method="post">
                                        <div class="form-group">
                                            <label for="reFindISBN" class="col-sm-2 control-label">ISBN</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="reFindISBN" name="isbn"
                                                       placeholder="请输入欲上架的ISBN">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reUpdateCounnt" class="col-sm-2 control-label">上架数量</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="reUpdateCounnt" name="account"
                                                       placeholder="请输入上架数量">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <input type="submit" value="提交" class="btn btn-success">
                                            </div>
                                        </div>

                                    </form>

                                </div>


                                <div id="showInfor">
                                    <table class="table table-bordered"  width="100%" cellspacing="0">
                                        <thead>
                                        <tr align="center">
                                            <th>上架号</th>
                                            <th>ISBN</th>
                                            <th>图书名</th>
                                            <th>上架时间</th>
                                            <th>架上数量</th>
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
                    if (data[0]==null)
                    {
                        alert("未查到此ISBN的信息")
                        return
                    }
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
                            result +="<td> <button id='insertAccount' type=\"button\" class=\"btn btn-success\">增加数量</button></td>"
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
                        window.location.href="bookInuse/findInuseAll";
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
                        window.location.href="bookInuse/findInuseAll";
                    } else {
                        alert("添加失败！");
                    }
                }
            })
        })
    })
</script>
</html>
