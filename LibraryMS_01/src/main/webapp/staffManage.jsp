<%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2019/11/9
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工管理</title>
    <link rel="stylesheet" href="css/staffManage.css">
</head>

<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">

<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<body >

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

                            <div id="staffManage">
                                <table class="table table-bordered"  width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>员工id</th>
                                            <th>员工姓名</th>
                                            <th>员工邮箱</th>
                                            <th>员工电话</th>
                                            <th>员工职位</th>
                                            <th>职位管理</th>
                                            <th>信息更改</th>
                                        </tr>
                                    </thead>
                                    <tbody id="staffManage_tbody"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<body>

<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/staffManage.js" type="text/javascript"></script>
</body>
</html>
