package com.fuxianyang.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fuxianyang.beans.Brand;
import com.fuxianyang.beans.Goods;
import com.fuxianyang.service.GoodsService;

@Controller
public class GoodsController {

	@Resource
	private GoodsService goodsService;
	
	@RequestMapping("/list")
	public String list(Goods goods,Model model){
		List<Goods> goodsList = goodsService.getGoodsList(goods);
		System.out.println(goodsList);
		model.addAttribute("goodsList", goodsList);
		return "list";
	}
	
	@RequestMapping("/getBrandSelect")
	@ResponseBody
	public List<Brand> getBrandSelect(){
		List<Brand> brandSelect = goodsService.getBrandSelect();
		return brandSelect;
	}
	
	@RequestMapping("/add")
	public String add(Goods goods){
		int addAll = goodsService.addAll(goods);
		
		return "redirect:list";
	}
	@RequestMapping("/upd")
	public String upd(Goods goods){
		int updGood = goodsService.updGood(goods);
		
		return "redirect:list";
	}
	
	@RequestMapping("/updUtil")
	public String updUtil(Integer gid,Model model){
		Goods good = goodsService.getGood(gid);
		System.out.println(good);
		model.addAttribute("good", good);
		return "upd";
	}
	
}
