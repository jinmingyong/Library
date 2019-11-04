package com.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterceptor implements HandlerInterceptor {
    /*
    * 预处理 controller方法前 success.jsp后
    * return true放行
    * 检查登陆没
    * */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("拦截器运行了----前-----");
        /*request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request,response);*/
        return true;
    }
    /*
     * 后处理 controller方法后 success.jsp前
     *
     * */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("拦截器运行了----后-----");
       // request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request,response);
    }
    /*
     * success.jsp后
     * 释放资源
     *
     * */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("拦截器运行了----最后-----");
    }
}
