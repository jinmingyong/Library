<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/10/31
  Time: 16:05
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
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
/*        .speed {
            width:0;
            height:100%;
            background: #46f217;
            color:white;
            text-align:center;
            font-size:5px;
        }*/
        .speed {
            float: left;
        }
    </style>
</head>
<body>
<div id="myVue">
    <table class="table table-responsive table-striped">
        <thead>
        <tr>
            <td>bid</td>
            <td>bname</td>
            <td>isbn</td>
            <td>btype</td>
            <td>author</td>
            <td>publish</td>
            <td>amount</td>
            <td>import_time</td>
            <td>选择文件</td>
            <td>操作</td>
            <td>选择</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="bookRes" varStatus="status">
        <tr>
            <td>${bookRes.bid}</td>
            <td>${bookRes.bname}</td>
            <td>${bookRes.isbn}</td>
            <td>${bookRes.booktype.typename}</td>
            <td>${bookRes.author}</td>
            <td>${bookRes.publisher}</td>
            <td>${bookRes.amount}</td>
            <td>${bookRes.importTime}</td>
            <td><form enctype="multipart/form-data">
                <input type="file" id="oFile" class="oFile" name="UploadForm[image]" onchange="FileChangeFn(${status.index},this)" style="float: left">
                <%--<div class="speed_box">--%>
                    <div class="speed">
                    </div>
                <span style="float: left;line-height: 40px;color: #5cb85c"></span>
              <%--  </div>--%>
            </form></td>
            <td>
                <button class="btn btn-warning btn-sm"  type="button">删除</button>
            </td>
            <td><input class='checkbox' type='checkbox'  ></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="/js/vue.js"></script>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/radialIndicator.min.js"></script>
<script>
    var uploadUrl = 'bookres/upload';
    //文件选择完毕时
    function FileChangeFn(index,current) {
        current = current.nextElementSibling;
        console.log(current)
        $(current).children(0).remove();
        var event = event || window.event,
            dom = '',
            ofile = $(".oFile").get(index).files[0],
            otype = ofile.type || '获取失败',
            osize = ofile.size / 1054000,
            ourl = window.URL.createObjectURL(ofile); //文件临时地址
        console.log("文件类型：" + otype); //文件类型
        console.log("文件大小：" + osize); //文件大小
        console.log(current)
       var radialObj = radialIndicator(current, {
            radius: 15,
            barColor : '#00fa23',
            barBgColor:'#abfabb',
            barWidth : 5,
            initValue : 0,
            percentage:true,
        });
        UploadFileFn(index,current,radialObj);
    };

    //侦查附件上传情况 ,这个方法大概0.05-0.1秒执行一次
    //ele 已经是进度条对应的div对象
    function OnProgRess(event,ele,radialObj) {
        var event = event || window.event;
        //console.log(event);  //事件对象
        console.log("已经上传：" + event.loaded); //已经上传大小情况(已上传大小，上传完毕后就 等于 附件总大小)
        //console.log(event.total);  //附件总大小(固定不变)
        var loaded = Math.floor(100 * (event.loaded / event.total)); //已经上传的百分比
        radialObj.value(loaded);
       /* $(ele).children(0).html(loaded + "%").css("width", loaded + "%");*/
    };
    function UploadFileFn(index,target,radialObj) {
        $(target).show();
        console.log($(target).parent().parent().parent().children("td").eq(0).html());

        var oFile = $(".oFile").get(index).files[0], //input file标签
            formData = new FormData(); //创建FormData对象
        xhr = $.ajaxSettings.xhr(); //创建并返回XMLHttpRequest对象的回调函数(jQuery中$.ajax中的方法)
        formData.append("UploadForm[image]", oFile); //将上传name属性名(注意：一定要和 file元素中的name名相同)，和file元素追加到FormData对象中去
        formData.append("bid",$(target).parent().parent().parent().children("td").eq(0).html());
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
                        OnProgRess(event,this.ele,this.radialObj)
                    }.bind({ele:target,radialObj:radialObj})
                    xhr.upload.addEventListener("progress",deal, false);
                    return xhr;
                }
            },
            success: function(returndata) {
                console.log($(target).children());
                $(target).next().html("上传成功");
                //alert(returndata);
            },
            error: function(returndata) {
                $(target).html("上传失败");
                console.log(returndata)
                alert('请正确配置后台服务！');
            }
        });
    }
</script>

</body>
</html>
