package com.controller;

import com.entity.Borrow;
import com.entity.Penalty;
import com.entity.Reader;
import com.service.IBorrowService;
import com.service.IPenaltyService;
import com.service.IReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class PenaltyController {
    @Autowired
    private IPenaltyService iPenaltyService;
    @Autowired
    private IReaderService studentService;
    @Autowired
    private IBorrowService iBorrowService;
    @RequestMapping("/findAllPenalty")
    public String findAllPenalty(Model model){
        List<Penalty> list=iPenaltyService.selectAllPenalty();
        model.addAttribute("pen",list);
        return "penatly";
    }
    @RequestMapping("/findPenaltyByRid")
    @ResponseBody
    public List<Penalty> findPenaltyByRid(@RequestParam String rid, Model model){
        List<Penalty> list=iPenaltyService.selectPenaltyByRid(rid);
        if (list.size()>0){
            return list;
        }else {
            System.out.println("没有");
            return null;
        }
    }
    @RequestMapping(value = "/inserPenatly")
    @ResponseBody
    public String InserPenatly(@RequestParam("id") Integer id, @RequestParam("isbn") String isbn, @RequestParam("rid") Integer rid, @RequestParam("penType") String penType) throws IOException {
        Reader user=studentService.selectByPrimaryKey(Long.valueOf(rid));
        Borrow borrow=iBorrowService.selectByPrimaryKey(Long.valueOf(id));
        if(user!=null&&borrow!=null){
            if (penType.equals("2")){
                user.setCredit((user.getCredit()-1));
                Penalty penalty=new Penalty();
                penalty.setIsbn(isbn);
                penalty.setRid(Long.valueOf(rid));
                penalty.setPenType(penType);
                penalty.setRepay(1.0);
                penalty.setPenTime(new Date());
                borrow.setBorType("2");
                iPenaltyService.insert(penalty);
                studentService.updateReader(user);
                iBorrowService.updateByPrimaryKey(borrow);
                return "success";
            }else if (penType.equals("3")){
                user.setCredit((user.getCredit()-2));
                Penalty penalty=new Penalty();
                penalty.setIsbn(isbn);
                penalty.setRid(Long.valueOf(rid));
                penalty.setPenType(penType);
                penalty.setRepay(2.0);
                penalty.setPenTime(new Date());
                borrow.setBorType("3");
                iPenaltyService.insert(penalty);
                studentService.updateReader(user);
                iBorrowService.updateByPrimaryKey(borrow);
                return "success";
            }else {
                return "";
            }
        }else {
            return "";
        }
    }

}
