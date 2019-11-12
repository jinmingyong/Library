package com.utils;

import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("messageUtils")
public class MessageUtils
{
    @RequestMapping("/message")
    @ResponseBody
    public String Message(@RequestParam("name")String name, HttpServletRequest request) {
        Random re =new Random();
        String s ="";
        for(int i=0;i<4;i++){
            s+= String.valueOf(re.nextInt(10));
        }
        String host = "https://dxyzm.market.alicloudapi.com";
        String path = "/chuangxin/dxjk";
        String method = "POST";
        String appcode = "d2649340c51b433dafded220d6068a65";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        //测试可用默认短信模板,测试模板为专用模板不可修改,如需自定义短信内容或改动任意字符,请联系旺旺或QQ726980650进行申请
        querys.put("content", "【创信】你的验证码是："+s+"，3分钟内有效！");
        //request.setAttribute(name,);
        querys.put("mobile",name);
        Map<String, String> bodys = new HashMap<String, String>();
        HttpSession session=request.getSession();
        session.setAttribute(name,s);
        System.out.println(name);
        System.out.println("【创信】你的验证码是："+s+"，3分钟内有效！");
        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
//            HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
//            System.out.println(response.toString());
            //获取response的body
            //System.out.println(EntityUtils.toString(response.getEntity()));
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        return "success";
    }
}
