<%--
  Created by IntelliJ IDEA.
  User: King-小明
  Date: 2019/10/26
  Time: 13:09
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
</head>
<body>
成功${bookResList}
<div id="myVue">
    <table class="table table-responsive table-striped">
        <thead>
        <tr>
            <td>bname</td>
            <td>isbn</td>
            <td>btype</td>
            <td>author</td>
            <td>publish</td>
            <td>操作</td>
            <td>选择</td>
        </tr>
        </thead>
        <tbody>
        <tr v-for="(bookRes,index) in bookResList">
            <td>{{bookRes.bname}}</td>
            <td>{{bookRes.isbn}}</td>
            <td>{{bookRes.isbn}}</td>
            <td>{{bookRes.isbn}}</td>
            <td>{{bookRes.isbn}}</td>
            <td>
                <button class="btn btn-warning btn-sm" @click="dele(bookRes,index)" type="button">删除</button>
            </td>
            <td><input class='checkbox' v-model="ids" type='checkbox' :value="bookRes"  ></td>
        </tr>
        </tbody>
    </table>
</div>

<script src="/js/vue.js"></script>
<script>
    new Vue({
        el:'#myVue',
        data:{
            bookResList:[${pageInfo}],
            ids:[],
            methods:{
                dele:function () {
                    
                }
            }
        }
    })
</script>
</body>
</html>
