$(function () {
    $("#addbtn").click(function () {
        var a_id=$("#a_id").val();
        var a_name=$("#a_name").val();
        // var a_password=$("#a_password").val();
        var a_email=$("#a_email").val();
        var phoneNum=$("#phoneNum").val();
        var type=$("input:radio:checked").val();
        if(a_name==""||a_name==null) {
            alert("请填写员工姓名");
        }
        // else if (a_password==""||a_password==null){
        //     alert("请填写员工密码");
        // }
        else if (a_email==""||a_email==null){
            alert("请填写员工邮箱");
        }else if (phoneNum==""||phoneNum==null){
            alert("请填写员工职位");
        }else {
            var admin = {
                a_id:a_id,
                a_name:a_name,
                // a_password:a_password,
                a_email:a_email,
                phoneNum:phoneNum,
                type:type
            }
            $.ajax({
                type:'POST',
                url:'staff/startWork',
                data:JSON.stringify(admin),
                cache: false, // 是否缓存
                async: true, // 是否异步执行
                processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
                contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
                success:function (resultData) {
                    alert("员工入职成功！");
                    $("#a_name").val("");
                    $("#a_password").val("");
                    $("#a_email").val("");
                    $("#phoneNum").val("");
                },
                error:function (resultData) {
                    alert("员工入职失败！");
                }
            });
        }
    });
});