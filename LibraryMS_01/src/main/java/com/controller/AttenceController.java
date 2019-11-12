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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(path = "attence")
public class AttenceController {
    @Resource(name = "attenceService")
    private IAttenceService attenceService;

    @RequestMapping(value = "/insert",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
    public @ResponseBody
    String insert(@RequestBody Attence attence){
        String msg="success";
        Date date = new Date();
        int year = date.getYear()+1900;
        int month = date.getMonth()+1;
        Date date1=getDate(year,month);
        Date date2=getNextMonthDate(year,month);
        List<Attence> attenceList = attenceService.selectAttence(attence.getsId(),date1,date2);
        boolean flag=true;
        for (Attence attence1:attenceList){
            if (attence1.getAttenceTime().getDate()==date.getDate()){
                flag=false;
                msg="no";
            }
        }
        if (flag){
            if (date.getHours()>=9){
                msg="later";
            }
            attence.setAttenceTime(date);
            attenceService.insert(attence);
        }
        return msg;
    }
//
//    @RequestMapping(value = "/getAttenceCount",method = RequestMethod.POST)
//    public @ResponseBody int getAttenceCount(@RequestBody Attence attence){
//        int sid = attence.getsId();
//        int year = attence.getAttenceTime().getYear()+1900;
//        int month = attence.getAttenceTime().getMonth()+2;
//        Date date=getDate(year,month);
//        Date date1=getNextMonthDate(year,month);
//        int count = attenceService.selectAttenceCount(sid,date,date1);
//        return count;
//    }

    @RequestMapping(value = "/getAttence")
    public @ResponseBody
    List getAttence(@RequestBody Attence attence){
        int sid = attence.getsId();
        int year = attence.getAttenceTime().getYear()+1900;
        int month = attence.getAttenceTime().getMonth()+2;
        Date date=getDate(year,month);
        Date date1=getNextMonthDate(year,month);
        List<Attence> attenceList = attenceService.selectAttence(sid,date,date1);
        List list=new ArrayList();
        for (Attence attence1:attenceList){
            list.add(attence1.getAttenceTime().getDate());
        }
        return list;
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
