$(function () {
    $("#updatebtn").click(function () {
        var check1=confirm("确认要更改吗？");
        if (check1){
            var a_id=$("#a_id_input").val();
            var a_name=$("#a_name_input").val();
            var a_password=$("#a_password_input").val();
            var a_email=$("#a_email_input").val();
            var phoneNum=$("#phoneNum_input").val();
            if (a_id==""||a_id==null){
                alert("请填写管理员id");
            }else if(a_name==""||a_name==null) {
                alert("请填写管理员姓名");
            }else if (a_password==""||a_password==null){
                alert("请填写管理员密码");
            }else if (a_email==""||a_email==null){
                alert("请填写管理员邮箱");
            }else if (phoneNum==""||phoneNum==null){
                alert("请填写管理员电话");
            }else {
                if ( (/^[1][3,4,5,7,8][0-9]{9}$/.test(phoneNum))&&(/^([a-z0-9A-Z]+[-|_|\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-zA-Z]{2,}$/.test(a_email))){
                    var admin = {
                        a_id:a_id,
                        a_name:a_name,
                        a_password:a_password,
                        a_email:a_email,
                        phoneNum:phoneNum
                    }
                    console.log(admin);
                    $.ajax({
                        type:'POST',
                        url:'staff/infoUpdate',
                        data:JSON.stringify(admin),
                        cache: false, // 是否缓存
                        async: true, // 是否异步执行
                        processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
                        contentType: 'application/json;charset=UTF-8', // 是否设置Content-Type请求头
                        success:function (resultData) {
                            alert(resultData);
                            //window.open("StaffManage.jsp");
                            //window.location.href="staff/sendJsp";
                        },
                        error:function (resultData) {
                            alert("员工信息更改失败！");
                        }
                    });
                }else {
                    alert("手机格式不正确!");
                }
            }
        }

    });
});