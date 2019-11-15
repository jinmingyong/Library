<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/11/4
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册页</title>
</head>
    <!-- CSS -->

    <link rel="stylesheet" href="css/register.css" type="text/css">
   <body>
   <div id="show">
       <ul>
           <li>欢迎进行图书馆用户注册</li>
       </ul>
       <div id="main">
           <form class="registration-form">
               手机号：<input type="text" id="phone"><br>
               密&nbsp;码：<input type="password" id="password"><br>
               验证码:<input type="text" id="inputCode"><button type="button" id="btn">获取验证码</button><br>
               管理员：<input type="radio" name="r1" value="1">是
               <input type="radio" name="r1" value="2" checked="checked">否<br>
               <button type="button" id="btn1">提交</button>
           </form>
       </div>
   </div>
   <script src="js/jquery-1.12.4.js"></script>
   <script>
   </script>
   </body>







<!--[if lt IE 10]>

<![endif]-->


<script src="js/jquery-1.12.4.js"></script>
<script>
    $(function () {
        var phone;
        var code;
        $("#btn").click(function () {
            phone=$("#phone").val();
            if (phone!=""){
                if ((/^[1][3,4,5,7,8][0-9]{9}$/.test(phone))){
                    $.ajax({
                        url:"messageUtils/message",
                        data:{name:phone},
                        contentType:"application/json;charset=UTF-8",
                        type:"get",
                        dataType: "text",
                        success:function (data) {
                            code=data;
                            alert("发送成功！");
                        }
                    });
                }else {
                    alert("手机格式不正确！");
                }
            }else {
                alert("手机号不能为空！");
            }
        });
        $("#btn1").click(function () {
            //var phone=$("#phone").val();
            var checked=$("input[name='r1']:checked").val();
            console.log("选择值："+checked);
            var password=$("#password").val();
            var inputCode=$("#inputCode").val();
            if (phone!=""&&password!=""&&inputCode!=""&&checked!="") {
            if (code=="success"){
                    if (checked == "1") {
                        $.ajax({
                            url: "admin/checkAdmin",
                            data: {name: phone, password: password, inputCode: inputCode},
                            contentType: "application/json;charset=UTF-8",
                            type: "get",
                            dataType: "text",
                            success: function (data) {
                                if (data == "err") {
                                    alert("验证码不正确，亲！")
                                } else if (data == "err1") {
                                    alert("该号码已经注册！亲");
                                    window.location.reload();
                                } else if (data == "list") {
                                    window.location.href = "admin/saveAdminRigester?name=" + phone;
                                }
                            }
                        });
                    } else if (checked == "2") {
                        $.ajax({
                            url: "reader/checkPhone",
                            data: {name: phone, password: password, inputCode: inputCode},
                            contentType: "application/json;charset=UTF-8",
                            type: "get",
                            dataType: "text",
                            success: function (data) {
                                if (data == "err") {
                                    alert("验证码不正确，亲！")
                                } else if (data == "err1") {
                                    alert("该号码已经注册！亲");
                                    window.location.reload();
                                } else if (data == "list") {
                                    window.location.href = "reader/saveRegister?name=" + phone;
                                }
                            }
                        });
                    }
            } else {
                alert("验证码发送失败，请检查你的手机号码是否正确！");
            }
            }else {
                alert("您的手机号或者密码或者验证码或者选择没有操作！");
            }
        })
    });
</script>
</html>
