$(function () {
    var str="";
    $.ajax({
        type:'POST',
        url:'staff/findAllStaff',
        cache: false, // 是否缓存
        async: true, // 是否异步执行
        processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
        contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
        success:function (resultData) {
            for (var i = 0; i < resultData.length; i++) {
                // var str1="&&a_name="+resultData[i].a_name+"&&a_password="+resultData[i].a_password+"&&a_email="+resultData[i].a_email+"&&phoneNum="+resultData[i].phoneNum;
                str+="<tr>" +
                    "<td id='aid'>"+resultData[i].a_id+"</td>" +
                    "<td id='aname'>"+resultData[i].a_name+"</td>" +
                    "<td id='aemail'>"+resultData[i].a_email+"</td>" +
                    "<td id='aphone'>"+resultData[i].phoneNum+"</td>" +
                    "<td id='aposition'><input type='radio' name='position' value='2'>高级管理员"+
                    "<input type='radio' name='position' value='1'>普通管理员</td>" +
                    "<td><button id='startwork' type='button' class='btn btn-primary btn-lg'>入职</button></td>" +
                    // "<td>"+resultData[i].type+"</td>" +
                    // "<td><a href='staffTypeManage.jsp?a_id="+resultData[i].a_id+"'>职位管理</a></td>" +
                    // "<td><a href='StaffInfoUpdate.jsp?a_id="+resultData[i].a_id+str1+"'>更改信息</a></td>" +
                    "</tr>";
            }
            $("#staffAdd_tbody").html(str);
        }
    });
    $("tbody").on("click","#startwork",function () {
        var a_id=$(this).parents("tr").find("#aid").text();
        var a_name = $(this).parents("tr").find("#aname").text();
        var a_email = $(this).parents("tr").find("#aemail").text();
        var phoneNum = $(this).parents("tr").find("#aphone").text();
        var type = $(this).parents("tr").find("#aposition input:radio:checked").val();
        if (type==""||type==null){
            alert("请选择职位");
        }else {
            var data={
                a_id:a_id,
                a_name:a_name,
                a_email:a_email,
                phoneNum:phoneNum,
                type:type
            }
            console.log(data);
            $.ajax({
                type:'POST',
                url:'staff/startWork',
                data:JSON.stringify(data),
                cache: false, // 是否缓存
                async: true, // 是否异步执行
                processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
                contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
                success:function (resultData) {
                    alert(resultData);
                    window.location.reload();

                }
            });
        }
    })

    // $("#addbtn").click(function () {
    //     var a_id=$("#a_id").val();
    //     var a_name=$("#a_name").val();
    //     // var a_password=$("#a_password").val();
    //     var a_email=$("#a_email").val();
    //     var phoneNum=$("#phoneNum").val();
    //     var type=$("input:radio:checked").val();
    //     if (a_id==""||a_id==null){
    //         alert("请填写管理员id");
    //     }else if(a_name==""||a_name==null) {
    //         alert("请填写管理员姓名");
    //     } else if (a_email==""||a_email==null){
    //         alert("请填写管理员邮箱");
    //     }else if (phoneNum==""||phoneNum==null){
    //         alert("请填写管理员电话");
    //     }else {
    //         var admin = {
    //             a_id:a_id,
    //             a_name:a_name,
    //             // a_password:a_password,
    //             a_email:a_email,
    //             phoneNum:phoneNum,
    //             type:type
    //         }
    //         $.ajax({
    //             type:'POST',
    //             url:'staff/startWork',
    //             data:JSON.stringify(admin),
    //             cache: false, // 是否缓存
    //             async: true, // 是否异步执行
    //             processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
    //             contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
    //             success:function (resultData) {
    //                 alert("员工入职成功！");
    //                 $("#a_name").val("");
    //                 $("#a_password").val("");
    //                 $("#a_email").val("");
    //                 $("#phoneNum").val("");
    //             },
    //             error:function (resultData) {
    //                 alert("员工入职失败！");
    //             }
    //         });
    //     }
    // });
});