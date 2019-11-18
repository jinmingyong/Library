<%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2019/11/8
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<html>
<head>
    <title>员工入职页面</title>
    <link rel="stylesheet" href="css/addStaff.css">
</head>
<body>
<div>
    <div class="container-fluid">
        <div class="card mb-3">
            <div class="card-header">
                <i class="fa fa-table"></i> 管理员管理系统
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="container">
                        <div id="main">

                            <div id="staffAdd">
                                <table class="table table-bordered"  width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>员工id</th>
                                        <th>员工姓名</th>
                                        <th>员工邮箱</th>
                                        <th>员工电话</th>
                                        <th>职位选择</th>
                                        <th>员工入职</th>
                                    </tr>
                                    </thead>
                                    <tbody id="staffAdd_tbody"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<div id="staffAdd">--%>
<%--    <ul>--%>
<%--        <li>员工入职</li>--%>
<%--        <li>请输入员工id：&nbsp;&nbsp;&nbsp;&nbsp;<input class="staffAddInput" type="text" name="a_name" id="a_id" required></li>--%>
<%--        <li>请输入员工姓名：<input class="staffAddInput" type="text" name="a_name" id="a_name" required></li>--%>
<%--        &lt;%&ndash;<li>请输入员工密码：<input class="staffAddInput" type="text" name="a_password" id="a_password" required></li>&ndash;%&gt;--%>
<%--        <li>请输入员工邮箱：<input class="staffAddInput" type="email" name="a_email" id="a_email" required></li>--%>
<%--        <li>请输入员工电话：<input class="staffAddInput" type="text" name="phoneNum" id="phoneNum"required></li>--%>
<%--        <li>请选择员工职位：<input type="radio" name="position" value="2">高级管理员--%>
<%--            <input type="radio" name="position" value="1" checked>普通管理员</li>--%>
<%--        <li><button class="btn" type="button" id="addbtn">员工入职</button></li>--%>
<%--    </ul>--%>
<%--</div>--%>
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/addStaff.js" type="text/javascript"></script>
</body>
</html>
