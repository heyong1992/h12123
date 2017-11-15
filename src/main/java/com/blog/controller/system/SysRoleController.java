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

@Controller
@RequestMapping("sysRole")
public class SysRoleController{
	
	@Autowired
	private SysRoleService sysRoleService;

	@Autowired
	private SysPermissionService sysPermissionService;


	/**
	 * 查询.
	 * @return
	 */
	@RequestMapping("/list")
	public String list(Model model,SysRole sysRole){
		List<SysRole> list=sysRoleService.findAll(sysRole);
		model.addAttribute("list",list);
		model.addAttribute("queryObj",sysRole);
		return "sysRole/SysRoleList";
	}

	/**
	* 详情
	* @return
	*/
	@RequestMapping("/detail")
	public String detail(Long id,Model model){
		if(id!=null){
			SysRole sysRole=sysRoleService.findOne(id);
			model.addAttribute("obj",sysRole);
		}
		return "sysRole/SysRoleDetail";
	}

	/**
	* 添加
	* @return
	*/
	@RequestMapping("/add")
	public String add(SysRole sysRole){
		sysRoleService.save(sysRole);
		return "forward:/sysRole/list";
	}
	/**
	* 删除
	* @return
	*/
	@RequestMapping("/delete")
	public String delete(Long id){
		sysRoleService.delete(id);
		return "forward:/sysRole/list";
	}


	/**
	 * 权限查询.
	 * @return
	 */
	@RequestMapping("/toSysPermission")
	public String toSysPermission(SysPermission sysPermission, Model model){
		List<SysPermission> permissionsList=sysPermissionService.findAll(sysPermission);
		//SysRole sysRole=sysRoleService.findOne(sysPermission.getId());
		List<String> havePermissionList=sysRoleService.findPermissionByRoleid(sysPermission.getId());
		for (SysPermission permission: permissionsList) {
			int permissionId=permission.getId().intValue();
			if(havePermissionList.contains(permissionId)){
				permission.setIsCheck("checked ");
			}
		}
		//model.addAttribute("sysPermissionList",sysRole.getPermissions());
		model.addAttribute("menuList",permissionsList);
		model.addAttribute("queryObj",sysPermission);
		return "sysRole/sysPermissionList";
	}

	/**
	 * 角色分配权限
	 * @return
	 */
	@RequestMapping("/assignAuth")
	public String assignAuth(Long roleId,Long permissionId){
		int resule=sysRoleService.assignAuth(roleId,permissionId,"sys_role_permission");
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
	public String cancleAuth(Long roleId,Long permissionId){
		int resule=sysRoleService.cancleAuth(roleId,permissionId);
		if(resule<1){
			return "false";
		}else{
			return "true";
		}
	}

}
