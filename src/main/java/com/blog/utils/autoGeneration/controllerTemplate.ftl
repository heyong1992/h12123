package com.blog.controller;

import com.blog.domain.${className?cap_first};
import com.blog.service.${className?cap_first}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("${className}")
public class ${className?cap_first}Controller{
	
	@Autowired
	private ${className?cap_first}Service ${className}Service;


	/**
	* 查询.
	* @return
	*/
	@RequestMapping("/list")
	public String list(Model model,${className?cap_first} ${className}){
		List<${className?cap_first}> list=${className}Service.findAll(${className});
		model.addAttribute("list",list);
		model.addAttribute("queryObj",${className});
		return "${className}/${className?cap_first}List";
	}

	/**
	* 详情
	* @return
	*/
	@RequestMapping("/detail")
	public String detail(Long id,Model model){
		if(id!=null){
			${className?cap_first} ${className}=${className}Service.findOne(id);
			model.addAttribute("obj",${className});
		}
		return "${className}/${className?cap_first}Detail";
	}

	/**
	* 添加
	* @return
	*/
	@RequestMapping("/add")
	public String add(${className?cap_first} ${className}){
		${className}Service.save(${className});
		return "redirect:/${className}/list";
	}
	/**
	* 删除
	* @return
	*/
	@RequestMapping("/delete")
	public String delete(Long id){
		${className}Service.delete(id);
		return "redirect:/${className}/list";
	}

}
