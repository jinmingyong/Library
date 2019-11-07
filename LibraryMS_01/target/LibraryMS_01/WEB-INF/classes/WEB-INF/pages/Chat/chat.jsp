<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/11/4
  Time: 1:33
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
    <title>Title</title>

    <style type="text/css">
        .talk_con{
            width:600px;
            height:540px;
            border:1px solid #666;
            margin:50px auto 0;
            background:#f9f9f9;
        }
        .talk_show{
            width:580px;
            height:420px;
            border:1px solid #666;
            background:#fff;
            margin:10px auto 0;
            overflow:auto;
        }
        .talk_input{
            width:580px;
            margin:10px auto 0;
        }
        .whotalk{
            width:80px;
            height:30px;
            float:left;
            outline:none;
        }
        .talk_word{
            width:500px;
            height:80px;
            padding:0px;
            float:left;
            outline:none;
            text-indent:10px;
        }
        .talk_sub{
            width:56px;
            height:30px;
            float:left;
            margin-left:10px;
        }
        .atalk{
            margin:10px;
        }
        .atalk span{
            display:inline-block;
            background:#0181cc;
            border-radius:10px;
            color:#fff;
            padding:5px 10px;
        }
        .btalk{
            margin:10px;
            text-align:right;
        }
        .btalk span{
            display:inline-block;
            background:#ef8201;
            border-radius:10px;
            color:#fff;
            padding:5px 10px;
        }
    </style>
</head>

<body>
${reader.readId}
<div class="talk_con">
    <div class="talk_show" id="words">
    </div>
    <div class="talk_input">
        <textarea class="talk_word" id="text" required maxlength="50"></textarea>
        <input type="button" value="发送" class="talk_sub" id="talksub" onclick="send()">
    </div>
</div>



</body>

<script type="text/javascript">
    document.onkeydown = function (e) { // 回车提交表单
// 兼容FF和IE和Opera
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
        if (code == 13) {
            send();
        }
    }
    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket('ws://localhost:8080/ws');
    }
    else {
        alert('当前浏览器 Not support websocket')
    }

    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function () {
        setMessageInnerHTML("WebSocket连接成功");
    }

    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        var msg=event.data;
        msg=JSON.parse(msg);
        console.log(msg);
        var str="";
        var Who=msg.rid;
        console.log(msg)
        if(Who!=${reader.readId}){
            //如果Who.value为0n那么是 A说
            str = '<div class="atalk"><span>'+msg.reader.rname+' :' + msg.context +'</span></div>';
        }
        else{
            str = '<div class="btalk"><span>'+msg.reader.rname+':' + msg.context +'</span></div>' ;
        }
        setMessageInnerHTML(str);


    }

    //连接关闭的回调方法
    websocket.onclose = function () {
        setMessageInnerHTML("WebSocket连接关闭");
    }

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }

    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        var Words = document.getElementById("words");
        Words.innerHTML = Words.innerHTML + innerHTML;
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //发送消息
    function send() {
        var msg = document.getElementById('text').value;
        var rid=${reader.readId}
        var rname=${reader.readId}
        var pid=1
        var data = {
            "readId":rid,
            "pid":1,
            "context":msg
        };
        document.getElementById('text').value="";
        websocket.send(JSON.stringify(data));
    }
</script>
</html>
