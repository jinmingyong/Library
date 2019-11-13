<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>客户管理</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- 导入easyui的资源文件 -->
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link id="themeLink" rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
</head>

<body>
<table id="list"></table>

<!-- 工具条 -->
<div id="tb">
    <a id="addBtn" href="javascrip" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">读者搜索</a>
    <a id="editBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">图书搜索</a>
    <a id="deleteBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>

<!-- 编辑窗口 -->
<div id="win" class="easyui-window" title="客户数据查询" style="width:500px;height:300px"
     data-options="iconCls:'icon-save',modal:true,closed:true">
    <form id="editForm" method="post">
        <%--&lt;%&ndash;提供id隐藏域 &ndash;%&gt;--%>

        <%--<input type="hidden" name="id">--%>
        客户编号：<input type="text" id="rid" name="rid" class="easyui-numberbox" data-options="required:true"/><br/>
        <%--图书编号：<input type="text" name="bid" class="easyui-numberbox" data-options="required:true"/><br/>--%>
        <%--<input type="hidden" name="bookingTime" class="easyui-datetimebox"/><br/>--%>
        <a id="selBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">查询</a>
    </form>
</div>

<div id="win1" class="easyui-window" title="图书数据查询" style="width:500px;height:300px"
     data-options="iconCls:'icon-save',modal:true,closed:true">
    <form id="editForm1" method="post">
        <%--&lt;%&ndash;提供id隐藏域 &ndash;%&gt;--%>

        <%--<input type="hidden" name="id">--%>
        <%--客户编号：<input type="text" id="rid" name="rid" class="easyui-numberbox" data-options="required:true"/><br/>--%>
        图书编号：<input type="text" id="bid" name="bid" class="easyui-numberbox" data-options="required:true"/><br/>
        <%--<input type="hidden" name="bookingTime" class="easyui-datetimebox"/><br/>--%>
        <a id="selBtn1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">查询</a>
    </form>
</div>
<script type="text/javascript">
    $(function(){
        $("#list").datagrid({
            //url:后台数据查询的地址
            url:"/bookBooking/listByPage",
            //columns：填充的列数据
            //field:后台对象的属性
            //tille:列标题
            columns:[[
                {
                    field:"id",
                    title:"预订号",
                    width:100,
                    checkbox:true
                },
                {
                    field:"rid",
                    title:"客户编号",
                    width:200
                },
                {
                    field:"bid",
                    title:"图书编号",
                    width:200
                },
                {
                    field:"bookingTime",
                    title:"预订时间",
                    width:200
                },

            ]],
            //显示分页
            pagination:true,
            //工具条
            toolbar:"#tb"
        });

        //打开编辑窗口
        $("#addBtn").click(function(){
            //清空表单数据
            $("#editForm").form("clear");
            $("#win").window("open");
        });

        $("#editBtn").click(function(){
            //清空表单数据
            $("#editForm1").form("clear");
            $("#win1").window("open");
        });

        //保存数据
        $("#selBtn").click(function(){
            var rid=document.getElementById("rid").value;
             var u="/bookBooking/listByRid?rid="+rid;
            $("#list").datagrid({
                //url:后台数据查询的地址
                url:u,
                //columns：填充的列数据
                //field:后台对象的属性
                //tille:列标题
                columns:[[
                    {
                        field:"id",
                        title:"预订号",
                        width:100,
                        checkbox:true
                    },
                    {
                        field:"rid",
                        title:"客户编号",
                        width:200
                    },
                    {
                        field:"bid",
                        title:"图书编号",
                        width:200
                    },
                    {
                        field:"bookingTime",
                        title:"预订时间",
                        width:200
                    },

                ]],
                //显示分页
                pagination:true,
                //工具条
                toolbar:"#tb"
            });
            $("#win").window("close");
            $.messager.alert("提示","查询成功","info");

        });

        $("#selBtn1").click(function(){
            var bid=document.getElementById("bid").value;
            var u="/bookBooking/listByBid?bid="+bid;
            $("#list").datagrid({
                //url:后台数据查询的地址
                url:u,
                //columns：填充的列数据
                //field:后台对象的属性
                //tille:列标题
                columns:[[
                    {
                        field:"id",
                        title:"预订号",
                        width:100,
                        checkbox:true
                    },
                    {
                        field:"rid",
                        title:"客户编号",
                        width:200
                    },
                    {
                        field:"bid",
                        title:"图书编号",
                        width:200
                    },
                    {
                        field:"bookingTime",
                        title:"预订时间",
                        width:200
                    },

                ]],
                //显示分页
                pagination:true,
                //工具条
                toolbar:"#tb"
            });

            $("#win1").window("close");
            $.messager.alert("提示","查询成功","info");

        });
        // //修改数据
        // $("#editBtn").click(function(){
        // 	//判断只能选择一行
        // 	var rows = $("#list").datagrid("getSelections");
        // 	if(rows.length!=1){
        // 		$.messager.alert("提示","修改操作只能选择一行","warning");
        // 		return;
        // 	}
        //
        // 	//表单回显
        // 	$("#editForm").form("load","customer/findById.action?id="+rows[0].id);
        //
        // 	$("#win").window("open");
        // });
        //
        //删除
        $("#deleteBtn").click(function(){
            var rows =$("#list").datagrid("getSelections");
            if(rows.length==0){
                $.messager.alert("提示","转为借阅操作至少选择一行","warning");
                return;
            }

            //格式： id=1&id=2&id=3
            $.messager.confirm("提示","确认转换数据吗?",function(value){
                if(value){
                    var idStr = "";
                    //遍历数据
                    $(rows).each(function(i){
                        idStr+=("id="+rows[i].id+"&");
                    });
                    idStr = idStr.substring(0,idStr.length-1);


                    //传递到后台
                    $.post("/bookBooking/deleteForm",idStr,function(data){
                        if(data.success){
                            //刷新datagrid
                            $("#list").datagrid("reload");

                            $.messager.alert("提示","转换成功","info");
                        }else{
                            $.messager.alert("提示","转换失败："+data.msg,"error");
                        }
                    },"json");
                }
            });
        });
    });

</script>
</body>
</html>
