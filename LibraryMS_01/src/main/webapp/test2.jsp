<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-11-10
  Time: 2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>申请购买新书</title>
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Roboto-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,400italic">
    <!-- owl carousel-->
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png">
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
    <script src="js/test2.js"></script>
</head>
<body>
<form>
<div id="tables" class="card mb-4">
    <div class="card-header">申请购买新书</div>
    <div class="card-body">
        <table  class="table table-hover table-bordered">
            <thead>
            </thead>
            <tbody >
            <tr>
                <td>isbn号</td>
                <td><input type="text" id="isbn"></td>
            </tr>
            <tr>
                <td>书名</td>
                <td><input type="text" id="bname"></td>
            </tr>
            <tr>
                <td>管理员id</td>
                <td><input type="text" id="adminid"></td>
            </tr>
            <tr>
                <td><button id="submit" type="button" class="btn btn-success">提交</button></td>
                <td><input type="reset" id="reset" value="重置" class="btn btn-danger" ></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

</form>





</body>
</html>