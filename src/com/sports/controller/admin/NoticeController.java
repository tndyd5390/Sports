package com.sports.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sports.dto.NoticeDTO;
import com.sports.dto.UserDTO;
import com.sports.service.INoticeService;
import com.sports.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 * */
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	
	@RequestMapping(value="testaaa")
	public String test(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		
		UserDTO uDTO = noticeService.testUser("1");
		model.addAttribute("uDTO", uDTO);
		
		return "test";
	}
			
}
