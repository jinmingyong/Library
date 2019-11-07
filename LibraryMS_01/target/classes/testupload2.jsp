<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/11/1
  Time: 9:32
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
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

<div id="indicatorContainerWrap">
    <div id="indicatorContainer"></div>
</div>

<script src="js/radialIndicator.min.js"></script>
<script>
    $(function () {
        let radialObj = radialIndicator('#indicatorContainer', {
            radius: 20,
            barColor : '#facb00',
            barWidth : 15,
            initValue : '唱歌',
            percentage:true,
            format: function (value) {
                return "aaa";
            }
        });
    })

</script>

</body>
</html>
