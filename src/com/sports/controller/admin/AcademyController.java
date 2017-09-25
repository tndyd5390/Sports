package com.sports.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sports.service.IAcademyService;

@Controller
public class AcademyController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AcademyService")
	private IAcademyService academyService;
	
	@RequestMapping(value="accountReg")
	public String accountReg(HttpSession session) throws Exception{
		log.info(this.getClass() + "accountReg Start!!");
		
		log.info(this.getClass() + "accountReg End!!");
		return "account/accountReg";
	}
}
