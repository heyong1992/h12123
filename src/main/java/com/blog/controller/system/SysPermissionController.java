package com.blog.controller.system;

import com.blog.domain.SysPermission;
import com.blog.domain.SysRole;
import com.blog.service.system.SysPermissionService;
import com.blog.service.system.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by hey on 2017/10/18.
 */
@Controller
@RequestMapping("sysPermission")
public class SysPermissionController {
    @Autowired
    private SysPermissionService sysPermissionService;
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 权限查询.
     * @return
     */
    @RequestMapping("/list")
    public String list(SysPermission sysPermission,Model model){
        List<SysPermission> permissionsList=sysPermissionService.findAll(sysPermission);
        model.addAttribute("menuList",permissionsList);
        model.addAttribute("queryObj",sysPermission);
        return "system/sysPermission/list";
    }

    /**
     * 权限详情
     * @return
     */
    @RequestMapping("/detail")
    public String detail(Long id,Model model){
        List<SysPermission> permissionsList=sysPermissionService.findAll(new SysPermission());
        model.addAttribute("menuList",permissionsList);
        List<SysRole> roleList=sysRoleService.findAll(new SysRole());
        model.addAttribute("roleList",roleList);
        if(id!=null){
            SysPermission sysPermission=sysPermissionService.findOne(id);
            model.addAttribute("sysPermission",sysPermission);
        }
        return "system/sysPermission/detail";
    }

    /**
     * 权限添加
     * @return
     */
    @RequestMapping("/add")
    public String add(SysPermission sysPermission){
        sysPermission=sysPermissionService.save(sysPermission);
        return "forward:/sysPermission/list";
    }
    /**
     * 权限删除
     * @return
     */
    @RequestMapping("/delete")
    public String delete(Long id){
        sysPermissionService.delete(id);
        return "forward:/sysPermission/list";
    }
}
