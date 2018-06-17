package com.blog.controller;

import com.blog.domain.HeyContent;
import com.blog.service.HeyContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("heyContent")
public class HeyContentController{
	
	@Autowired
	private HeyContentService heyContentService;


	/**
	* 查询.
	* @return
	*/
	@RequestMapping("/list")
	public String list(Model model,HeyContent heyContent){
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
	public String detail(Long id,Model model){
		if(id!=null){
			HeyContent heyContent=heyContentService.findOne(id);
			model.addAttribute("obj",heyContent);
		}
		return "heyContent/HeyContentDetail";
	}

	/**
	 * 详情
	 * @return
	 */
	@RequestMapping("/show")
	public String show(Long id,Model model){
		if(id!=null){
			HeyContent heyContent=heyContentService.findOne(id);
			model.addAttribute("obj",heyContent);
		}
		return "heyContent/HeyContentShow";
	}

	/**
	* 添加
	* @return
	*/
	@RequestMapping("/add")
	public String add(HeyContent heyContent){
		heyContentService.save(heyContent);
		return "redirect:/heyContent/list";
	}
	/**
	* 删除
	* @return
	*/
	@RequestMapping("/delete")
	public String delete(Long id){
		heyContentService.delete(id);
		return "redirect:/heyContent/list";
	}

}
