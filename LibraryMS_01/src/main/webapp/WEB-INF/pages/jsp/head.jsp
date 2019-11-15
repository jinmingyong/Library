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
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" type="text/css" href="css/search-form.css">
    <!-- Custom stylesheet - for your changes-->
    <!-- Favicon-->
    <link rel="stylesheet" href="css/zpageNav.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/input.css">
    <link rel="stylesheet" href="css/shortcode-common.css">
    <link rel="stylesheet" href="css/testimonial.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/sweetalert.css">





    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/vue.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/masonry-layout/masonry.pkgd.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/custom.js"></script>
<%--    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>--%>
    <script src="js/zpageNav.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/portamento-min.js"></script>
    <script src="js/sweetalert.min.js"></script>
    <script src="js/main.js"></script>
<%--    <script src="js/front.js"></script>--%>

</head>
<body>
<div id="all">
    <div class="container-fluid">

        <div class="row row-offcanvas row-offcanvas-left" style="height: 100%">
            <!--   *** SIDEBAR ***-->
            <div id="sidebar" class="col-md-3 col-lg-2 sidebar-offcanvas" style="background-color: #e2e6d5">
                <div class="sidebar-content">
                    <h1 class="sidebar-heading">评论及聊天</h1>
                    <ul class="sidebar-menu">
                        <!-- Link-->
                        <li class="sidebar-item"><a href="bookInuse/showAllbookjsp" class="sidebar-link">查看评论</a></li>
                        <!-- Link-->
                        <!-- Link-->
                        <li class="sidebar-item"><a href="chat/chatjsp" class="sidebar-link">开始聊天</a></li>
                        <li class="sidebar-item"><a href="r_booking.jsp" class="sidebar-link">预约书籍</a></li>
                        <li class="sidebar-item"><a href="login.jsp" class="sidebar-link">退出</a></li>
                    </ul>
                    <p class="social"><a href="#" data-animate-hover="pulse" class="external facebook"><i class="fa fa-facebook"></i></a><a href="#" data-animate-hover="pulse" class="external gplus"><i class="fa fa-google-plus"></i></a><a href="#" data-animate-hover="pulse" class="external twitter"><i class="fa fa-twitter"></i></a><a href="#" title="" class="external instagram"><i class="fa fa-instagram"></i></a><a href="#" data-animate-hover="pulse" class="email"><i class="fa fa-envelope"></i></a></p>
                </div>
            </div>
         <%--   <header id="mu-header" class="" role="banner">
                <div class="container">
                    <nav class="navbar navbar-default mu-navbar">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>

                                <!-- Text Logo -->
                                <a class="navbar-brand" href="index.html"><i class="fa fa-book" aria-hidden="true"></i> Kindle</a>

                                <!-- Image Logo -->
                                <!-- <a class="navbar-brand" href="index.html"><img src="assets/images/logo.png"></a> -->


                            </div>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav mu-menu navbar-right">
                                    <li><a href="#">HOME</a></li>
                                    <li><a href="#mu-book-overview">OVERVIEW</a></li>
                                    <li><a href="#mu-author">AUTHOR</a></li>
                                    <li><a href="#mu-pricing">PRICE</a></li>
                                    <li><a href="#mu-testimonials">TESTIMONIALS</a></li>
                                    <li><a href="#mu-contact">CONTACT</a></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>
                </div>
            </header>--%>
