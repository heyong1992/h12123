package com.blog.controller;

import com.blog.domain.SysDict;
import com.blog.service.SysDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("sysDict")
public class SysDictController{
	
	@Autowired
	private SysDictService sysDictService;


	/**
	* 查询.
	* @return
	*/
	@RequestMapping("/list")
	public String list(Model model,SysDict sysDict){
		List<SysDict> list=sysDictService.findAll(sysDict);
		model.addAttribute("list",list);
		model.addAttribute("queryObj",sysDict);
		return "sysDict/SysDictList";
	}

	/**
	* 详情
	* @return
	*/
	@RequestMapping("/detail")
	public String detail(Integer id,Model model){
		if(id!=null){
			SysDict sysDict=sysDictService.findOne(id);
			model.addAttribute("obj",sysDict);
		}
		return "sysDict/SysDictDetail";
	}

	/**
	* 添加
	* @return
	*/
	@RequestMapping("/add")
	public String add(SysDict sysDict){
		sysDictService.save(sysDict);
		return "redirect:/sysDict/list";
	}
	/**
	* 删除
	* @return
	*/
	@RequestMapping("/delete")
	public String delete(Integer id){
		sysDictService.delete(id);
		return "redirect:/sysDict/list";
	}

}
