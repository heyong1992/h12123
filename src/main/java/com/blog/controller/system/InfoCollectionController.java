package com.blog.controller.system;

import com.blog.domain.UserInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by hey on 2018/7/11.
 */
@Controller
@RequestMapping("info")
public class InfoCollectionController {

    /**
     * 查询.
     * @return
     */
    @RequestMapping("/info1")
    public String info1(Model model,UserInfo userInfo){
        return "infoCollection/info1";
    }


}
