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
public class CustomerNoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="noticeList", method=RequestMethod.GET)
	public String userNoticeList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".userNoticeList start!!!");
		
		log.info(this.getClass() + ".userNoticeList end!!!");
		return "NoticeList";
	}

}
