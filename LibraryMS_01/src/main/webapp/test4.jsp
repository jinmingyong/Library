<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

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
    <script src="js/vueWaterfallEasy.js"></script>
    <script src="js/test4.js"></script>
</head>


<body>
<div>
    <div class="container-fluid">
        <div class="card mb-3">
            <div class="card-header">
                <i class="fa fa-table"></i> 报废审核系统
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="container">
                        <div id="main">
                            <div id="tables" class="card mb-4">

                                <div class="card-header">
                                    报废管理
<%--                                    <span style="float:right;">添加报废书--%>
<%--                                        <input id="isbn" type="text" value="请输入isbn号" onfocus="if(value=='请输入isbn号')value=''" onblur="if(!value)value='请输入isbn号'" >--%>
<%--                                        <button id="add" type="button" class="btn btn-primary mb-2">添加</button>--%>
<%--                                    </span>--%>
                                </div>

                                <div class="card-body">
                                    <table  class="table table-hover table-bordered">
                                        <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>isbn</th>
                                            <th>损毁日期</th>
                                            <th>损毁数量</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody id="tb">
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

<body>
<%--<div id="tables" class="card mb-4">--%>
    <%--<div class="card-header">报废审核</div>--%>
    <%--<div class="card-body">--%>
        <%--<table  class="table table-hover table-bordered">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th>id</th>--%>
                <%--<th>isbn</th>--%>
                <%--<th>损毁日期</th>--%>
                <%--<th>损毁数量</th>--%>
                <%--<th>操作</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody id="tb">--%>
            <%--</tbody>--%>
        <%--</table>--%>
    <%--</div>--%>
</div>



</body>

</html>
