$(document).ready(function(){
    var add="<button class='btn btn-success' id='add2'>通过</button>";

    $.ajax({
        url:"bookBad/showAllBadBooks",
        dataType:"json",
        success:function(data){
            $.each(data, function(index, item){
                if(item.btype==1) {


                    $("#tb").append("<tr>" +
                        "<td>" + item.badId + "</td>" +
                        "<td>" + item.isbn + "</td>" +
                        "<td>" + item.badtime + "</td>" +
                        "<td>" + item.badnum + "</td>" +
                        "<td>" + add + "</td>" +
                        "</tr>")
                }
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
                    'badnum':2,
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
            url:"bookBad/applyBadBook",
            dataType:"json",
            data:{
                'isbn':isbn,
                'btype':2,
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