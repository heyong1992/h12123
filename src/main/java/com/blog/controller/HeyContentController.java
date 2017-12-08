package com.blog.controller;

import com.blog.domain.HeyContent;
import com.blog.domain.SysDict;
import com.blog.service.HeyContentService;
import com.blog.service.SysDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.FileOutputStream;
import java.sql.Blob;
import java.util.List;

@Controller
@RequestMapping("heyContent")
public class HeyContentController{
	
	@Autowired
	private HeyContentService heyContentService;

	@Autowired
	private SysDictService sysDictService;


	/**
	* 查询.
	* @return
	*/
	@RequestMapping("/list")
	public String list(Model model,HeyContent heyContent)  throws  Exception{
		List<HeyContent> list=heyContentService.findAll(heyContent);

		model.addAttribute("list",list);
		model.addAttribute("queryObj",heyContent);
		return "heyContent/HeyContentList";
	}

	/**
	* 详情
	* @return
	*/
	@RequestMapping("/detail")
	public String detail(Integer id,Model model){
		List<SysDict> dictList=sysDictService.findAll(new SysDict());
		model.addAttribute("dictList",dictList);
		if(id!=null){
			HeyContent heyContent=heyContentService.findOne(id);
			model.addAttribute("obj",heyContent);
		}
		return "heyContent/HeyContentDetail";
	}

	/**
	* 添加
	* @return
	*/
	@RequestMapping("/add")
	public String add(HeyContent heyContent,Model model){

		heyContentService.save(heyContent);
		return "redirect:/heyContent/list";
	}
	/**
	* 删除
	* @return
	*/
	@RequestMapping("/delete")
	public String delete(Integer id){
		heyContentService.delete(id);
		return "redirect:/heyContent/list";
	}

}
