
<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/11/2
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="responsive, template, portfolio, html, css, javascript, Theme" />
    <meta name="author" content="">
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1" />
    <title>Alpha UI Kit - Documentation</title>

    <!--favicon icon-->
    <link rel="icon" href="images/favicon.png">

    <!--google font-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900" rel="stylesheet">

    <!-- font awesome css -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- iconmind icon css -->
    <link rel="stylesheet" href="css/iconmind-line.css">

    <!--bootstrap min css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!--owl carousel min css-->
    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!--nice select css-->
    <link rel="stylesheet" href="css/nice-select.css">

    <!--Padding margin css-->
    <link rel="stylesheet" href="css/padding.margin.css">


    <!-- style css -->
    <link rel="stylesheet" href="css/asset/shortcode-common.css">
    <link rel="stylesheet" href="css/asset/typography.css">
    <link rel="stylesheet" href="css/asset/accordion.css">
    <link rel="stylesheet" href="css/asset/alert.css">
    <link rel="stylesheet" href="css/asset/button.css">
    <link rel="stylesheet" href="css/asset/input.css">
    <link rel="stylesheet" href="css/asset/c2action.css">
    <link rel="stylesheet" href="css/asset/testimonial.css">
    <link rel="stylesheet" href="css/asset/carousel.css">
    <link rel="stylesheet" href="css/asset/client.css">
    <link rel="stylesheet" href="css/asset/color.css">
    <link rel="stylesheet" href="css/asset/faq.css">
    <link rel="stylesheet" href="css/asset/grid-systerm.css">
    <link rel="stylesheet" href="css/asset/pricing.css">
    <link rel="stylesheet" href="css/asset/progressbar.css">
    <link rel="stylesheet" href="css/asset/table.css">
    <link rel="stylesheet" href="css/asset/tab.css">
    <link rel="stylesheet" href="css/asset/team.css">
    <link rel="stylesheet" href="css/asset/testimonial.css">
    <link rel="stylesheet" href="css/asset/navbar.css">

    <!--responsive css-->
    <link rel="stylesheet" href="css/asset/shortcode-responsive.css">

    <link rel="stylesheet" href="css/asset/style1.css">

</head>

<body class="spresentation">
<!-- =========================================Start header section== =======================================-->
<header class="presentation_header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2">
                <a href="#" class="logo">欢迎${reader.rname}${admin.a_name}</a>
            </div>
        </div>
    </div>
</header>
<!-- =========================================End header section=========================================-->


<!-- =========================================Start Sidebar section== =======================================-->
<%--<div class="presentation_sidebar">--%>
    <%--<div class="toggle_arrow">--%>
        <%--<i class="fa fa-angle-left"></i>--%>
        <%--<i class="fa fa-angle-right"></i>--%>
    <%--</div>--%>
    <%--<ul>--%>
        <%--<li><a href="#typography" class="anchor">Typography</a></li>--%>
        <%--<li><a href="#color" class="anchor">color</a></li>--%>
        <%--<li><a href="#grid" class="anchor">Grid system</a></li>--%>
        <%--<li><a href="#button" class="anchor">button</a></li>--%>
        <%--<li><a href="#navigation_nav" class="anchor">Navbar Menu</a></li>--%>
        <%--<li><a href="#input" class="anchor">inputs</a></li>--%>
        <%--<li><a href="#alert" class="anchor">alert</a></li>--%>
        <%--<li><a href="#progress" class="anchor">progress bar</a></li>--%>
        <%--<li><a href="#table" class="anchor">Table</a></li>--%>
        <%--<li><a href="#accordion" class="anchor">accordion</a></li>--%>
        <%--<li><a href="#testimonial" class="anchor">testimonial</a></li>--%>
        <%--<li><a href="#carousel" class="anchor">carousel</a></li>--%>
        <%--<li><a href="#pricing" class="anchor">pricing</a></li>--%>
        <%--<li><a href="#c2a" class="anchor">call to action</a></li>--%>
        <%--<li><a href="#client" class="anchor">client</a></li>--%>
        <%--<li><a href="#team" class="anchor">team</a></li>--%>
        <%--<li><a href="#faq" class="anchor">faq</a></li>--%>
        <%--<li><a href="#tab" class="anchor">tab</a></li>--%>
    <%--</ul>--%>
<%--</div>--%>
<!-- =========================================End Sidebar section=========================================-->



<!-- =========================================Start typography section=========================================-->
<section id="typography">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="pt_50">用户信息</h1>
                <span class="sectionSubtitle mb_50 pb_10 d_block fw_300">来查看自己的信息哟！</span>
            </div>
        </div>
    </div>

    <section class="flick_hedding">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="single_hedding">
                        <h3 class="fw_300">姓名：${reader.rname}</h3>
                        <h3 class="fw_300">学号：${reader.readId}</h3>
                        <h3 class="fw_300">邮箱：${reader.remail}</h3>
                        <h3 class="fw_300">手机：${reader.rphone}</h3>
                        <h3 class="fw_300">性别：${reader.rsex}</h3>
                        <h3 class="fw_300">地址：${reader.raddress}</h3>
                        <h3 class="fw_300">信誉分：${reader.credit}</h3>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="single_hedding">
                        <div class="single_hedding">
                            <h1 class="fw_300">头像</h1>
                            <img src="images/${reader.image}"/>
                        </div>
                    </div>
                    <button type="button" class=" flick btn btn-primary btn-lg" data-toggle="modal" data-target=".heddingbold">See Code</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Modal-1 -->
    <div class="modal fade bs-example-modal-lg heddinglight" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">管理员信息</h4>
                </div>
                <div class="modal-body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#html" aria-controls="home" role="tab" data-toggle="tab">HTML</a></li>
                        <li role="presentation"><a href="#file" aria-controls="settings" role="tab" data-toggle="tab">Necessary File</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="html">

                            <xmp>
                                <h3 class="fw_300">序列号：${admin.id}</h3>
                                <h3 class="fw_300">编号：${admin.a_id}</h3>
                                <h3 class="fw_300">名称：${admin.a_name}</h3>
                                <h3 class="fw_300">手机号：${admin.phoneNum}</h3>
                                <h3 class="fw_300">类别：${admin.type}</h3>
                            </xmp>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="file">

                        </div>
                    </div>
                    <!--/tab pane-->
                </div>
                <!--/modal body-->
            </div>
        </div>
    </div>
    <!--/modal-1-->

    <!-- Modal-2 -->
    <div class="modal fade bs-example-modal-lg heddingbold" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Hedding Typography(Bold)</h4>
                </div>
                <div class="modal-body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#htmlbold" aria-controls="home" role="tab" data-toggle="tab">HTML</a></li>
                        <li role="presentation"><a href="#filebold" aria-controls="settings" role="tab" data-toggle="tab">Necessary File</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="htmlbold">
                            <xmp>
                                <h1 class="fw_700">H1 Heading Bold</h1>
                                <h2 class="fw_700">H2 Heading Bold</h2>
                                <h3 class="fw_700">H3 Heading Bold</h3>
                                <h4 class="fw_700">H4 Heading Bold</h4>
                                <h5 class="fw_700">H5 Heading Bold</h5>
                                <h6 class="fw_700">H6 Heading Bold</h6>
                            </xmp>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="filebold">
                            Include these file for this Output<br/>
                            1. shortcode-common.css<br/>
                            2. typography.css
                        </div>
                    </div>
                    <!--/tab pane-->
                </div>
                <!--/modal body-->
            </div>
        </div>
    </div>
    <!--/modal-2-->

    <section class="flick_paragraph pt_70 pb_90">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="single_paragraph">
                        <h3>管理员</h3>
                        <h3 class="fw_300">序列号：${admin.id}</h3>
                        <h3 class="fw_300">编号：${admin.a_id}</h3>
                        <h3 class="fw_300">名称：${admin.a_name}</h3>
                        <h3 class="fw_300">手机号：${admin.phoneNum}</h3>
                        <h3 class="fw_300">类别：${admin.type}</h3>
                        <p class="color_88 fw_300">
                            头像
                            <img src="images/${admin.headImage}">
                        </p>
                    </div>
                    <button type="button" class=" flick btn btn-primary btn-lg" data-toggle="modal" data-target=".peralight">See Code</button>
                </div>
                <div class="col-md-6">
                    <div class="single_paragraph">
                        <h3 class="color_22 fw_700">Example Heading Bold</h3>
                        <p class="color_88 fw_400">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
                    </div>
                    <button type="button" class=" flick btn btn-primary btn-lg" data-toggle="modal" data-target=".perabold">See Code</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Modal-3 -->
    <div class="modal fade bs-example-modal-lg peralight" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Paragraph Typography(Light)</h4>
                </div>
                <div class="modal-body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#perahtml" aria-controls="home" role="tab" data-toggle="tab">HTML</a></li>
                        <li role="presentation"><a href="#perafile" aria-controls="settings" role="tab" data-toggle="tab">Necessary File</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="perahtml">
                            <xmp>
                                <p class="color_88 fw_300"> </p>
                            </xmp>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="perafile">
                            Include these file for this Output<br/>
                            1. shortcode-common.css<br/>
                            2. typography.css
                        </div>
                    </div>
                    <!--/tab pane-->
                </div>
                <!--/modal body-->
            </div>
        </div>
    </div>
    <!--/modal-3-->

    <!-- Modal-4 -->
    <div class="modal fade bs-example-modal-lg perabold" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Paragraph Typography(Light)</h4>
                </div>
                <div class="modal-body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#pera2html" aria-controls="home" role="tab" data-toggle="tab">HTML</a></li>
                        <li role="presentation"><a href="#pera2file" aria-controls="settings" role="tab" data-toggle="tab">Necessary File</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="pera2html">
                            <xmp>
                                <p class="color_88 fw_400"> </p>
                            </xmp>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="pera2file">
                            Include these file for this Output<br/>
                            1. shortcode-common.css<br/>
                            2. typography.css
                        </div>
                    </div>
                    <!--/tab pane-->
                </div>
                <!--/modal body-->
            </div>
        </div>
    </div>
    <!--/modal-4-->
</section>
</body>

</html>
