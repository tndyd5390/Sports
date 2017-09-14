package com.sports.controller.admin;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sports.service.IBasketService;

@Controller
public class BasketController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BasketService")
	private IBasketService basketService;
	
	@RequestMapping(value="userBasket")
	public String userBasket(HttpServletRequest req,HttpServletResponse resp,Model model)throws Exception{
		log.info(this.getClass().getName() + "userBasket Start!!");
		
		
		
		log.info(this.getClass().getName() + "userBasket END!!");
		
		return "";
	}
	
}
