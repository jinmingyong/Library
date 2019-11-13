$(document).ready(function(){
    var add="<button class='btn btn-success' id='add2'>添加</button>";
    var xiaohui="<button class='btn btn-danger' id='del'>销毁</button>";
    var apply ="<button class='btn btn-danger' id='apply'>申请销毁</button>";
    $.ajax({
        url:"bookBad/showAllBadBooks",
        dataType:"json",
        success:function(data){
            $.each(data, function(index, item){
                if(item.btype==0){
                    var state="未审核";
                    var btn=add+"  "+apply;
                }
                else if (item.btype==1){
                    var state="正在审核";
                    var btn="请等待处理";
                }
                else{
                    var state="审核通过";
                    var btn="  "+xiaohui;
                }

                $("#tb").append("<tr>" +
                    "<td>"+item.badId+"</td>" +
                    "<td>"+item.isbn+"</td>" +
                    "<td>"+item.badtime+"</td>" +
                    "<td>"+item.badnum+"</td>" +
                    "<td>"+state+"</td>" +
                    "<td>"+btn+"</td>" +
                    "</tr>")
            });

        }
    });

    $("#add").on("click",function() {
        var isbn =$("#isbn").val();
        if (isbn=="请输入isbn号") {
            alert("请输入isbn号");
        }else{
            $.ajax({
                url:"bookBad/replaceBadBook",
                dataType:"json",
                data:{
                    'Id':"",
                    'isbn':isbn,
                    'badnum':1,
                },
                success:function(data){
                    alert(data[0]);
                    window.location.reload();
                },
                error:function  (jqXHR, textStatus, errorThrown) {
                    /*弹出jqXHR对象的信息*/
                    alert(jqXHR.responseText);//????
                    alert(jqXHR.status);//200
                    alert(jqXHR.readyState);//4
                    alert(jqXHR.statusText);//parsererror
                    /*弹出其他两个参数的信息*/
                    alert(textStatus);//parsererror
                    alert(errorThrown);//SyntaxError: Unexpected token ? in JSON at position 0
                }
            });
        }

    })
    $("#tables").on("click","#add2",function () {
        var isbn= $(this).parents("tr").find("td").eq(1).text();
        $.ajax({
            url:"bookBad/replaceBadBook",
            dataType:"json",
            data:{
                'Id':"",
                'isbn':isbn,
            },
            success:function(data){
                alert(data[0]);
                window.location.reload();
            },
            error:function  (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                alert(jqXHR.responseText);//????
                alert(jqXHR.status);//200
                alert(jqXHR.readyState);//4
                alert(jqXHR.statusText);//parsererror
                /*弹出其他两个参数的信息*/
                alert(textStatus);//parsererror
                alert(errorThrown);//SyntaxError: Unexpected token ? in JSON at position 0
            }

        });
    })
    $("#tables").on("click","#del",function () {
        var isbn= $(this).parents("tr").find("td").eq(1).text();
        $.ajax({
            url:"bookBad/deleteBadBooks",
            dataType:"json",
            data:{
                'isbn':isbn,
            },
            success:function(){
                alert("成功");
                window.location.reload();

            },error:function  (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                alert(jqXHR.responseText);//????
                alert(jqXHR.status);//200
                alert(jqXHR.readyState);//4
                alert(jqXHR.statusText);//parsererror
                /*弹出其他两个参数的信息*/
                alert(textStatus);//parsererror
                alert(errorThrown);//SyntaxError: Unexpected token ? in JSON at position 0
            }
        });

    })
    $("#tables").on("click","#apply",function () {
        var isbn= $(this).parents("tr").find("td").eq(1).text();
        $.ajax({
            url:"bookBad/applyBadBook",
            dataType:"json",
            data:{
                'isbn':isbn,
                'btype':1,
            },
            success:function(){
                alert("成功");
                window.location.reload();

            },error:function  (jqXHR, textStatus, errorThrown) {
                /*弹出jqXHR对象的信息*/
                alert(jqXHR.responseText);//????
                alert(jqXHR.status);//200
                alert(jqXHR.readyState);//4
                alert(jqXHR.statusText);//parsererror
                /*弹出其他两个参数的信息*/
                alert(textStatus);//parsererror
                alert(errorThrown);//SyntaxError: Unexpected token ? in JSON at position 0
            }
        });

    })
})