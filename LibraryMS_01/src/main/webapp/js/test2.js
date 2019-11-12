$(document).ready(function(){

    $("#submit").on("click",function () {

        var isbn=$("#isbn").val();
        var bname=$("#bname").val();
        var adminid=$("#adminid").val();
        if(isbn==""||isbn==null||bname==""||bname==null||adminid==null||adminid==""){
            alert("输入不能为空");
        }
        else {
            if(isNaN(adminid)){
                alert("id必须为数字");
            }else{
                $.ajax({
                    url:"applyBook/applyNewBook",
                    dataType:"json",
                    type:'post',
                    data: {
                        'isbn': isbn,
                        'bname': bname,
                        'adminid': adminid,
                        'btype': 1,
                    },
                    success:function(data){
                        /*数据清空*/
                        $("#isbn").val("");
                        $("#bname").val("");
                        $("#adminid").val("");
                        console.log(data)
                        alert(data[0]);
                    },
                    error:function  (jqXHR, textStatus, errorThrown) {
                        /*弹出jqXHR对象的信息*/
                        alert(jqXHR.responseText);//????
                        alert(jqXHR.status);//0
                        alert(jqXHR.readyState);//0
                        alert(jqXHR.statusText);//error
                        /*弹出其他两个参数的信息*/
                        alert(textStatus);//error
                        alert(errorThrown);//
                    }
                })
            }

        }


    })

})