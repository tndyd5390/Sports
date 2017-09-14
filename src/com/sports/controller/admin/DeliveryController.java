package com.sports.controller.admin;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeliveryController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="deliverytracking")
	public String main() throws Exception{
		log.info(this.getClass() + "deliverytracking Start!!");
		
		log.info(this.getClass() + "deliverytracking End!!");
		return "delivery/deliverytracking";
	}
}
