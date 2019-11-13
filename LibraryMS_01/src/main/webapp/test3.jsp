<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-11-10
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    //${pageContext.request.contextPath}
%>
<html>
<head>

    <base href="<%=basePath%>">
    <title>新书入库</title>
</head>

<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">



<%--<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">--%>
<%--<!-- Font Awesome CSS-->--%>
<%--<link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">--%>
<%--<!-- Google fonts - Roboto-->--%>
<%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,400italic">--%>
<%--<!-- owl carousel-->--%>
<%--<link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">--%>
<%--<link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">--%>
<%--<!-- theme stylesheet-->--%>
<%--<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">--%>
<%--<!-- Custom stylesheet - for your changes-->--%>
<%--<link rel="stylesheet" href="css/custom.css">--%>
<%--<!-- Favicon-->--%>
<%--<link rel="shortcut icon" href="img/favicon.png">--%>
<!-- Tweaks for older IEs--><!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="vendor/masonry-layout/masonry.pkgd.min.js"></script>
<script src="js/front.js"></script>
<script src="js/test3.js"></script>


<body >
<div>
    <div class="container-fluid">
        <div class="card mb-3">
            <div class="card-header">
                <i class="fa fa-table"></i> 申请购买新书
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="container">
                        <div id="main">

                                <div id="tables" class="card mb-4">
                                    <div class="card-body">
                                        <table class="table table-bordered"  width="100%" cellspacing="0">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>isbn</th>
                                                <th>书名</th>
                                                <th>申请日期</th>
                                                <th>添加人</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody id="tb">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- 模态框（Modal） -->
                                <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" >
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myModalLabel">添加新书</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            </div>
                                            <form action="/bookres/addNewBookRes" onsubmit="return check()">
                                                <div class="card-body">

                                                    <table  class="table table-hover table-bordered">
                                                        <thead>
                                                        </thead>
                                                        <tbody >
                                                        <tr>
                                                            <td>isbn:</td>
                                                            <td><input type="text" id="isbn" name="isbn" readonly></td>
                                                        </tr>
                                                        <tr>
                                                            <td>书名:</td>
                                                            <td><input type="text" id="bname" name="bname" readonly></td>
                                                        </tr>

                                                        <tr>
                                                            <td>类型:</td>
                                                            <td>
                                                                <section class="selectbox_section" >
                                                                    <div class="container">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="selectStyle1">
                                                                                    <select id="btype" name="btype">
                                                                                        <option value="1"  class="option">小说</option>
                                                                                        <option value="2"  class="option">科普</option>
                                                                                        <option value="3"  class="option">名著</option>
                                                                                        <option value="4"  class="option">杂志</option>
                                                                                        <option value="5"  class="option">散文</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </section>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>作者:</td>
                                                            <td><input type="text" id="author" name="author"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>出版社:</td>
                                                            <td><input type="text" id="publisher" name="publisher"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>数量:</td>
                                                            <td><input type="text" id="amount" name="amount"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>简介:</td>
                                                            <td><input type="text" id="introduce" name="introduce"></td>
                                                        </tr>
                                                        </tbody>
                                                    </table>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit"  class="btn btn-primary">提交</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                </div>
                                            </form>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal -->
                                </div>



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




</body>

<body>
<%--<div id="tables" class="card mb-4">--%>
    <%--<div class="card-header">新书入库</div>--%>

    <%--<div class="card-body">--%>
        <%--<table  class="table table-hover table-bordered">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th>id</th>--%>
                <%--<th>isbn</th>--%>
                <%--<th>书名</th>--%>
                <%--<th>申请日期</th>--%>
                <%--<th>添加人</th>--%>
                <%--<th>操作</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody id="tb">--%>
            <%--</tbody>--%>
        <%--</table>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<!-- 模态框（Modal） -->--%>
<%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
    <%--<div class="modal-dialog" >--%>
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
                <%--<h4 class="modal-title" id="myModalLabel">添加新书</h4>--%>
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
            <%--</div>--%>
            <%--<form action="/bookres/addNewBookRes" onsubmit="return check()">--%>
            <%--<div class="card-body">--%>

                <%--<table  class="table table-hover table-bordered">--%>
                    <%--<thead>--%>
                    <%--</thead>--%>
                    <%--<tbody >--%>
                    <%--<tr>--%>
                        <%--<td>isbn:</td>--%>
                        <%--<td><input type="text" id="isbn" name="isbn" readonly></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>书名:</td>--%>
                        <%--<td><input type="text" id="bname" name="bname" readonly></td>--%>
                    <%--</tr>--%>

                    <%--<tr>--%>
                        <%--<td>类型:</td>--%>
                        <%--<td>--%>
                            <%--<section class="selectbox_section" >--%>
                                <%--<div class="container">--%>
                                    <%--<div class="row">--%>
                                        <%--<div class="col-md-12">--%>
                                            <%--<div class="selectStyle1">--%>
                                                <%--<select id="btype" name="btype">--%>
                                                    <%--<option value="1"  class="option">小说</option>--%>
                                                    <%--<option value="2"  class="option">科普</option>--%>
                                                    <%--<option value="3"  class="option">名著</option>--%>
                                                    <%--<option value="4"  class="option">杂志</option>--%>
                                                    <%--<option value="5"  class="option">散文</option>--%>
                                                <%--</select>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</section>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>作者:</td>--%>
                        <%--<td><input type="text" id="author" name="author"></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>出版社:</td>--%>
                        <%--<td><input type="text" id="publisher" name="publisher"></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>数量:</td>--%>
                        <%--<td><input type="text" id="amount" name="amount"></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>简介:</td>--%>
                        <%--<td><input type="text" id="introduce" name="introduce"></td>--%>
                    <%--</tr>--%>
                    <%--</tbody>--%>
                <%--</table>--%>

            <%--</div>--%>
            <%--<div class="modal-footer">--%>
                <%--<button type="submit"  class="btn btn-primary">提交</button>--%>
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
            <%--</div>--%>
            <%--</form>--%>
        <%--</div><!-- /.modal-content -->--%>
    <%--</div><!-- /.modal -->--%>
<%--</div>--%>
<%--</div>--%>
</body>
<script type="text/javascript">
    function check(){
        var isbn = $("#isbn").val();
        var bname = $("#bname").val();
        var author = $("#author").val();
        var publisher = $("#publisher").val();
        var amount = $("#amount").val();
        var introduce = $("#introduce").val();

        if(isbn == null || isbn == ""||bname == null || bname == ""||author == null || author == ""||publisher == null || publisher == ""||amount == null || amount == ""||introduce == null || introduce == ""){
            alert("输入不能为空");
            return false;
        }
        return true;

    }

</script>
</html>
