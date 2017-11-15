package com.blog.controller.system;

import com.blog.domain.SysPermission;
import com.blog.domain.SysRole;
import com.blog.domain.UserInfo;
import com.blog.service.system.SysRoleService;
import com.blog.service.system.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("userInfo")
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private SysRoleService sysRoleService;



    /**
     * 查询.
     * @return
     */
    @RequestMapping("/list")
    @RequiresPermissions("userInfo:view")//权限管理;
    public String list(Model model,UserInfo userInfo){
        List<UserInfo> list=userInfoService.findAll(userInfo);
        model.addAttribute("list",list);
        model.addAttribute("queryObj",userInfo);
        return "userInfo/UserInfoList";
    }


    /**
     * 详情
     * @return
     */
    @RequestMapping("/detail")
    public String detail(Long id,Model model){
        if(id!=null){
            UserInfo userInfo=userInfoService.findOne(id);
            model.addAttribute("obj",userInfo);
        }
        return "userInfo/UserInfoDetail";
    }

    /**
     * 添加
     * @return
     */
    @RequestMapping("/add")
    public String add(UserInfo userInfo,Model model){
        userInfo.setState(1);
        userInfo.setCreateDate(new Timestamp(System.currentTimeMillis()));
        userInfoService.save(userInfo);
        return "redirect:/userInfo/list";
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping("/delete")
    public String delete(Long id){
        userInfoService.delete(id);
        return "forward:/userInfo/list";
    }

    /**
     * 用户添加;
     * @return
     */
    @RequestMapping("/userAdd")
    @RequiresPermissions("userInfo:add")//权限管理;
    public String userInfoAdd(){
        return "userInfoAdd";
    }
    /**
     * 用户删除;
     * @return
     */
    @RequestMapping("/userDel")
    @RequiresPermissions("userInfo:del")//权限管理;
    public String userDel(){
        return "userInfoDel";
    }


    /**
     * 权限查询.
     * @return
     */
    @RequestMapping("/toSysRole")
    public String toSysRole(SysRole sysRole,Long userId, Model model){
        List<SysRole> roleList=sysRoleService.findAll(sysRole);
        //SysRole sysRole=sysRoleService.findOne(sysPermission.getId());
        List<String> havePermissionList=sysRoleService.findRByoleUserid(userId);
        for (SysRole role: roleList) {
            int roleId=role.getId().intValue();
            if(havePermissionList.contains(roleId)){
                role.setIsCheck("checked ");
            }
        }
        //model.addAttribute("sysPermissionList",sysRole.getPermissions());
        model.addAttribute("roleList",roleList);
        model.addAttribute("queryObj",sysRole);
        model.addAttribute("userId",userId);
        return "userInfo/roleList";
    }

    /**
     * 角色分配权限
     * @return
     */
    @RequestMapping("/assignAuth")
    public String assignAuth(Long roleId,Long userId){
        int resule=sysRoleService.assignAuth(roleId,userId,"sys_user_role");
        if(resule<1){
            return "false";
        }else{
            return "true";
        }
    }

    /**
     * 角色取消权限
     * @return
     */
    @RequestMapping("/cancleAuth")
    public String cancleAuth(Long roleId,Long userId){
        int resule=sysRoleService.cancleAuthUser(roleId,userId);
        if(resule<1){
            return "false";
        }else{
            return "true";
        }
    }
}
