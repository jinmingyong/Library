$(function () {
    var str="";
    $.ajax({
        type:'POST',
        url:'staff/findAll',
        cache: false, // 是否缓存
        async: true, // 是否异步执行
        processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
        contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
        success:function (resultData) {
            for (var i = 0; i < resultData.length; i++) {
                var str1="&&a_name="+resultData[i].a_name+"&&a_password="+resultData[i].a_password+"&&a_email="+resultData[i].a_email+"&&phoneNum="+resultData[i].phoneNum;
                str+="<tr>" +
                    "<td>"+resultData[i].a_id+"</td>" +
                    "<td>"+resultData[i].a_name+"</td>" +
                    "<td>"+resultData[i].a_email+"</td>" +
                    "<td>"+resultData[i].phoneNum+"</td>" +
                    "<td>"+resultData[i].type+"</td>" +
                    "<td><a href='staffTypeManage.jsp?a_id="+resultData[i].a_id+"'>职位管理</a></td>" +
                    "<td><a href='StaffInfoUpdate.jsp?a_id="+resultData[i].a_id+str1+"'>更改信息</a></td>" +
                    "</tr>";
            }
            $("#staffManage_tbody").html(str);
        }
    });

})