<%--
  Created by IntelliJ IDEA.
  User: peng
  Date: 2019/11/8
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工信息更改页面</title>
    <link rel="stylesheet" href="css/staffInfoUpdate.css">
</head>
<body>
<%
    String a_id1 = request.getParameter("a_id");
    int aid=Integer.parseInt(a_id1);
    String aname = request.getParameter("a_name");
    String apassword = request.getParameter("a_password");
    String aemail = request.getParameter("a_email");
    String phoneN = request.getParameter("phoneNum");
%>
<div id="staffInfoUpdate">
    <ul>
        <li>要更改员工的id：<input id="a_id_input" class="staffInfoUpdateInput" type="text" name="a_id" value="<%=a_id1%>" readonly></li>
        <li>请输入员工姓名：<input id="a_name_input" class="staffInfoUpdateInput" type="text" name="a_name" value="<%=aname%>"></li>
        <li>请输入员工密码：<input id="a_password_input" class="staffInfoUpdateInput" type="password" name="a_password" value="<%=apassword%>" readonly></li>
        <li>请输入员工邮箱：<input id="a_email_input" class="staffInfoUpdateInput" type="email" name="a_email" value="<%=aemail%>"></li>
        <li>请输入员工电话：<input id="phoneNum_input" class="staffInfoUpdateInput" type="text" name="phoneNum" value="<%=phoneN%>"></li>
        <li><button class="btn" type="button" id="updatebtn">更改员工信息</button></li>
    </ul>
    <a id="staffResult" href="staffManage.jsp">返回</a>
</div>
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/staffInfoUpdate.js" type="text/javascript"></script>
</body>
</html>
