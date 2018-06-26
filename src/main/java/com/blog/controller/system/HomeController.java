package com.blog.controller.system;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.blog.domain.SysPermission;
import com.blog.domain.SysRole;
import com.blog.domain.UserInfo;
import org.apache.catalina.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    @RequestMapping({ "/", "index" })
    public String index(Model model) {
        UserInfo userInfo=(UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("userInfo",userInfo);
        /*for (SysRole role:userInfo.getRoleList()) {
            for(SysPermission syspermii){

            }
        }*/
        return "/index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, Map<String, Object> map) {
        System.out.println("HomeController.login");
        // 登录失败从request中获取shiro处理的异常信息
        // shiroLoginFailure:就是shiro异常类的全类名
        String exception = (String) request.getAttribute("shiroLoginFailure");
        String msg = "";
        if (exception != null) {
            if (UnknownAccountException.class.getName().equals(exception)) {
                System.out.println("UnknownAccountException -->帐号不存在：");
                msg = "UnknownAccountException -->帐号不存在：";
            } else if (IncorrectCredentialsException.class.getName().equals(exception)) {
                System.out.println("IncorrectCredentialsException -- > 密码不正确：");
                msg = "IncorrectCredentialsException -- > 密码不正确：";
            } else if ("kaptchaValidateFailed".equals(exception)) {
                System.out.println("kaptchaValidateFailed -- > 验证码错误");
                msg = "kaptchaValidateFailed -- > 验证码错误";
            } else {
                msg = "else >> " + exception;
                System.out.println("else -- >" + exception);
            }
        }
        map.put("msg", msg);
        // 此方法不处理登录成功,由shiro进行处理.
        return "redirect:/index";
    }
}