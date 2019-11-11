package com.controller;

import com.entity.Comment;
import com.entity.Remark;
import com.github.pagehelper.PageInfo;
import com.service.IRemarkService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/remark")
public class RemarkController {
    @Resource
    private IRemarkService remarkService;

    @RequestMapping("/showAllRemark")
    public @ResponseBody PageInfo<Remark> showAllRemark(Long comId,Integer page){
        List<Remark> list=remarkService.selectRemarkBycomId(comId,page);

        PageInfo<Remark> pageInfo=new PageInfo<Remark>(list);
        return pageInfo;
    }

    @RequestMapping("/showAllSonRemark")
    public @ResponseBody PageInfo<Remark> showAllRemark(Long comid,Long faterremid,Integer page){
        List<Remark> list=remarkService.selectRemarkBycomIdreply(comid,faterremid,page);
        PageInfo<Remark> pageInfo=new PageInfo<Remark>(list);
        return pageInfo;
    }

    @RequestMapping("/addRemark")
    public @ResponseBody String addRemark(Remark remark){
        remarkService.insertSelective(remark);
        return "success";
    }

    @RequestMapping("/deleRemark")
    public @ResponseBody String deleRemark(Long remId){
        remarkService.deleteByPrimaryKey(remId);
        return "success";
    }
}
