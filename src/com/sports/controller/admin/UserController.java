package com.sports.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sports.dto.UserDTO;
import com.sports.service.IUserService;
import com.sports.util.CmmUtil;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	@RequestMapping(value="mainTest")
	public String mainTest() throws Exception{
		System.out.println("Ž");
		
		return "jsp/main";
	}
	
	
	@RequestMapping(value="userReg")
	public String userReg(HttpSession session) throws Exception{
		log.info(this.getClass() + "userReg Start!!");
		
		log.info(this.getClass() + "userReg End!!");
		return "admin/userReg";
	}
	@RequestMapping(value="idCheck")
	public void idCheck(@RequestParam(value="id") String id, HttpServletResponse resp) throws Exception{
		log.info(this.getClass() + " idCheck Start!!");
		
		System.out.println(id);
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(id);
		int check = userService.getIdCheck(uDTO);
		
		
		resp.getWriter().print(check);
		resp.getWriter().flush();
		resp.getWriter().close();
		id = null;
		uDTO = null;
		
		log.info(this.getClass() + " idCheck End!!");
	}
	
	
	@RequestMapping(value="userRegProc")
	public String userRegProc(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + "userRegProc Start!!");
		
		
		String userId = CmmUtil.nvl(req.getParameter("id"));
		String password = CmmUtil.nvl(req.getParameter("password"));
		String userName = CmmUtil.nvl(req.getParameter("userName"));
		String email = CmmUtil.nvl(req.getParameter("email"));
		String tel = CmmUtil.nvl(req.getParameter("tel"));
		String postcode = CmmUtil.nvl(req.getParameter("postcode"));
		String address1 = CmmUtil.nvl(req.getParameter("address1"));
		String address2 = CmmUtil.nvl(req.getParameter("address2"));
		
		log.info("userId : "+userId);
		log.info("password : "+password);
		log.info("userName : "+userName);
		log.info("email : "+email);
		log.info("tel : "+tel);
		log.info("postcode : "+postcode);
		log.info("address1 : "+address1);
		log.info("address2 : "+address2);
		
		UserDTO uDTO = new UserDTO();
		
		uDTO.setUser_name(userName);
		uDTO.setUser_id(userId);
		uDTO.setPassword(password);
		uDTO.setTel(tel);
		uDTO.setEmail(email);
		uDTO.setPostcode(postcode);
		uDTO.setAddress1(address1);
		uDTO.setAddress2(address2);
		
		userService.insertUserInfo(uDTO);
		
		uDTO = null;
		
		log.info(this.getClass() + "userRegProc End!!");
		return "redirect:mainTest.do";
	}
}
