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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Roboto-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,400italic">
    <!-- owl carousel-->
<%--    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">--%>
    <!-- theme stylesheet-->
<%--    <link rel="stylesheet" type="text/css" href="css/style.css">--%>
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
      <link rel="stylesheet" href="css/style.green.css">
    <link rel="stylesheet" href="css/sweetalert.css">



    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/vue.js"></script>
<%--    <script src="vendor/popper.js/umd/popper.min.js"> </script>--%>
    <script src="js/bootstrap.min.js"></script>
<%--    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>--%>
<%--    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>--%>
    <script src="vendor/masonry-layout/masonry.pkgd.min.js"></script>
<%--    <script src="js/slick.min.js"></script>
    <script src="js/custom.js"></script>--%>
<%--    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>--%>
    <script src="js/zpageNav.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/portamento-min.js"></script>
    <script src="js/sweetalert.min.js"></script>
<%--    <script src="js/main.js"></script>--%>
<%--    <script src="js/front.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            var trigger = $('.hamburger'),
                overlay = $('.overlay'),
                isClosed = false;

            trigger.click(function () {
                hamburger_cross();
            });

            function hamburger_cross() {

                if (isClosed == true) {
                    overlay.hide();
                    trigger.removeClass('is-open');
                    trigger.addClass('is-closed');
                    isClosed = false;
                } else {
                    overlay.show();
                    trigger.removeClass('is-closed');
                    trigger.addClass('is-open');
                    isClosed = true;
                }
            }

            $('[data-toggle="offcanvas"]').click(function () {
                $('#wrapper').toggleClass('toggled');
            });
        });
    </script>
    <style>
        li{
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div id="wrapper">
    <div class="overlay"></div>

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
        <ul class="nav sidebar-nav">
            <li class="sidebar-brand">
                <h4 style="color: white">
                   欢迎${reader.rname}
                </h4>
            </li>
            <li>
                <a href="bookInuse/showAllbookjsp" style="font-size: 20px"><i class="fa fa-home"></i>  主页</a>
            </li>
            <li>
                <a href="chat/chatjsp" style="font-size: 20px"><i class="fa fa-fw fa-comment"></i> 进入聊天</a>
            </li>
            <li>
                <a href="r_booking.jsp" style="font-size: 20px"><i class="fa fa-fw fa-book"></i> 预约书籍</a>
            </li>
            <li>
                <a href="login.jsp" style="font-size: 20px"><i class="fa fa-fw fa-sign-out"></i> 退出</a>
            </li>
        </ul>
    </nav>
    <!-- /#sidebar-wrapper -->

        <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"></span>
        </button>
    <!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="container">
        <div class="row row-offcanvas row-offcanvas-left" style="height: 100%">
            <!--   *** SIDEBAR ***-->
            <%--   <div id="sidebar" class="col-md-3 col-lg-2 sidebar-offcanvas" style="background-color: #e2e6d5">
                   <div class="sidebar-content">
                       <h1 class="sidebar-heading">评论及聊天</h1>
                       <ul class="sidebar-menu">
                           <!-- Link-->
                           <li class="sidebar-item"><a href="bookInuse/showAllbookjsp" class="sidebar-link">查看评论</a></li>
                           <li class="sidebar-item"><a href="chat/chatjsp" class="sidebar-link">开始聊天</a></li>
                           <li class="sidebar-item"><a href="r_booking.jsp" class="sidebar-link">预约书籍</a></li>
                           <li class="sidebar-item"><a href="login.jsp" class="sidebar-link">退出</a></li>
                       </ul>
                       <p class="social"><a href="#" data-animate-hover="pulse" class="external facebook"><i class="fa fa-facebook"></i></a><a href="#" data-animate-hover="pulse" class="external gplus"><i class="fa fa-google-plus"></i></a><a href="#" data-animate-hover="pulse" class="external twitter"><i class="fa fa-twitter"></i></a><a href="#" title="" class="external instagram"><i class="fa fa-instagram"></i></a><a href="#" data-animate-hover="pulse" class="email"><i class="fa fa-envelope"></i></a></p>
                   </div>
               </div>--%>
