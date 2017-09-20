package com.sports.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerBasketController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="customer/BasketList", method=RequestMethod.GET)
	public String customerBasketList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerBasketList start!!!");
		return "basket/userBasket";
	}
}
