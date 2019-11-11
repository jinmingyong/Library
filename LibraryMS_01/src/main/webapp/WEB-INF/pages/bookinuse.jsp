<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Avalon
  Date: 2019/11/10
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <div>
            <ul>
                <li><a href="/findInuseAll"><button id="btn1">查看inuse信息 </button></a></li>
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
        <div id="showAll">
            <table border="1px">
                <thead>
                    <tr align="center">
                        <td>inuse_id</td>
                        <td>isbn</td>
                        <td>book_name</td>
                        <td>inusetime</td>
                        <td>amount</td>
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
            <form action="/updateBookInuse" method="post">
                ISBN:<input type="text" name="isbn" placeholder="上货的ISBN"><br>
                上架数量：<input type="text" name="account"><br>
                <input type="submit" value="提交">
            </form>
        </div>
        <div id="insertInuse">
            <form action="/insertBookInuse" method="post">
                ISBN:<input type="text" name="isbn" placeholder="上架的ISBN"><br>
                上架数量：<input type="text" name="account"><br>
                <input type="submit" value="提交">
            </form>
        </div>
        <div id="showInfor">
            <table border="1px">
                <thead>
                <tr align="center">
                    <td>inuse_id</td>
                    <td>isbn</td>
                    <td>inusetime</td>
                    <td>amount</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script>
        $(function () {
            $("#updateISBN").hide();
            $("#insertInuse").hide();
            $("#showInfor").hide();
            $("#showAll").show();
            // $("#btn1").click(function () {
            //     $("#updateISBN").hide();
            //     $("#insertInuse").hide();
            //     $("#showInfor").show();
            //     $("#showAll").hide();
            //     $.ajax({
            //         url:"findInuseAll",
            //         dataType:'json',
            //         success:function (data) {
            //             if (data!=null){
            //                 var result='';
            //                 $.each(data, function (i, el) {
            //                     result += "<tr>";
            //                     result += "<td>" + el.inuId + "</td>"
            //                     result += "<td>" + el.isbn + "</td>"
            //                     result += "<td>" + el.rid + "</td>"
            //                     result += "<td>" + el.inusetime + "</td>"
            //                     result += "<td>" + el.amount + "</td>"
            //                     result +="<td><a href='/deleteBookInuse?id="+el.inuId+"'> <button>删除</button></a></td>"
            //                     result += "</tr>";
            //                 });
            //                 $("#showInfor").children().children("tbody").html(result);
            //             } else {
            //                 alert("没有您的查询信息！");
            //             }
            //         }
            //     })
            // });
            $("#btn2").click(function () {
                $("#updateISBN").hide();
                $("#insertInuse").hide();
                $("#showInfor").show();
                $("#showAll").hide();
                var isbn=$("#isbn").val();
                $.ajax({
                    url:"FindByIsbn",
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
                    url:"selectByAccount",
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
                    url:"deleteBookInuse",
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
                    url:"updateBookInuseMoren",
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
</body>
</html>
