package com.blog.controller.system;

import com.blog.domain.SysRole;
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

}
