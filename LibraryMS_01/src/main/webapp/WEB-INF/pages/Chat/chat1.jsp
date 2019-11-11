<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/11/10
  Time: 14:38
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
    1111
    <!-- Bundle Styles -->
    <link rel="stylesheet" href="/css/bundle.css">

    <link rel="stylesheet" href="/css/enjoyhint.css">

    <!-- App styles -->
    <link rel="stylesheet" href="/css/app.min.css">
</head>
<body>
<!-- page loading -->
<div class="page-loading"></div>
<!-- ./ page loading -->

<!-- page tour modal -->
<%--<div class="modal fade" id="pageTour" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-body text-center pt-5">
                <div class="row">
                    <div class="col-md-6 offset-3">
                        <figure>
                            <img src="dist/media/svg/undraw_product_tour_foyt.svg" class="img-fluid" alt="image">
                        </figure>
                        <p class="lead mt-5">Would you like to take a short page tour?</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-primary start-tour">Start Tour</button>
                <button type="button" class="btn btn-link" data-dismiss="modal" aria-label="Close">Close</button>
            </div>
        </div>
    </div>
</div>--%>
<!-- ./ page tour modal -->

<!-- disconnected modal -->
<div class="modal fade" id="disconnected" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row mb-5">
                    <div class="col-md-6 offset-3">
                        <img src="./dist/media/svg/undraw_warning_cyit.svg" class="img-fluid" alt="image">
                    </div>
                </div>
                <p class="lead text-center">Application disconnected</p>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-success btn-lg">Reconnect</button>
                <a href="login.html" class="btn btn-link">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- ./ disconnected modal -->
<!-- layout -->
<div class="layout" id="myVue">
    <!-- content -->
    <div class="content">

        <!-- sidebar group -->
        <div class="sidebar-group">

            <!-- Chats sidebar -->
            <div id="chats" class="sidebar active">
                <header>
                    <span>Chats</span>
                </header>
                <form>
                    <input type="text" class="form-control" placeholder="Search chats">
                </form>
                <div class="sidebar-body">
                    <ul class="list-group list-group-flush" id="readerlist">
                        <li class="list-group-item">
                            <figure class="avatar avatar-state-success">
                                <img src="./dist/media/img/man_avatar1.jpg" class="rounded-circle" alt="image">
                            </figure>
                            <div class="users-list-body">
                                <div>
                                    <h5 class="text-primary">Townsend Seary</h5>
                                    <p>What's up, how are you?</p>
                                </div>
                                <div class="users-list-action">
                                    <div class="new-message-count">3</div>
                                    <small class="text-primary">03:41 PM</small>
                                </div>
                            </div>
                        </li>
<%--                        <li class="list-group-item">
                            <figure class="avatar avatar-state-warning">
                                <img src="./dist/media/img/man_avatar4.jpg" class="rounded-circle" alt="image">
                            </figure>
                            <div class="users-list-body">
                                <div>
                                    <h5 class="text-primary">Forest Kroch</h5>
                                    <p>
                                        <i class="fa fa-camera mr-1"></i> Photo
                                    </p>
                                </div>
                                <div class="users-list-action">
                                    <div class="new-message-count">1</div>
                                    <small class="text-primary">Yesterday</small>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item open-chat">
                            <div>
                                <figure class="avatar">
                                    <img src="./dist/media/img/man_avatar3.jpg" class="rounded-circle" alt="image">
                                </figure>
                            </div>
                            <div class="users-list-body">
                                <div>
                                    <h5>Byrom Guittet</h5>
                                    <p>I sent you all the files. Good luck with 😃</p>
                                </div>
                                <div class="users-list-action">
                                    <small class="text-muted">11:05 AM</small>
                                </div>
                            </div>
                        </li>--%>
                    </ul>
                </div>
            </div>
        </div>
        <!-- ./ sidebar group -->
        <!-- chat -->
        <div class="chat">
            <div class="chat-header">
                <div class="chat-header-user">
                    <figure class="avatar">
                        <img src="./dist/media/img/man_avatar3.jpg" class="rounded-circle" alt="image">
                    </figure>
                    <div>
                        <h5>Byrom Guittet</h5>
                        <small class="text-success">
                            <i>writing...</i>
                        </small>
                    </div>
                </div>
                <div class="chat-header-action">

                </div>
            </div>
            <div class="chat-body"> <!-- .no-message -->
                <!--
                <div class="no-message-container">
                    <div class="row mb-5">
                        <div class="col-md-4 offset-4">
                            <img src="./dist/media/svg/undraw_empty_xct9.svg" class="img-fluid" alt="image">
                        </div>
                    </div>
                    <p class="lead">Select a chat to read messages</p>
                </div>
                -->
                <div class="messages">
                    <div class="message-item outgoing-message">
                        <div class="message-avatar">
                            <figure class="avatar">
                                <img src="./dist/media/img/women_avatar5.jpg" class="rounded-circle" alt="image">
                            </figure>
                            <div>
                                <h5>Mirabelle Tow</h5>
                                <div class="time">01:20 PM <i class="ti-double-check text-info"></i></div>
                            </div>
                        </div>
                        <div class="message-content">
                            Hello how are you?
                        </div>
                    </div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar">
                                <img src="./dist/media/img/man_avatar3.jpg" class="rounded-circle" alt="image">
                            </figure>
                            <div>
                                <h5>Byrom Guittet</h5>
                                <div class="time">01:35 PM</div>
                            </div>
                        </div>
                        <div class="message-content">
                            I'm fine, how are you 😃
                        </div>
                    </div>
                    <div class="message-item outgoing-message">
                        <div class="message-avatar">
                            <figure class="avatar">
                                <img src="./dist/media/img/women_avatar5.jpg" class="rounded-circle" alt="image">
                            </figure>
                            <div>
                                <h5>Mirabelle Tow</h5>
                                <div class="time">05:31 PM <i class="ti-double-check text-info"></i></div>
                            </div>
                        </div>
                        <div class="message-content">
                            I'm fine thank you. I expect you to send me some files.
                        </div>
                    </div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar">
                                <img src="./dist/media/img/man_avatar3.jpg" class="rounded-circle" alt="image">
                            </figure>
                            <div>
                                <h5>Byrom Guittet</h5>
                                <div class="time">10:12 PM</div>
                            </div>
                        </div>
                        <div class="message-content">
                            What files are you talking about? I'm sorry I can't remember right now.
                        </div>
                    </div>

                </div>
            </div>
            <div class="chat-footer">
                <form>
                    <input type="text" id="context" class="form-control" placeholder="Write a message.">
                    <div class="form-buttons">
                        <button class="btn btn-primary" type="button" id="btn">
                            <i data-feather="send"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- ./ chat -->

        <div class="sidebar-group">
            <div id="contact-information" class="sidebar">
                <header>
                    <span>Profile</span>
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <a href="#" class="btn btn-outline-light text-danger sidebar-close">
                                <i data-feather="x"></i>
                            </a>
                        </li>
                    </ul>
                </header>
                <div class="sidebar-body">
                    <div class="pl-4 pr-4">
                        <div class="text-center">
                            <figure class="avatar avatar-xl mb-4">
                                <img src="./dist/media/img/women_avatar5.jpg" class="rounded-circle" alt="image">
                            </figure>
                            <h5 class="mb-1">Mirabelle Tow</h5>
                            <small class="text-muted font-italic">Last seen: Today</small>

                            <ul class="nav nav-tabs justify-content-center mt-5" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                       aria-controls="home" aria-selected="true">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                                       aria-controls="profile" aria-selected="false">Media</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- ./ content -->
</div>
<!-- ./ layout -->
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bundle.js"></script>
<script src="js/feather.min.js"></script>
<script src="js/enjoyhint.min.js"></script>
<!-- App scripts -->
<script src="js/app.min.js"></script>
<script src="js/vue.js"></script>
<script>
</script>
<script>
    var readers=[];
  /*  new Vue({
        el:'#myVue',
        data:{
            readerArr:{}
        },
        watch:{
            readerArr: function () {
                this.updateReaders
            }
        },
        methods:{
            updateReaders:function () {
                alert(this.readerArr)
            }
        },
        created:function () {

        },
    })*/
    $(function () {

        var SohoExamle = {
            Message: {
                add: function (message, type) {
                    var chat_body = $('.layout .content .chat .chat-body');
                    if (chat_body.length > 0) {

                        type = type ? type : '';

                        $('.layout .content .chat .chat-body .messages').append(`<div class="message-item ` + type + `">
                        <div class="message-avatar">
                            <figure class="avatar">
                                <img src="http://localhost:9090/uploads/` + message.reader.image + `" class="rounded-circle">
                            </figure>
                            <div>
                                <h5>` + message.reader.rname + `</h5>
                                <div class="time"> ` +message.chatCreatime+ `</div>
                            </div>
                        </div>
                        <div class="message-content">
                            ` + message.context + `
                        </div>
                    </div>`);

                        setTimeout(function () {
                            chat_body.scrollTop(chat_body.get(0).scrollHeight, -1).niceScroll({
                                cursorcolor: 'rgba(66, 66, 66, 0.20)',
                                cursorwidth: "4px",
                                cursorborder: '0px'
                            }).resize();
                        }, 200);
                    }
                }
            }
        };

        setTimeout(function () {
            // $('#disconnected').modal('show');
            // $('#call').modal('show');
            // $('#videoCall').modal('show');
            $('#pageTour').modal('show');
        }, 1000);
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
            console.log("WebSocket连接发生错误");
        };
        //连接成功建立的回调方法
        websocket.onopen = function () {
            console.log("WebSocket连接成功");
        }

        //接收到消息的回调方法
        websocket.onmessage = function (event) {
            var msg=event.data;
            msg=JSON.parse(msg);
            console.log("111111111111111111")
            if (msg instanceof Array){
                console.log(msg)
                var result='';
                $.ajax({
                    url:"/findallonline",
                    data:{ids:msg},
                    success:function (data) {
                        $.each(data, function (i, el) {
                            console.log(i)
                            result += "    <li class=\"list-group-item\">\n" +
                                "                            <figure class=\"avatar avatar-state-success\">\n" +
                                "                                <img src=\"http://localhost:9090/uploads/"+el.image+"\""+  " class=\"rounded-circle\" alt=\"image\">\n" +
                                "                            </figure>\n" +
                                "                            <div class=\"users-list-body\">\n" +
                                "                                <div>\n" +
                                "                                    <h5 class=\"text-primary\">"+el.rname+"</h5>\n" +
                                "                                    <p>"+el.remail+"</p>\n" +
                                "                                </div>\n" +
                                "                                <div class=\"users-list-action\">\n" +
                                "                                </div>\n" +
                                "                            </div>\n" +
                                "                        </li>"
                        })
                        $("#readerlist").html(result)
                    }
                })
          /*      $.each(msg, function (i, el) {
                    console.log(i)
                    result += "    <li class=\"list-group-item\">\n" +
                        "                            <figure class=\"avatar avatar-state-success\">\n" +
                        "                                <img src=\"http://localhost:9090/uploads/"+el.image+"\""+  " class=\"rounded-circle\" alt=\"image\">\n" +
                        "                            </figure>\n" +
                        "                            <div class=\"users-list-body\">\n" +
                        "                                <div>\n" +
                        "                                    <h5 class=\"text-primary\">"+el.rname+"</h5>\n" +
                        "                                    <p>"+el.remail+"</p>\n" +
                        "                                </div>\n" +
                        "                                <div class=\"users-list-action\">\n" +
                        "                                </div>\n" +
                        "                            </div>\n" +
                        "                        </li>"
                })
                $("#readerlist").html(result)*/
                return
            }
            var Who=msg.rid;
            if(Who!=${reader.readId}){
                SohoExamle.Message.add(msg)
            }
            else{
                SohoExamle.Message.add(msg,"outgoing-message")
            }



        }

        //连接关闭的回调方法
        websocket.onclose = function () {
            console.log("WebSocket连接关闭");
        }

        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = function () {
            closeWebSocket();
        }

   /*     //将消息显示在网页上
        function setMessageInnerHTML(innerHTML) {
/!*            var Words = document.getElementById("words");
            Words.innerHTML = Words.innerHTML + innerHTML;*!/
        }*/

        //关闭WebSocket连接
        function closeWebSocket() {
            websocket.close();
        }
        var input=$('#context')
        //发送消息
        function send() {
            var msg = input.val();
             msg = $.trim(msg);
            var rid=${reader.readId}
            var pid=1;
            var data = {
                "readId":rid,
                "pid":1,
                "context":msg
            };
            console.log(data)
            websocket.send(JSON.stringify(data));
        }
        $("#btn").click(function () {
            send();
        })
    })
</script>
</html>
