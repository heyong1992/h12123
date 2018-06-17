package com.blog.controller;

import com.blog.domain.HeyTicket;
import com.blog.service.HeyTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("heyTicket")
public class HeyTicketController{
	
	@Autowired
	private HeyTicketService heyTicketService;


	/**
	* 查询.
	* @return
	*/
	@RequestMapping("/list")
	public String list(Model model,HeyTicket heyTicket){
		List<HeyTicket> list=heyTicketService.findAll(heyTicket);
		model.addAttribute("list",list);
		model.addAttribute("queryObj",heyTicket);
		return "heyTicket/HeyTicketList";
	}

	/**
	* 详情
	* @return
	*/
	@RequestMapping("/detail")
	public String detail(Long id,Model model){
		if(id!=null){
			HeyTicket heyTicket=heyTicketService.findOne(id);
			model.addAttribute("obj",heyTicket);
		}
		return "heyTicket/HeyTicketDetail";
	}

	/**
	* 添加
	* @return
	*/
	@RequestMapping("/add")
	public String add(HeyTicket heyTicket){
		heyTicketService.save(heyTicket);
		return "redirect:/heyTicket/list";
	}
	/**
	* 删除
	* @return
	*/
	@RequestMapping("/delete")
	public String delete(Long id){
		heyTicketService.delete(id);
		return "redirect:/heyTicket/list";
	}

}
