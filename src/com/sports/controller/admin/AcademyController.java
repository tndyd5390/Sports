package com.sports.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sports.dto.AcademyDTO;
import com.sports.service.IAcademyService;
import com.sports.util.CmmUtil;

@Controller
public class AcademyController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AcademyService")
	private IAcademyService academyService;
	

	@RequestMapping(value="accountmanagement")
	public String accountmanagement(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + "deliverytracking Start!!");
		List<AcademyDTO> aList = academyService.getAcademyList();
		if(aList == null){
			aList = new ArrayList<>();
		}
		model.addAttribute("aList", aList);
		log.info(this.getClass() + "deliverytracking End!!");
		return "account/accountmanagement";
	}
	
	@RequestMapping(value="accountReg")
	public String accountReg(HttpSession session) throws Exception{
		log.info(this.getClass() + "accountReg Start!!");
		
		log.info(this.getClass() + "accountReg End!!");
		return "account/accountReg";
	}
	
	@RequestMapping(value="accountRegProc")
	public String accountRegProc(HttpServletRequest req, HttpSession session, Model model)throws Exception{
		log.info(this.getClass() + "accountRegProc Start!!");
		String aca_name = CmmUtil.nvl(req.getParameter("aca_name"));
		String aca_ceo = CmmUtil.nvl(req.getParameter("aca_ceo"));
		String aca_area1 = CmmUtil.nvl(req.getParameter("aca_area1"));
		String aca_area2 = CmmUtil.nvl(req.getParameter("aca_area2"));
		String aca_event1 = CmmUtil.nvl(req.getParameter("aca_event1"));
		String tel = CmmUtil.nvl(req.getParameter("tel"));
		String aca_comment = CmmUtil.nvl(req.getParameter("aca_comment"));
		
		log.info("aca_name : " + aca_name);
		log.info("aca_ceo : " + aca_ceo);
		log.info("aca_area1 : " + aca_area1);
		log.info("aca_area2 : " + aca_area2);
		log.info("aca_event1 : " + aca_event1);
		log.info("tel : " + tel);
		log.info("aca_comment : " + aca_comment);
		
		AcademyDTO aDTO = new AcademyDTO();
		
		aDTO.setAca_name(aca_name);
		aDTO.setAca_ceo(aca_ceo);
		aDTO.setAca_area1(aca_area1);
		aDTO.setAca_area2(aca_area2);
		aDTO.setAca_event1(aca_event1);
		aDTO.setTel(tel);
		aDTO.setAca_comment(aca_comment);
		
		log.info("test!!!!!!!!!");
		
		academyService.insertAcademy(aDTO);
		
		log.info("test???????????");
		
		aDTO = null;
		
		model.addAttribute("msg", "등록되었습니다.");
		model.addAttribute("url", "accountmanagement.do");
		
		log.info(this.getClass() + "accountRegProc End!!");
		return "alert/alert";
	}
}
