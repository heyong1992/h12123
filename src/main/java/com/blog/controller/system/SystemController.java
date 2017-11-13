package com.blog.controller.system;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("system")
public class SystemController {
    /**
     * 用户查询.
     * @return
     */
    @RequestMapping("/permissionAdd")
    public String permissionAdd(){
        return "system/permissionAdd";
    }

    /**
     * 用户查询.
     * @return
     */
    @RequestMapping("/permissionList")
    public String permissionList(){
        return "system/permissionList";
    }

}
