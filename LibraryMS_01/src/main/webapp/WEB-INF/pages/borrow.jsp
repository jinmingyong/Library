<%@ page import="java.util.List" %>
<%@ page import="com.entity.Borrow" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Avalon
  Date: 2019/11/9
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <base href="<%=basePath%>">
    <title>借阅信息栏</title>
</head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery-3.3.1.min.js"></script>
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
<body>
<div class="container">
<div id="main">
    <div>
        <ul>
            <li> <a href="/borrowFindAll" > <button id="showAllInfor">借阅信息</button></a> </li>
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
            <table border="1px" class="table table-condensed">
                <thead>
                <tr>
                    <td>id</td>
                    <td>isbn</td>
                    <td>图书名</td>
                    <td>rid</td>
                    <td>读者姓名</td>
                    <td>bor_time</td>
                    <td>ret_time</td>
                    <td>real_time</td>
                    <td>bor_type</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="borrow">
                    <tr>
                        <td>${borrow.borId}</td>
                        <td>${borrow.isbn}</td>
                        <td>${borrow.bookRes.bname}</td>
                        <td>${borrow.rid}</td>
                        <td>${borrow.User.name}</td>
                        <td>${borrow.borTime}</td>
                        <td>${borrow.retTime}</td>
                        <td>${borrow.realTime}</td>
                        <td>${borrow.borType}</td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
        <div id="showLend" >
            <table border="1px">
                <thead>
                    <tr>
                        <td>id</td>
                        <td>isbn</td>
                        <td>图书名</td>
                        <td>rid</td>
                        <td>读者姓名</td>
                        <td>bor_time</td>
                        <td>ret_time</td>
                        <td>real_time</td>
                        <td>bor_type</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div id="insert" >
            <form action="/insertBorrow" method="post">
                图书编号：<input type="text" name="isbn"><br>
                学生学号：<input type="text" name="stuId"><br>
                <input type="submit" value="提交">
                <input type="reset" value="重置">
            </form>
        </div>
        <div id="showYuqi" >
            <table border="1px">
                <thead>
                <tr>
                    <td>id</td>
                    <td>isbn</td>
                    <td>图书名</td>
                    <td>rid</td>
                    <td>读者姓名</td>
                    <td>bor_time</td>
                    <td>ret_time</td>
                    <td>real_time</td>
                    <td>bor_type</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody >

                </tbody>



                <%--<c:forEach items="${bor}" var="borrow">--%>
                    <%--<tr>--%>
                        <%--<td id="td">${borrow.borId}</td>--%>
                        <%--<td id="td1">${borrow.isbn}</td>--%>
                        <%--<td id="td2">${borrow.rid}</td>--%>
                        <%--<td>${borrow.borTime}</td>--%>
                        <%--<td>${borrow.retTime}</td>--%>
                        <%--<td>${borrow.realTime}</td>--%>
                        <%--<td>${borrow.borType}</td>--%>
                        <%--<td><button id="penalty" type="button">逾期</button> <button id="penalty1" type="button">损坏</button></td>--%>
                    <%--</tr>--%>
                <%--</c:forEach>--%>
            </table>
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
              url:"borrowFindType",
              dataType:'json',
              success:function (data) {
                  var result=''
                  console.log(data)
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
                      result +="<td><a href='/updateBorrowBackType?id="+el.borId+"'> <button>还书</button></a></td>"
                      result += "</tr>"
                  });
                $("#showLend").children().children("tbody").html(result)
              }
          })
      });

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
              url:"findBookInuseByOverdue",
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
                          result += "<td>" + el.Reader.rname + "</td>"
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
          var penType = "2";
          $.ajax({
              url: "inserPenatly",
              data: {id:id,isbn: isbn,rid: rid, penType: penType},
              type: "post",
              dataType: "json",
              success: function (data) {
                  if (data == "err") {
                      alert("处理失败！");
                  } else if (data == "success") {
                      alert("处理成功！");
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
                  url:"inserPenatly",
                  data:{id:id,isbn:isbn,rid:rid,penType:penType},
                  type:"post",
                  dataType: "text",
                  success:function (data) {
                      if (data=="err"){
                          alert("修改失败！");
                      } else if (data=="success") {
                          alert("修改成功！");
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
                      url:"findBookInuseByRid",
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
                                  result += "<td>" + el.Reader.rname + "</td>"
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
                      url: "findBookInuseByRid",
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
                                  result += "<td>" + el.Reader.rname + "</td>"
                                  result += "<td>" + el.borTime + "</td>"
                                  result += "<td>" + el.retTime + "</td>"
                                  result += "<td>" + el.realTime + "</td>"
                                  result +="<td>"  + el.borType +"</td>"
                                  result +="<td><a href='/updateBorrowBackType?id="+el.borId+"'> <button>还书</button></a></td>"
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
                      url:"findBookInuseByRid",
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
                                  result += "<td>" + el.Reader.rname + "</td>"
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

      });
</script>
</body>
</html>
