package com.controller;

import com.entity.Comment;
import com.entity.Remark;
import com.github.pagehelper.PageInfo;
import com.service.IRemarkService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/remark")
public class RemarkController {
    @Resource
    private IRemarkService remarkService;

    @RequestMapping(value = "/showAllRemark")
    public @ResponseBody PageInfo<Remark> showAllRemark(Long comId,Integer page){
        List<Remark> list=remarkService.selectRemarkBycomId(comId,page);
        PageInfo<Remark> pageInfo=new PageInfo<Remark>(list);
        return pageInfo;
    }

    @RequestMapping(value = "addRemark")
    public @ResponseBody void addRemark(Remark remark){
        remarkService.insertSelective(remark);
    }

    @RequestMapping(value = "deleRemark")
    public void deleRemark(Long remId){
        remarkService.deleteByPrimaryKey(remId);
    }
}
