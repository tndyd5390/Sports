package com.sports.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sports.dto.ProductInfoDTO;
import com.sports.service.IProductInfoService;

@Controller
public class ProductInfoController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ProductInfoService")
	private IProductInfoService productInfoService;
	
	@RequestMapping(value="productList")
	public String productList()throws Exception{
		log.info(this.getClass() + " productList Start!!");
		
		log.info(this.getClass() + " productList End!!");
		return "product/sports_goods_list";
	}
	
	@RequestMapping(value="productReg")
	public String productReg(Model model) throws Exception{
		log.info(this.getClass() + " productReg Start!!");
		
		List<ProductInfoDTO> pList = new ArrayList<ProductInfoDTO>();		
		pList = productInfoService.getCategoryParents();
		
		model.addAttribute("pList", pList);
		log.info(this.getClass() + " productReg End!!");
		return "product/sports_goods_reg";
	}
	
	@RequestMapping(value="selectParents")
	public @ResponseBody List<ProductInfoDTO> selectParents(@RequestParam(value="parents") String parents)throws Exception{
		log.info(this.getClass() + " selectParents Start!!");
		
		log.info("parents_no : "+ parents);
		ProductInfoDTO pDTO = new ProductInfoDTO();
		pDTO.setParents_no(parents);
		List<ProductInfoDTO> pList = new ArrayList<ProductInfoDTO>();
		pList = productInfoService.getCategoryChild(pDTO);
		
		log.info(this.getClass() + " selectParents End!!");
		return pList;
	}
}