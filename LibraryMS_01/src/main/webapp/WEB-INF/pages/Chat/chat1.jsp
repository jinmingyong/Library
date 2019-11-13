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
    <!-- Bundle Styles -->

    <!-- App styles -->
    <link rel="stylesheet" href="css/app.min.css">
    <link rel="stylesheet" href="css/bundle.css">

    <link rel="stylesheet" href="css/enjoyhint.css">
    <style>
        .speed {
            float: left;
        }
    </style>
</head>
<body>
<!-- page loading -->
<div class="page-loading"></div>
<div id="myVue">
<!-- ./ page loading -->
<div class="modal fade" id="editProfileModal" tabindex="1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i data-feather="edit-2" class="mr-2"></i> Edit Profile
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#personal" role="tab"
                           aria-controls="personal" aria-selected="true">Personal</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane show active" id="personal" role="tabpanel">
                        <form enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="rname" class="col-form-label">Fullname</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="rname" v-model="rname" value="">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="user"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Avatar</label>
                                <div class="d-flex align-items-center">
                                    <div>
                                        <figure class="avatar mr-3 item-rtl">
                                            <img id="img" src="http://localhost:9090/uploads/${reader.image}" class="rounded-circle"
                                                 alt="image">
                                        </figure>
                                    </div>

                                    <div class="">
                                        <input type="file" id="oFile" class="oFile" name="UploadForm[image]" onchange="FileChangeFn(event)" style="float: left">
                                        <%--<div class="speed_box">--%>
                                        <div class="speed">
                                        </div>
                                        <span style="float: left;line-height: 40px;color: #5cb85c"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="city" class="col-form-label">City</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="city" v-model="raddress" placeholder="Ex: Columbia" value="">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="target"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="col-form-label">Phone</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="phone" v-model="rphone" placeholder="(888) 888 88 88" value="">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="phone"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-form-label">Email</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="email" v-model="remail"  placeholder="www.@" value="">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i data-feather="mail"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"  v-on:click="updateReader()">Save</button>
            </div>
        </div>
    </div>
</div>

<!-- layout -->
<div class="layout">
    <!-- content -->
    <div class="content">

        <nav class="navigation">
            <div class="nav-group">
                <ul>
                    <li class="logo">
                        <a href="#">
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 width="612px" height="612px" viewBox="0 0 612 612"
                                 style="enable-background:new 0 0 612 612;" xml:space="preserve">
                            <g>
                                <g id="_x32__26_">
                                    <g>
                                        <path d="M401.625,325.125h-191.25c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h191.25
                                    c10.557,0,19.125-8.568,19.125-19.125S412.182,325.125,401.625,325.125z M439.875,210.375h-267.75
                                    c-10.557,0-19.125,8.568-19.125,19.125s8.568,19.125,19.125,19.125h267.75c10.557,0,19.125-8.568,19.125-19.125
                                    S450.432,210.375,439.875,210.375z M306,0C137.012,0,0,119.875,0,267.75c0,84.514,44.848,159.751,114.75,208.826V612
                                    l134.047-81.339c18.552,3.061,37.638,4.839,57.203,4.839c169.008,0,306-119.875,306-267.75C612,119.875,475.008,0,306,0z
                                    M306,497.25c-22.338,0-43.911-2.601-64.643-7.019l-90.041,54.123l1.205-88.701C83.5,414.133,38.25,345.513,38.25,267.75
                                    c0-126.741,119.875-229.5,267.75-229.5c147.875,0,267.75,102.759,267.75,229.5S453.875,497.25,306,497.25z"/>
                                    </g>
                                </g>
                            </g>
                        </svg>
                        </a>
                    </li>
                    <li>
                        <a class="active" data-navigation-target="chats" href="/chat/chatjsp" data-toggle="tooltip" title="Chats"
                           data-placement="right">
                            <span class="badge badge-warning"></span>
                            <i data-feather="message-circle"></i>
                        </a>
                    </li>
                    <li>
                        <a href="/bookInuse/showAllbookjsp" data-toggle="tooltip"
                           title="Comments" data-placement="right">
                            <span class="badge badge-danger"></span>
                            <i data-feather="message-square"></i>
                        </a>
                    </li>

                    <li>
                        <a href="#" class="dark-light-switcher" data-toggle="tooltip" title="Dark mode"
                           data-placement="right">
                            <i data-feather="moon"></i>
                        </a>
                    </li>
                    <li data-toggle="tooltip" title="User menu" data-placement="right">
                        <a href="" data-toggle="dropdown">
                            <figure class="avatar">
                                <img src="http://localhost:9090/uploads/${reader.image}" class="rounded-circle" alt="image">
                            </figure>
                        </a>
                        <div class="dropdown-menu">
                            <a href="#" class="dropdown-item" data-toggle="modal" data-target="#editProfileModal">Edit
                                profile</a>
                            <a class="dropdown-item" data-navigation-target="contact-information">Profile</a>
                            <div class="dropdown-divider"></div>
                            <a href="login.jsp" class="dropdown-item text-danger">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- sidebar group -->
        <div class="sidebar-group">

            <!-- Chats sidebar -->
            <div id="chats" class="sidebar active">
                <header>
                    <span>Chats</span>
                </header>
                <div class="sidebar-body">
                    <ul class="list-group list-group-flush" id="readerlist">
                    </ul>
                </div>
            </div>
        </div>
        <!-- ./ sidebar group -->
        <!-- chat -->
        <div class="chat">
            <div class="chat-header">
                <div class="chat-header-user">
                    <div>
                        <h5>开始群聊</h5>
                        <small class="text-success">
                        </small>
                    </div>
                </div>
                <div class="chat-header-action">
                </div>
            </div>
            <div class="chat-body">
                <div class="messages">
                </div>
            </div>
            <div class="chat-footer">
                    <input type="text" id="context" class="form-control" placeholder="Write a message."  style="margin-bottom: 20px" maxlength="20">
                    <div class="form-buttons" style="float: right" >
                        <button class="btn btn-primary" type="button" id="btn" style="width: 100px;padding-left: 40px">
                            <i data-feather="send"></i>
                        </button>
                    </div>
                </div>
            </div>

        <div class="sidebar-group">
            <div id="contact-information" class="sidebar">
                <header>
                    <span>Profile</span>
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <a class="btn btn-outline-light text-danger sidebar-close">
                                <i data-feather="x"></i>
                            </a>
                        </li>
                    </ul>
                </header>
                <div class="sidebar-body">
                    <div class="pl-4 pr-4">
                        <div class="text-center">
                            <figure class="avatar avatar-xl mb-4">
                                <img src="http://localhost:9090/uploads/${reader.image}" class="rounded-circle" alt="image">
                            </figure>
                            <h5 class="mb-1">${reader.rname}</h5>
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
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="mt-4 mb-4">
                                    <h6>Phone</h6>
                                    <p class="text-muted">${reader.rphone}</p>
                                </div>
                                <div class="mt-4 mb-4">
                                    <h6>City</h6>
                                    <p class="text-muted">${reader.raddress}</p>
                                </div>
                                <div class="mt-4 mb-4">
                                    <h6>Credit</h6>
                                    <p>
                                        <a href="#">${reader.credit}</a>
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="mt-4 mb-4">
                                    <h6 class="mb-3">Social media accounts</h6>
                                    <ul class="list-inline social-links">
                                        <li class="list-inline-item">
                                            <a href="#" class="btn btn-sm btn-floating btn-facebook"
                                               data-toggle="tooltip" title="Facebook">
                                                <i class="fa fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="btn btn-sm btn-floating btn-twitter"
                                               data-toggle="tooltip" title="Twitter">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="btn btn-sm btn-floating btn-dribbble"
                                               data-toggle="tooltip" title="Dribbble">
                                                <i class="fa fa-dribbble"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="btn btn-sm btn-floating btn-whatsapp"
                                               data-toggle="tooltip" title="Whatsapp">
                                                <i class="fa fa-whatsapp"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="btn btn-sm btn-floating btn-linkedin"
                                               data-toggle="tooltip" title="Linkedin">
                                                <i class="fa fa-linkedin"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="btn btn-sm btn-floating btn-google" data-toggle="tooltip"
                                               title="Google">
                                                <i class="fa fa-google"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="btn btn-sm btn-floating btn-behance"
                                               data-toggle="tooltip" title="Behance">
                                                <i class="fa fa-behance"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="btn btn-sm btn-floating btn-instagram"
                                               data-toggle="tooltip" title="Instagram">
                                                <i class="fa fa-instagram"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- ./ chat -->

       <%-- <div class="sidebar-group">
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
                                <img src="http://localhost:9090/uploads/${reader.image}" class="rounded-circle" alt="image">
                            </figure>
                            <h5 class="mb-1">${reader.rname}</h5>
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
        </div>--%>

    </div>
</div>
    <!-- ./ content -->
<!-- ./ layout -->
</body>
<script src="/js/jquery-3.3.1.min.js"></script>
<!-- App scripts -->
<script src="/js/vue.js"></script>
<script src="/js/radialIndicator.min.js"></script>
<script src="/js/bundle.js"></script>
<script src="/js/feather.min.js"></script>
<script src="/js/enjoyhint.min.js"></script>
<script src="/js/app.min.js"></script>
<script>
    var uploadUrl = 'reader/upload';
    //文件选择完毕时
    function FileChangeFn(event) {
        var event = event || window.event,
            dom = '',
            ofile = $("#oFile").get(0).files[0],
            otype = ofile.type || '获取失败',
            osize = ofile.size / 1054000;
            ourl = window.URL.createObjectURL(ofile); //文件临时地址
        var radialObj = radialIndicator($(".speed"),{
            radius: 15,
            barColor : '#00fa23',
            barBgColor:'#abfabb',
            barWidth : 5,
            initValue : 0,
            percentage:true,
        });
        UploadFileFn(radialObj);
    };

    //侦查附件上传情况 ,这个方法大概0.05-0.1秒执行一次
    //ele 已经是进度条对应的div对象
    function OnProgRess(event,radialObj) {
        var event = event || window.event;
        //console.log(event);  //事件对象
        console.log("已经上传：" + event.loaded); //已经上传大小情况(已上传大小，上传完毕后就 等于 附件总大小)
        //console.log(event.total);  //附件总大小(固定不变)
        var loaded = Math.floor(100 * (event.loaded / event.total)); //已经上传的百分比
        radialObj.value(loaded);
        /* $(ele).children(0).html(loaded + "%").css("width", loaded + "%");*/
    };
    function UploadFileFn(radialObj) {
        var oFile = $("#oFile").get(0).files[0], //input file标签
            formData = new FormData(); //创建FormData对象
        xhr = $.ajaxSettings.xhr(); //创建并返回XMLHttpRequest对象的回调函数(jQuery中$.ajax中的方法)
        formData.append("UploadForm[image]", oFile); //将上传name属性名(注意：一定要和 file元素中的name名相同)，和file元素追加到FormData对象中去
        formData.append("readId",${reader.readId});
        $.ajax({
            type: "POST",
            url: uploadUrl, // 后端服务器上传地址
            data: formData, // formData数据
            cache: false, // 是否缓存
            async: true, // 是否异步执行
            processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
            contentType: false, // 是否设置Content-Type请求头
            xhr: function() {
                if (OnProgRess && xhr.upload) {
                    var deal = function(event){
                        OnProgRess(event,this.radialObj)
                    }.bind({radialObj:radialObj})
                    xhr.upload.addEventListener("progress",deal, false);
                    return xhr;
                }
            },
            success: function(returndata) {
                console.log(returndata);
                document.getElementById("img").setAttribute("src",returndata);
                /*        $("#img"+index).setAttribute("src",returndata)*/
                //alert(returndata);
            },
            error: function(returndata) {

                console.log(returndata)
                alert('请正确配置后台服务！');
            }
        });
    }
</script>
<script>
    var vue=new Vue({
        el:'#myVue',
        data:{
            rname:'${reader.rname}',
            rphone:'${reader.rphone}',
            raddress:'${reader.raddress}',
            remail:'${reader.remail}'
        },
        methods:{
            updateReader:function () {
                $.ajax({
                    url:'reader/updateReaderinfo',
                    data:{readId:${reader.readId},rname:this.rname,rphone:this.rphone,raddress: this.raddress,remail:this.remail},
                    dataType:'json',
                    success:function (data) {
                        console.log(data)
                        window.location.reload()
                    }
                })
            }
        }
    })
</script>
<script>
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
        //关闭WebSocket连接
        function closeWebSocket() {
            websocket.close();
        }
        var input=$('#context')
        //发送消息
        function send() {
            var msg = input.val();
             msg = $.trim(msg);
             if (msg==""){
                 alert("不能为空")
                 return
             }
            var rid=${reader.readId}
            var pid=1;
            var data = {
                "readId":rid,
                "pid":1,
                "context":msg
            };
            websocket.send(JSON.stringify(data));
        }
        document.onkeydown = function (e) { // 回车提交表单
// 兼容FF和IE和Opera
            var theEvent = window.event || e;
            var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
            if (code == 13) {
                send()
            }
        }
        $("#btn").click(function () {
            send();
        })
    })
</script>
</html>
