$(function () {
    var y=$("#salary_year option:selected").text();
    var m=$("#salary_month option:selected").text();
    var sid=$("#salary_aid").html();
    var attenceTime=new Date(y,m-1,1);
    var date={
        sId:sid,
        attenceTime:attenceTime
    };
    console.log(date);
    $.ajax({
        type:'POST',
        url:'salary/sal',
        data:JSON.stringify(date),
        cache: false, // 是否缓存
        async: true, // 是否异步执行
        processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
        contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
        success:function (resultData) {
            console.log(resultData);
            var str1=resultData["count"];
            var str2=resultData["num"];
            var str3=Math.ceil(resultData["sala"]);
            $("#salary_span_f").html(str1);
            $("#salary_span_s").html(str2);
            $("#salary_span_t").html(str3);
            // $.each(resultData[key],function (i, el) {
            //     $("#salary span:nth-of-type("+i+")").html(el);
            // })
            /*   for (var key in resultData){
                   var i=1;
                   $("#salary span:nth-of-type("+i+")").html(resultData[key]);
                   $("#salary span:nth-of-type("+i+")").html(resultData[key]);
                   $("#salary span:nth-of-type("+i+")").html(resultData[key]);
                   console.log("key:"+key+","+resultData[key]);
                   i+=1;
               }*/
        }
    });

    $("#salary_btn").click(function () {
        var yy=$("#salary_year option:selected").text();
        var mm=$("#salary_month option:selected").text();
        var attenceTime1=new Date(yy,mm-1,1);
        date.attenceTime=attenceTime1;
        $.ajax({
            type:'POST',
            url:'salary/sal',
            data:JSON.stringify(date),
            cache: false, // 是否缓存
            async: true, // 是否异步执行
            processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
            contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
            success:function (resultData) {
                console.log(resultData);
                var count=resultData["count"];
                var num=resultData["num"];
                var sala=Math.ceil(resultData["sala"]);
                $("#salary_span_f").html(count);
                $("#salary_span_s").html(num);
                $("#salary_span_t").html(sala);
            }
        });
    });
});