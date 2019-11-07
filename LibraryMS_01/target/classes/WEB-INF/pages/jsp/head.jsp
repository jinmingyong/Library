<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/11/5
  Time: 10:18
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
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
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
    <!-- Favicon-->
    <link rel="stylesheet" href="css/zpageNav.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/input.css">
    <link rel="stylesheet" href="css/shortcode-common.css">
    <link rel="stylesheet" href="css/testimonial.css">
    <link rel="stylesheet" href="css/custom.css">
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/vue.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/masonry-layout/masonry.pkgd.min.js"></script>
    <script src="js/zpageNav.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
<%--    <script src="js/front.js"></script>--%>
    <script src="js/main.js"></script>
</head>
<body>
<div id="all">
    <div class="container-fluid">
        <div class="row row-offcanvas row-offcanvas-left">
            <!--   *** SIDEBAR ***-->
            <div id="sidebar" class="col-md-4 col-lg-3 sidebar-offcanvas">
                <div class="sidebar-content">
                    <h1 class="sidebar-heading"> <a href="index.jsp">Creative</a></h1>
                    <p class="sidebar-p">I am a creative illustrator and graphic designer with more than 10 years of experience. </p>
                    <p class="sidebar-p">Originally from Toronto, currently based in London. </p>
                    <ul class="sidebar-menu">
                        <!-- Link-->
                        <li class="sidebar-item"><a href="index.jsp" class="sidebar-link active">Home</a></li>
                        <!-- Link-->
                        <li class="sidebar-item"><a href="about.jsp" class="sidebar-link">About</a></li>
                        <!-- Link-->
                        <li class="sidebar-item"><a href="addComment.jsp" class="sidebar-link">Get in touch</a></li>
                    </ul>
                    <p class="social"><a href="#" data-animate-hover="pulse" class="external facebook"><i class="fa fa-facebook"></i></a><a href="#" data-animate-hover="pulse" class="external gplus"><i class="fa fa-google-plus"></i></a><a href="#" data-animate-hover="pulse" class="external twitter"><i class="fa fa-twitter"></i></a><a href="#" title="" class="external instagram"><i class="fa fa-instagram"></i></a><a href="#" data-animate-hover="pulse" class="email"><i class="fa fa-envelope"></i></a></p>
                    <div class="copyright text-center text-md-left">
                        <p class="credit">Bootstrapious.com &copy;2018 Your name or company | More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>

                    </div>
                </div>
            </div>

