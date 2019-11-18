$(function () {
    $("#staffTypeUpdate_btn").click(function () {
        var check1=confirm("确认要更改吗？");
        if (check1){
            var a_id = $("#aid").val();
            var type = $("input:radio:checked").val();
            if (type==""||type==null){
                alert("请选择管理员职位");
            }else {
                var admin={
                    a_id:a_id,
                    type:type
                }
                $.ajax({
                    type:'POST',
                    url:'staff/position',
                    data:JSON.stringify(admin),
                    cache: false, // 是否缓存
                    async: true, // 是否异步执行
                    processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
                    contentType: 'application/json;charset=UTF-8', // 是否设置Content-Type请求头
                    success:function (resultData) {
                        alert(resultData);
                    },
                    error:function (resultData) {
                        alert("职位更改失败！");
                    }
                })
            }
        }

    });
})