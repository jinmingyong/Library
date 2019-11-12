package com.controller;

import com.entity.Attence;
import com.service.IAttenceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "salary",method = RequestMethod.POST)
public class SalaryController {
    @Resource(name = "attenceService")
    private IAttenceService attenceService;

    @RequestMapping(value = "/sal",method = RequestMethod.POST)
    public @ResponseBody
    Map salary(@RequestBody Attence attence){
        int sId=attence.getsId();
        int year=attence.getAttenceTime().getYear()+1900;
        int month=attence.getAttenceTime().getMonth()+2;
        System.out.println(attence.getAttenceTime());
        System.out.println(month);
        int num=0; //迟到的天数
        Map map=new HashMap();
        Date date=getDate(year,month);
        Date date1=getNextMonthDate(year,month);
        System.out.println(date);
        System.out.println(date1);
        int count = attenceService.selectAttenceCount(sId,date,date1);//当月打卡天数
        List<Attence> attenceList = attenceService.selectAttence(sId,date,date1);
        for (Attence attence1:attenceList){
            int hours = attence1.getAttenceTime().getHours();
            if (hours>=9){
                num+=1;
            }
        }
        double sala=0;
        if (count<22){
            sala=count*(4000/21.75)-num*50;
        }else {
            sala=4000+(count-21.75)*(4000/21.75)*2-num*50;
        }
        map.put("count",count);
        map.put("num",num);
        map.put("sala",sala);
        System.out.println(map);
        return map;
    }

    //返回当前月
    public Date getDate(Integer year,Integer month){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String attenceTime=year+"-"+month+"-1";
        Date date=null;
        try {
            date=sdf.parse(attenceTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
    //返回下一个月
    public Date getNextMonthDate(Integer year,Integer month){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        if (month==12){
            year+=1;
            month=1;
        }else {
            month+=1;
        }
        String attenceTime=year+"-"+month+"-0";
        Date date=null;
        try {
            date=sdf.parse(attenceTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
