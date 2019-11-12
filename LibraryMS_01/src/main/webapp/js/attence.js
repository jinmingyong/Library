const DATE = new Date();
const YEAR = DATE.getFullYear();
const MONTH = DATE.getMonth() + 1;
const DAY = DATE.getDate();

const WEEKTABLE = {
    common: {
        cn: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
        cns: ['日', '一', '二', '三', '四', '五', '六'],
        en: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    },
    intl: {
        cn: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'],
        cns: ['一', '二', '三', '四', '五', '六', '日'],
        en: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    }
};

//修正年月
function fixedYM(year , month ) {
    if (+month === 0) {
        year = +year - 1;
        month = 12;
    };
    if (+month === 13) {
        year = +year + 1;
        month = 1;
    };
    return [year, month];
};
//获取某年某月有多少天
function getMonthDays(year, month) {
    const YM = this.fixedYM(year, month);
    return new Date(YM[0], YM[1], 0).getDate();
};
//返回某年某月某日是星期几
function getWeekday(year, month, day) {
    const YM = this.fixedYM(year, month);
    return new Date(YM[0], YM[1] - 1, day).getDay();
};
//获取某年某月的具体天数的排列顺序
function getMonthDaysArray(year , month , day) {
    if (typeof day === 'undefined' && year === YEAR && month === MONTH) day = DAY;
    let dayArrays = [];
    const days = this.getMonthDays(year, month), preDays = this.getMonthDays(year, month - 1);
    const thisMonthFirstDayInWeek = this.getWeekday(year, month, 1), thisMonthLastDayInWeek = this.getWeekday(year, month, days);
    const thisMonthAllDays = thisMonthFirstDayInWeek + days + 6 - thisMonthLastDayInWeek;
    //上月在当月日历面板中的排列
    for (let i = 0; i < thisMonthFirstDayInWeek; i++) {
        dayArrays.push({
            dayNum: (preDays - thisMonthFirstDayInWeek + i + 1),
            weekDay: WEEKTABLE.common.cn[i]
        })
    }
    //当月日历面板中的排列
    for (let i = 1; i <= days; i++) {
        const weekDayFlag = (thisMonthFirstDayInWeek + i - 1) % 7
        dayArrays.push({
            dayNum: i,
            weekDay: WEEKTABLE.common.cn[weekDayFlag],
            selected: i === +day,
            isThisMonth: true
        })
    };
    //下月在当月日历面板中的排列
    for (let i = 1; i <= (6 - thisMonthLastDayInWeek); i++) {
        const weekDayFlag = (thisMonthFirstDayInWeek + days + i - 1) % 7
        dayArrays.push({
            dayNum: i,
            weekDay: WEEKTABLE.common.cn[weekDayFlag]
        })
    };
    return dayArrays;
}
var dArrays=getMonthDaysArray(YEAR,MONTH,DAY);
console.log(dArrays);
function getStr(dArrays) {
    var str="";
    for (var i=0;i<dArrays.length/7;i++){
        str+="<tr>";
        for (var j=i*7;j<(i*7+7);j++) {
            str+="<td>"+dArrays[j].dayNum+"</td>";
        }
        str+="</tr>";
    }
    return str;
}

$(function () {
    $("li:nth-of-type(2)").html(YEAR);
    $("li:nth-of-type(3)").html(MONTH);
    var sid=$("#attence_aid").html();
    var str=getStr(dArrays);
    $("#calendar_body").html(str);
    console.log(YEAR);
    console.log(MONTH);
    var attenceTime=new Date(YEAR,MONTH-1,1);
    var data={
        sId:sid,
        attenceTime:attenceTime
    }
    $.ajax({
        type:'POST',
        url:'attence/getAttence',
        data:JSON.stringify(data),
        cache: false, // 是否缓存
        async: true, // 是否异步执行
        processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
        contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
        success:function (resultData) {
            console.log(resultData);
            for (var i = 0; i < resultData.length; i++){
                var attenceTime = resultData[i];
                console.log(attenceTime);
                for (var j=0;j<dArrays.length;j++){
                    if (dArrays[j].isThisMonth) {
                        if (attenceTime===dArrays[j].dayNum){
                            var ctd = document.getElementsByTagName("td")[j];
                            ctd.style.backgroundColor="orange";
                            ctd.style.borderRadius="50%";
                            console.log(j);
                        }
                    }
                }
            }
        }
    });

    $("#clock_in").click(function () {
        var data1={
            sId:sid
        }
        $.ajax({
            type:'POST',
            url:'attence/insert',
            data:JSON.stringify(data1),
            cache: false, // 是否缓存
            async: true, // 是否异步执行
            processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
            contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
            success:function (data) {
                if (data=="success") {
                    alert("打卡成功！");
                }else if (data=="no") {
                    alert("您今日已打卡，不能重复打卡！")
                }else if (data=="later") {
                    alert("您已迟到!");
                }
                window.location.reload();
            },
            error:function (resultData) {
                alert("打卡失败！");
            }
        });
    });

    var yea=parseInt($("#calender_header li:nth-of-type(2)").html());
    var mon=parseInt($("#calender_header li:nth-of-type(3)").html());
    console.log(yea);
    console.log(mon);
    $("#calender_header li:nth-of-type(1)").click(function () {
        if (mon == 1) {
            mon=12;
            yea-=1;
        }else {
            mon-=1;
        }
        data.attenceTime=new Date(yea,mon-1);
        $("#calender_header li:nth-of-type(2)").html(yea);
        $("#calender_header li:nth-of-type(3)").html(mon);
        var das=getMonthDaysArray(yea,mon,DAY);
        var str=getStr(das);
        $("#calendar_body").html(str);
        $("#calendar_day td").removeClass("calendar_attence");
        $.ajax({
            type:'POST',
            url:'attence/getAttence',
            data:JSON.stringify(data),
            cache: false, // 是否缓存
            async: true, // 是否异步执行
            processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
            contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
            success:function (resultData) {
                for (var i = 0; i < resultData.length; i++){
                    var attenceTime = resultData[i];
                    for (var j=0;j<dArrays.length;j++){
                        if (dArrays[j].isThisMonth) {
                            if (attenceTime===dArrays[j].dayNum){
                                var ctd = document.getElementsByTagName("td")[j];
                                ctd.style.backgroundColor="orange";
                                ctd.style.borderRadius="50%";
                                console.log(j);
                            }
                        }
                    }
                }
            }
        });
    });

    $("#calender_header li:nth-of-type(4)").click(function () {
        if (mon == 12) {
            mon=1;
            yea+=1;
        }else {
            mon+=1;
        }
        data.attenceTime=new Date(yea,mon-1);
        $("#calender_header li:nth-of-type(2)").html(yea);
        $("#calender_header li:nth-of-type(3)").html(mon);
        var das=getMonthDaysArray(yea,mon,DAY);
        var str=getStr(das);
        $("#calendar_body").html(str);
        $("#calendar_day td").removeClass("calendar_attence");
        $.ajax({
            type:'POST',
            url:'attence/getAttence',
            data:JSON.stringify(data),
            cache: false, // 是否缓存
            async: true, // 是否异步执行
            processData: false, // 是否处理发送的数据  (必须false才会避开jQuery对 formdata 的默认处理)
            contentType: 'application/json;charset=UTF-8', // 设置Content-Type请求头
            success:function (resultData) {
                for (var i = 0; i < resultData.length; i++){
                    var attenceTime = resultData[i];
                    for (var j=0;j<dArrays.length;j++){
                        if (dArrays[j].isThisMonth) {
                            if (attenceTime===dArrays[j].dayNum){
                                var ctd = document.getElementsByTagName("td")[j];
                                ctd.style.backgroundColor="orange";
                                ctd.style.borderRadius="50%";
                                console.log(j);
                            }
                        }
                    }
                }
            }
        });
    });
});