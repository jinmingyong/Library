<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Avalon
  Date: 2019/11/9
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.entity.Borrow" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>borrow</title>
</head>

<%--<script src="js/jquery-1.12.4.js"></script>--%>
<style type="text/css">
    #showAll{
        width: 1200px;
        height: auto;
    }
    #insert{
        width: 1200px;
        height: auto;
    }
    #showLend{
        width: 1200px;
        height: auto;
    }
    #showYuqi{
        width: 1200px;
        height: auto;
    }

</style>
<%
    List<Borrow> list= (List<Borrow>) request.getSession().getAttribute("type");
    //<String,Object> map=request.getSession().getAttribute()
    List<Borrow> list1= (List<Borrow>) request.getSession().getAttribute("bor");
    System.out.println("----"+list);
    System.out.println("----"+list1);
%>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="/css/dataTables.bootstrap4.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/jquery.sPage.css">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.sPage.js"></script>


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
                        <span class="nav-link-text">Charts</span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                    <a class="nav-link" href="tables.html">
                        <i class="fa fa-fw fa-table"></i>
                        <span class="nav-link-text">Tables</span>
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
                    <i class="fa fa-table"></i> 借阅管理系统
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <div class="container">
                            <div id="main">
                                <div>
                                    <ul>
                                        <li> <a href="bookBorrow/borrowFindAllbyPage" > <button id="showAllInfor">借阅信息</button></a> </li>
                                        <li>    <button type="button" id="no_back" >未归还信息</button> </li>
                                        <li>    <button type="button" id="insert_val">插入信息</button></li>
                                        <li>    <form >
                                            <input type="text" id="rid" name="rid">
                                            <select id="selectForm" name="type">
                                                <option value="1">全部</option>
                                                <option value="2">未还</option>
                                                <option value="3">已还</option>
                                            </select>
                                            <input id="btnCheck" type="button" value="查询"/>
                                        </form>
                                        </li>
                                        <li> <button type="button" id="yuqi">查询逾期</button> </li>
                                    </ul>
                                </div>
                                <div id="mainInfor">
                                    <div id="showAll">
                                        <%--id="dataTable"--%>
                                        <table class="table table-bordered"  width="100%" cellspacing="0">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>isbn</th>
                                                <th>图书名</th>
                                                <th>rid</th>
                                                <th>读者姓名</th>
                                                <th>bor_time</th>
                                                <th>ret_time</th>
                                                <th>real_time</th>
                                                <th>bor_type</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${pageInfo.list}" var="borrow">
                                                <tr>
                                                    <td>${borrow.borId}</td>
                                                    <td>${borrow.isbn}</td>
                                                    <td>${borrow.bookRes.bname}</td>
                                                    <td>${borrow.rid}</td>
                                                    <td>${borrow.reader.rname}</td>
                                                    <td>${borrow.borTime}</td>
                                                    <td>${borrow.retTime}</td>
                                                    <td>${borrow.realTime}</td>
                                                    <td>${borrow.borType}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>

                                        </table>
                                    </div>
                                    <%--分页--%>
                                    <div class="row">
                                        <div class="col-md-6">
                                            当前${pageInfo.pageNum }页，总共${pageInfo.pages }页，总共${pageInfo.total }条记录
                                        </div>
                                        <div class="col-md-6">
                                            <nav aria-label="Page navigation">
                                                <ul class="pagination">
                                                    <li><a href="${path }/bookBorrow/borrowFindAllbyPage?pn=1">首页</a></li>
                                                    <c:if test="${pageInfo.hasPreviousPage }">
                                                        <li>
                                                            <a href="${path }/bookBorrow/borrowFindAllbyPage?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                    <c:forEach items="${pageInfo.navigatepageNums }" var="page">
                                                        <c:if test="${page==pageInfo.pageNum }">
                                                            <li class="active"><a href="${path }/bookBorrow/borrowFindAllbyPage?pn=${page}">${page}</a></li>
                                                        </c:if>
                                                        <c:if test="${page!=pageInfo.pageNum }">
                                                            <li><a href="${path }/bookBorrow/borrowFindAllbyPage?pn=${page}">${page}</a></li>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${pageInfo.hasNextPage }">
                                                        <li>
                                                            <a href="${path }/bookBorrow/borrowFindAllbyPage?pn=${pageInfo.pageNum+1 }" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </c:if>

                                                    <li><a href="${path }/bookBorrow/borrowFindAllbyPage?pn=${pageInfo.pages}">末页</a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                    <%--分页end--%>
                                    <div id="showLend" >
                                        <table class="table table-bordered"  width="100%" cellspacing="0">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>isbn</th>
                                                <th>图书名</th>
                                                <th>rid</th>
                                                <th>读者姓名</th>
                                                <th>bor_time</th>
                                                <th>ret_time</th>
                                                <th>real_time</th>
                                                <th>bor_type</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>

                                        </table>
                                        <%--ajax的分页--%>
                                        <div id="showLendpage"></div>
                                    </div>
                                    <div id="insert" >
                                        <form action="bookBorrow/insertBorrow" method="post">
                                            图书编号：<input type="text" name="isbn"><br>
                                            学生学号：<input type="text" name="stuId"><br>
                                            <input type="submit" value="提交">
                                            <input type="reset" value="重置">
                                        </form>
                                    </div>
                                    <div id="showYuqi" >
                                        <table class="table table-bordered"  width="100%" cellspacing="0">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>isbn</th>
                                                <th>图书名</th>
                                                <th>rid</th>
                                                <th>读者姓名</th>
                                                <th>bor_time</th>
                                                <th>ret_time</th>
                                                <th>real_time</th>
                                                <th>bor_type</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody >
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
    <script>





        $(function () {







            $("#showLend").hide();
            $("#insert").hide();
            $("#showAll").show();
            $("#showYuqi").hide();
            // $("#showAllInfor").click(function () {
            //     $("#showLend").hide();
            //     $("#insert").hide();
            //     $("#showAll").show();
            //     $("#showYuqi").hide();
            //     $.ajax( {
            //         url:"borrowFindAll",
            //         type:"get",
            //         dataType:"json",
            //         success:function (data) {
            //             if (data=="borrow"){
            //                 alert("查询成功！")
            //             } else {
            //                  alert("查询失败!")
            //             }
            //         }
            //     })
            // })
            $("#no_back").click(function () {
                $("#showLend").show();
                $("#insert").hide();
                $("#showAll").hide();
                $("#showYuqi").hide();
                // window.location.href="";
                $.ajax({
                    url:"bookBorrow/borrowFindTypebyPage",
                    dataType:'json',
                    data:{pageNum:1},
                    success:function (data) {
                        var result=''
                        total=data.total;
                        page=data.pageNum;
                        console.log(data);
                        $.each(data.list, function (i, el) {
                            $("#showLendpage").sPage({
                                page:page,//当前页码，必填
                                total:total,//数据总条数，必填
                                pageSize:5,//每页显示多少条数据，默认10条
                                totalTxt:"共{total}条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                                showTotal:true,//是否显示总条数，默认关闭：false
                                showSkip:true,//是否显示跳页，默认关闭：false
                                showPN:true,//是否显示上下翻页，默认开启：true
                                prevPage:"上一页",//上翻页文字描述，默认“上一页”
                                nextPage:"下一页",//下翻页文字描述，默认“下一页”
                                backFun:function(page){
                                    page1(page)
                                }});
                            console.log(i);
                            console.log(el);
                            result += "<tr>"
                            result += "<td>" + el.borId + "</td>"
                            result += "<td>" + el.isbn + "</td>"
                            result += "<td>" + el.bookRes.bname + "</td>"
                            result += "<td>" + el.rid + "</td>"
                            result += "<td>" + el.reader.rname + "</td>"
                            result += "<td>" + el.borTime + "</td>"
                            result += "<td>" + el.retTime + "</td>"
                            result += "<td>" + el.realTime + "</td>"
                            result +="<td>"  + el.borType +"</td>"
                            result +="<td><a href='bookBorrow/updateBorrowBackType?id="+el.borId+"'> <button>还书</button></a></td>"
                            result += "</tr>"
                        });
                        $("#showLend").children().children("tbody").html(result)
                    }
                })
            });
            function page1(index){
                var that=this
                $.ajax({
                    url:"bookBorrow/borrowFindTypebyPage",
                    dataType:'json',
                    data:{pageNum:index},
                    success:function (data) {
                        var result=''
                        console.log(data);
                        $.each(data.list, function (i, el) {
                            console.log(i);
                            console.log(el);
                            result += "<tr>"
                            result += "<td>" + el.borId + "</td>"
                            result += "<td>" + el.isbn + "</td>"
                            result += "<td>" + el.bookRes.bname + "</td>"
                            result += "<td>" + el.rid + "</td>"
                            result += "<td>" + el.reader.rname + "</td>"
                            result += "<td>" + el.borTime + "</td>"
                            result += "<td>" + el.retTime + "</td>"
                            result += "<td>" + el.realTime + "</td>"
                            result +="<td>"  + el.borType +"</td>"
                            result +="<td><a href='bookBorrow/updateBorrowBackType?id="+el.borId+"'> <button>还书</button></a></td>"
                            result += "</tr>"
                        });
                        $("#showLend").children().children("tbody").html(result)
                    }
                })
            }



            $("#insert_val").click(function () {
                $("#showLend").hide();
                $("#insert").show();
                $("#showAll").hide();
                $("#showYuqi").hide();
            });

            $("#yuqi").click(function () {
                //findBookInuseByOverdue
                $("#showLend").hide();
                $("#insert").hide();
                $("#showAll").hide();
                $("#showYuqi").show();
                $.ajax({
                    url:"bookBorrow/findBookInuseByOverdue",
                    dataType:'json',
                    success:function (data) {
                        var result=''
                        console.log(data)
                        if (data!=null){
                            $.each(data, function (i, el) {
                                result += "<tr>"
                                result += "<td id='td'>" + el.borId + "</td>"
                                result += "<td id='td1'>" + el.isbn + "</td>"
                                result += "<td>" + el.bookRes.bname + "</td>"
                                result += "<td id='td2'>" + el.rid + "</td>"
                                result += "<td>" + el.reader.rname + "</td>"
                                result += "<td>" + el.borTime + "</td>"
                                result += "<td>" + el.retTime + "</td>"
                                result += "<td>" + el.realTime + "</td>"
                                result +="<td>"  + el.borType +"</td>"
                                result +="<td> <input id='yueqi' type='button' value='逾期'> <button id='penalty1' type='button'>损坏</button></td>"
                                result += "</tr>"
                            });
                            $("#showYuqi").children().children("tbody").html(result);
                        } else {
                            alert("没有数据考研查询!")
                        }
                    }
                })
            });

            $("tbody").on("click","#yueqi",function () {
                var id=$(this).parents("tr").find("#td").text();
                var isbn = $(this).parents("tr").find("#td1").text();
                var rid = $(this).parents("tr").find("#td2").text();
                console.log("我是"+isbn);
                console.log(id);
                var penType = "2";
                $.ajax({
                    url: "penalty/inserPenatly",
                    data: {id:id,isbn: isbn,rid: rid, penType: penType},
                    type: "post",
                    dataType: "text",
                    success:function (data) {
                        if (data=="success") {
                            alert("处理成功！");
                        } else  {
                            alert("处理失败！");
                        }
                    }
                });
            });
            $("tbody").on("click","#penalty1",function () {
                var id=$(this).parents("tr").find("#td").text();
                var isbn=$(this).parents("tr").find("#td1").text();
                var rid=$(this).parents("tr").find("#td2").text();
                var penType="3";
                $.ajax({
                    url:"penalty/inserPenatly",
                    data:{id:id,isbn:isbn,rid:rid,penType:penType},
                    type:"post",
                    dataType: "text",
                    success:function (data) {
                        if (data==""){
                            alert("修改失败！");
                        } else if (data=="success") {
                            alert("修改成功！");
                            window.location.reload();
                        }
                    }
                });
            });

            $("#btnCheck").click(function () {
                var selectForm=$("#selectForm").val();
                if (selectForm=="1"){//全部信息
                    $("#showLend").hide();
                    $("#insert").hide();
                    $("#showAll").show();
                    $("#showYuqi").hide();
                    var rid=$("#rid").val();
                    $.ajax({
                        url:"bookBorrow/findBookInuseByRid",
                        data:{type:selectForm,rid:rid},
                        type:"post",
                        dataType: "json",
                        success:function (data) {
                            var result=''
                            console.log(data);
                            if (data!=null){
                                $.each(data, function (i, el) {
                                    console.log(i);
                                    console.log(el);
                                    result += "<tr>"
                                    result += "<td>" + el.borId + "</td>"
                                    result += "<td>" + el.isbn + "</td>"
                                    result += "<td>" + el.bookRes.bname + "</td>"
                                    result += "<td>" + el.rid + "</td>"
                                    result += "<td>" + el.reader.rname + "</td>"
                                    result += "<td>" + el.borTime + "</td>"
                                    result += "<td>" + el.retTime + "</td>"
                                    result += "<td>" + el.realTime + "</td>"
                                    result +="<td>"  + el.borType +"</td>"
                                    // result +="<td><a href='/updateBorrowBackType?id="+el.borId+"'> <button>还书</button></a></td>"
                                    result += "</tr>"
                                });
                                $("#showAll").children().children("tbody").html(result)
                            }
                        }
                    })
                } else if (selectForm=="2"){//未还
                    $("#showLend").show();
                    $("#insert").hide();
                    $("#showAll").hide();
                    $("#showYuqi").hide();
                    var rid=$("#rid").val();
                    $.ajax({
                        url: "bookBorrow/findBookInuseByRid",
                        data: {type: selectForm, rid: rid},
                        type:"post",
                        dataType: "json",
                        success:function (data) {
                            var result=''
                            console.log(data);
                            if (data!=null){
                                $.each(data, function (i, el) {
                                    console.log(i);
                                    console.log(el);
                                    result += "<tr>"
                                    result += "<td>" + el.borId + "</td>"
                                    result += "<td>" + el.isbn + "</td>"
                                    result += "<td>" + el.bookRes.bname + "</td>"
                                    result += "<td>" + el.rid + "</td>"
                                    result += "<td>" + el.reader.rname + "</td>"
                                    result += "<td>" + el.borTime + "</td>"
                                    result += "<td>" + el.retTime + "</td>"
                                    result += "<td>" + el.realTime + "</td>"
                                    result +="<td>"  + el.borType +"</td>"
                                    result +="<td><a href='bookBorrow/updateBorrowBackType?id="+el.borId+"'> <button>还书</button></a></td>"
                                    result += "</tr>"
                                });
                                $("#showLend").children().children("tbody").html(result);
                            }
                        }
                    })
                } else if (selectForm=="3"){//已还
                    $("#showLend").hide();
                    $("#insert").hide();
                    $("#showAll").show();
                    $("#showYuqi").hide();
                    var rid=$("#rid").val();
                    $.ajax({
                        url:"bookBorrow/findBookInuseByRid",
                        data:{type:selectForm,rid:rid},
                        type:"post",
                        dataType: "json",
                        success:function (data) {
                            var result='';
                            console.log(data);
                            if (data!=null){
                                $.each(data, function (i, el) {
                                    console.log(i);
                                    console.log(el);
                                    result += "<tr>"
                                    result += "<td>" + el.borId + "</td>"
                                    result += "<td>" + el.isbn + "</td>"
                                    result += "<td>" + el.bookRes.bname + "</td>"
                                    result += "<td>" + el.rid + "</td>"
                                    result += "<td>" + el.reader.rname + "</td>"
                                    result += "<td>" + el.borTime + "</td>"
                                    result += "<td>" + el.retTime + "</td>"
                                    result += "<td>" + el.realTime + "</td>"
                                    result +="<td>"  + el.borType +"</td>"
                                    // result +="<td><a href='/updateBorrowBackType?id="+el.borId+"'> <button>还书</button></a></td>"
                                    result += "</tr>"
                                });
                                $("#showAll").children().children("tbody").html(result)
                            }
                        }
                    });
                }else {
                    alert("检查您的学号信息!");
                }
            })








      /*      $("#showLendpage").sPage({
                page:1,//当前页码，必填
                total:,//数据总条数，必填
                pageSize:5,//每页显示多少条数据，默认10条
                totalTxt:"共{total}条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                showTotal:true,//是否显示总条数，默认关闭：false
                showSkip:true,//是否显示跳页，默认关闭：false
                showPN:true,//是否显示上下翻页，默认开启：true
                prevPage:"上一页",//上翻页文字描述，默认“上一页”
                nextPage:"下一页",//下翻页文字描述，默认“下一页”
                backFun:function(page){
             /!*       $.ajax({
                        url:"bookBorrow/borrowFindTypebyPage",
                        data:{pageNum:page},
                        dataType:'json',
                        success:function (data) {
                            var result=''
                            console.log(data)
                            this.page=data.pageNum;
                            this.total=data.total
                            $.each(data.list, function (i, el) {
                                console.log(i);
                                console.log(el);
                                result += "<tr>"
                                result += "<td>" + el.borId + "</td>"
                                result += "<td>" + el.isbn + "</td>"
                                result += "<td>" + el.bookRes.bname + "</td>"
                                result += "<td>" + el.rid + "</td>"
                                result += "<td>" + el.reader.rname + "</td>"
                                result += "<td>" + el.borTime + "</td>"
                                result += "<td>" + el.retTime + "</td>"
                                result += "<td>" + el.realTime + "</td>"
                                result +="<td>"  + el.borType +"</td>"
                                result +="<td><a href='bookBorrow/updateBorrowBackType?id="+el.borId+"'> <button>还书</button></a></td>"
                                result += "</tr>"
                            });
                            $("#showLend").children().children("tbody").html(result)
                        }
                    })*!/
                    console.log(page);
                }
            });*/

        });
    </script>
</body>
</html>
