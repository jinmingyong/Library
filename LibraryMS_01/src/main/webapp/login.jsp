<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/11/2
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="js/jquery-1.12.4.js"></script>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录界面</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/form-elements.css">
    <link rel="stylesheet" href="css/style.blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/sweetalert.css">
    <script src="js/sweetalert.min.js"></script>

</head>
<script type="text/javascript">
    $(function(){
        if(window.history && window.history.pushState){
            $(window).on("popstate", function(){
                window.history.pushState("forward", null, "#");
                window.history.forward(1);
            });
        }
        window.history.pushState("forward", null, "#"); //在IE中必须得有这两行
        window.history.forward(1);
    });
</script>

<body>
<%
    session.invalidate();
%>
<!-- Content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>欢迎进入</strong> 图书管理系统</h1>
                    <div class="description">
                        <p>
                            我们欢迎每位学子能够在本图书管理系统的帮助下学到更多。
                            <strong>好好学习，天天向上</strong>
                        </p>
                    </div>
                    <div class="top-big-link">
                        <a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-register">点击我登录</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- MODAL -->
<div class="modal fade" id="modal-register" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
    <div class="modal-dialog" style="margin-top: 100px">
        <div class="modal-content" >

            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal">--%>
                    <%--<span aria-hidden="true">&times;</span><span class="sr-only">close</span>--%>
                <%--</button>--%>
                <h3 class="modal-title" id="modal-register-label" style="margin: 0 auto">登录</h3>
                <%--<p>进入系统进行你的书海畅游吧！</p>--%>
            </div>

            <div class="modal-body" >

                <div id="taskList">
                    <ul id="ul">
                        <li id="l1">学生登录</li><li id="l2">管理员登录</li>
                    </ul>
                    <div id="show">
                        <form id="form1" class="registration-form">
                            用户名：<input type="text" id="name" name="name" placeholder="学生手机号/邮箱"><br>
                            密&nbsp;&nbsp;&nbsp;码：<input type="password" id="password" name="password"><br>
                            验证码：<input type='text' name='inputCode' id="inputCode" /><img id="image" src="verifyCodeServlet/VerifyCodeServlet"><input type="button"  value="看不清楚？换一张" id="btn"> <br/>
                            <a href="findPassword.jsp">忘记密码？</a><br>
                            <button id="btnLogin" type="button">登录</button><br>
                            <button id="b1"><a href="register.jsp">注册</a></button>
                        </form>
                        <form id="form2" class="registration-form">
                            用户名：<input type="text" id="name1"  placeholder="管理员手机号/邮箱"><br>
                            密&nbsp;&nbsp;&nbsp;码：<input type="password" id="password1" ><br>
                            验证码：<input type="text" id="inputCode1" ><img id="image1" src="verifyCodeServlet/VerifyCodeServlet"><input type="button" value="看不清楚？换一张" id="btn1"> <br/>
                            <a href="findPassword.jsp">忘记密码？</a><br>
                            <input id="btnLogin1" type="button" value="登录"><br>
                            <button id="b2"><a href="register.jsp">注册</a></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Javascript -->
<script src="js/jquery-1.12.4.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="js/jquery.backstretch.min.js"></script>
<script src="js/scripts.js"></script>

<!--[if lt IE 10]>
<script src="js/placeholder.js"></script>
<![endif]-->

</body>
<script>
    console.log("456")
    $(function () {
        $("#form2").hide();
        $("#ul li:first").bind("click",bg1=function(){
            $("#form1").show();
            $("#form2").hide();
            $("#l1").height("45");
            $("#l2").height("40");
        });
        $("#ul li:last").bind("click",bg2=function(){
            $("#form1").hide();
            $("#form2").show();
            $("#l1").height("40");
            $("#l2").height("45");
        });
        $("#btnLogin").click(function () {
            var checkPhone="^[1][3,4,5,7,8][0-9]{9}$";
            var checkEmail="^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            var name=$("#name").val();
            var password=$("#password").val();
            var inputCode=$("#inputCode").val();
            if(name!=""&&password!=""&&inputCode!=""){
                if ((/^[1][3,4,5,7,8][0-9]{9}$/.test(name))||(/^([a-z0-9A-Z]+[-|_|\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-zA-Z]{2,}$/.test(name))){
                    $.ajax({
                        url:"reader/ReaderLogin",
                        contentType:"application/json;charset=UTF-8",
                        data:{name:name,password:password,inputCode:inputCode},
                        type:"get",
                        dataType: "text",
                        success:function (data) {
                            if (data=="msg"){
                                Swal.fire({
                                    icon: 'error',
                                    title: '请求出错!',
                                    text: '您的验证码错误！',
                                })
                            }else if(data=="err"){
                                Swal.fire({
                                    icon: 'error',
                                    title: '请求出错!',
                                    text: '您的账户或者密码错误！',
                                })
                            }else if (data=="list") {
                                window.location.href="reader/findByReader?name="+name+"&password="+password+"&inputCode="+inputCode;
                            }else if (data=="err1"){
                                Swal.fire({
                                    icon: 'error',
                                    title: '请求出错!',
                                    text: '您的账户没有注册！',
                                });
                            }
                        }
                    })
                }else {
                    Swal.fire({
                        icon: 'error',
                        title: '请求出错!',
                        text: '手机或者邮箱格式不正确！',
                    })
                }
            }else {
                Swal.fire({
                    icon: 'error',
                    title: '请求出错!',
                    text: '用户名或者密码或者验证码没有填写！',
                })
            }

        });
        $("#btnLogin1").click(function () {
            var name1=$("#name1").val();
            var password1=$("#password1").val();
            var inputCode1=$("#inputCode1").val();
            if (name1!=""&&password1!=""&&inputCode1!="") {
                if ((/^[1][3,4,5,7,8][0-9]{9}$/.test(name1))||(/^([a-z0-9A-Z]+[-|_|\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-zA-Z]{2,}$/.test(name1))) {
                    $.ajax({
                        url: "admin/findInputCode",
                        contentType: "application/json;charset=UTF-8",
                        data: {name1: name1, password1: password1, inputCode1: inputCode1},
                        type: "get",
                        dataType: "text",
                        success: function (data) {
                            if (data == "msg1") {
                                Swal.fire({
                                    icon: 'error',
                                    title: '请求出错!',
                                    text: '您的验证码错误！',
                                })
                            } else if (data == "err1") {
                                Swal.fire({
                                    icon: 'error',
                                    title: '请求出错!',
                                    text: '您的账户或者密码错误！',
                                })
                            } else if (data == "list1") {
                                window.location.href = "admin/findByAdmin?name=" + name1 + "&password=" + password1 + "&inputCode=" + inputCode1;
                            }else if (data=="err"){
                                Swal.fire({
                                    icon: 'error',
                                    title: '请求出错!',
                                    text: '您的账户没有注册！',
                                });
                            }else if (data=="msg"){
                                Swal.fire({
                                    icon: 'error',
                                    title: '请求出错!',
                                    text: '您的账户还没有审核通过！',
                                });
                            }
                        }
                    })
                }else {
                    Swal.fire({
                        icon: 'error',
                        title: '请求出错!',
                        text: '手机号或者邮箱格式不正确！',
                    })
                }
            }else {
                Swal.fire({
                    icon: 'error',
                    title: '请求出错!',
                    text: '！用户名或者密码或者验证码没有填写',
                })
            }

        });
        $("#btn").click(function () {
            $("#image").attr("src","verifyCodeServlet/VerifyCodeServlet?time=" + new Date().getTime());
        });
        $("#btn1").click(function () {
            $("#image1").attr("src","verifyCodeServlet/VerifyCodeServlet?time="+ new Date().getTime());
        });
    })
</script>

</html>
