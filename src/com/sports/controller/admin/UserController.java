package com.sports.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@RequestMapping(value="mainTest")
	public String mainTest() throws Exception{
		System.out.println("Ž");
		
		return "jsp/main";
	}
}
