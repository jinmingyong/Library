$(document).ready(function(){
    var apply="<button id='apply' class=\"btn btn-primary btn-lg\" data-toggle=\"modal\" data-target=\"#myModal\">添加</button>"
    $("#tables").on("click","#apply",function () {
        var isbn= $(this).parents("tr").find("td").eq(1).text();
        var bookname= $(this).parents("tr").find("td").eq(2).text();
        $("#isbn").val(isbn);
        $("#bname").val(bookname);
    })
    $.ajax({
        url:"applyBook/showApply",
        dataType:"json",
        success:function(data){
            $.each(data, function(index, item){
                $("#tb").append("<tr>" +
                    "<td>"+item.id+"</td>" +
                    "<td>"+item.isbn+"</td>" +
                    "<td>"+item.bname+"</td>" +
                    "<td>"+item.applytime+"</td>" +
                    "<td>"+item.adminid+"</td>" +
                    "<td>"+apply+"</td>" +
                    "</tr>")
            });

        }
    });


})