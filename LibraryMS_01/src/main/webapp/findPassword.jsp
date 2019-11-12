<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2019/11/5
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="js/jquery-1.12.4.js"></script>
<head>
    <title>密码找回</title>
</head>
<link href="css/findPassword.css" rel="stylesheet">
<body>
<div id="taskList">
    <ul id="ul">
        <li>学生找回</li>
        <li>管理员找回</li>
    </ul>
    <div id="show">
        <form id="form">
            手机号：<input type="text" id="phone" placeholder="学生手机号"><br>
            验证码：<input type="text" id="inputCode"><button type="button" id="btn">获取验证码</button><br>
            新的密码：<input type="password" id="pw1"><br>
            再次确认密码：<input type="password" id="pw2"><br>
            <button type="button" id="btn2">提交</button>
            <input id="reset" type="reset" value="重置">
        </form>
        <form id="form1">
            手机号：<input type="text" id="phone1" placeholder="管理员手机号"><br>
            验证码：<input type="text" id="inputCode1"><button type="button" id="btn1">获取验证码</button><br>
            新的密码：<input type="password" id="pw11"><br>
            再次确认密码：<input type="password" id="pw22"><br>
            <button type="button" id="btn22">提交</button>
            <input id="reset1" type="reset" value="重置">
        </form>
    </div>
</div>
</body>

<script>
    $(function () {
        $("#form1").hide();
        $("#ul li:first").bind("click",bg1=function(){
            $("#form").show();
            $("#form1").hide();
        });
        $("#ul li:last").bind("click",bg2=function(){
            $("#form").hide();
            $("#form1").show();
        });
        $("#btn").click(function () {
            var phone1;
            var code;
            phone1 = $("#phone").val();
            console.log("手机号：" + phone1);
            $.ajax({
                url: "messageUtils/message",
                data: {name: phone1},
                contentType: "application/json;charset=UTF-8",
                type: "get",
                dataType: "text",
                success: function (data) {
                    console.log(data);
                    if (data!="success"){
                        alert("消息发送失败！");
                    }
                }
            });
    });
       $("#btn2").click(function () {
           var phone12=$("#phone").val();
           var pw1=$("#pw1").val();
           var pw2=$("#pw2").val();
           var inputCode=$("#inputCode").val();
           if (phone12!=null&&pw1!=null&&pw2!=null&&inputCode!=null) {
           if (pw1==pw2){
               $.ajax({
                   url:"reader/findReaderPassword",
                   data:{name:phone12,password:pw1,inputCode:inputCode},
                   contentType: "application/json;charset=UTF-8",
                   type: "get",
                   dataType: "text",
                   success: function (data) {
                       if(data=="list"){
                           alert("修改成功！");
                           window.location.href="reader/updateReaderPassword?name="+phone12;
                       }else if (data=="update"){
                           alert("不能与上次密码一致！");
                       } else {
                           alert("两次密码不一致！");
                       }
                   }
               })
           } else {
               alert("您的两次密码不一致！");
           }
           }else {
               alert("此处全部为必填项！");
           }
       });
        $("#btn1").click(function () {
            var phone11;
            phone11 = $("#phone1").val();
            console.log("手机号：" + phone11);
            $.ajax({
                url: "messageUtils/message",
                data: {name: phone11},
                contentType: "application/json;charset=UTF-8",
                type: "get",
                dataType: "text",
                success: function (data) {
                    console.log(data);
                    if (data!="success"){
                        alert("消息发送失败！");
                    }
                }
            });
    });
        $("#btn22").click(function () {
            var phone123=$("#phone1").val();
            var pw11=$("#pw11").val();
            var pw22=$("#pw22").val();
            var inputCode1=$("#inputCode1").val();
            if (pw11==pw22){
                $.ajax({
                    url:"admin/findAdminPassword",
                    data:{name:phone123,password:pw11,inputCode:inputCode1},
                    contentType: "application/json;charset=UTF-8",
                    type: "get",
                    dataType: "text",
                    success: function (data) {
                        if(data=="list"){
                            alert("修改成功！");
                            window.location.href="admin/updateAdminPassword?name="+phone123;
                        }else if (data=="update"){
                            alert("不能与上次密码一致！");
                        } else {
                            alert("两次密码不一致！");
                        }
                    }
                })
            } else {
                alert("您的两次密码不一致！");
            }
        });
    });

</script>
</html>
