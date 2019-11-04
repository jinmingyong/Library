package com.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SysExceptionResolver implements HandlerExceptionResolver {
    /*
    * 处理异常业务逻辑
    *
    *  */
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        //获取异常对象
        SysExcepetion e=null;
        if (ex instanceof SysExcepetion){
            e= (SysExcepetion) ex;
        }else {
            e=new SysExcepetion("系统正在维护");
        }
        //创建ModelAndView
        ModelAndView mv=new ModelAndView();
        mv.addObject("errorMsg",e.getMessage());
        mv.setViewName("error");
        return mv;
    }
}
