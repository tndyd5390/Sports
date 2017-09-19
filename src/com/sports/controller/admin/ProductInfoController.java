package com.sports.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String productReg() throws Exception{
		log.info(this.getClass() + " productReg Start!!");
		
		log.info(this.getClass() + " productReg End!!");
		return "product/sports_goods_reg";
	}
}
