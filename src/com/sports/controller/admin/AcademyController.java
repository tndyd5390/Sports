package com.sports.controller.admin;

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
	
	@RequestMapping(value="accountReg")
	public String accountReg(HttpSession session) throws Exception{
		log.info(this.getClass() + "accountReg Start!!");
		
		log.info(this.getClass() + "accountReg End!!");
		return "account/accountReg";
	}
	
	@RequestMapping(value="accountRegProc")
	public String accountRegProc(HttpServletRequest req, HttpSession session, Model model)throws Exception{
		log.info(this.getClass() + "accountRegProc Start!!");
		String accountName = CmmUtil.nvl(req.getParameter("accountName"));
		String upstream = CmmUtil.nvl(req.getParameter("upstream"));
		/*String representative = CmmUtil.nvl(req.getParameter("representative"));*/
		String tel = CmmUtil.nvl(req.getParameter("tel"));
		String postcode = CmmUtil.nvl(req.getParameter("postcode"));
		String address1 = CmmUtil.nvl(req.getParameter("address1"));
		String address2 = CmmUtil.nvl(req.getParameter("address2"));
		String dealDate = CmmUtil.nvl(req.getParameter("dealDate"));
		
		log.info("accountName : " + accountName);
		log.info("upstream : " + upstream);
		/*log.info("representative : " + representative);*/
		log.info("tel : " + tel);
		log.info("postcode : " + postcode);
		log.info("address1 : " + address1);
		log.info("address2 : " + address2);
		log.info("dealDate : " + dealDate);
		
		AcademyDTO aDTO = new AcademyDTO();
		
		aDTO.setAca_name(accountName);
		aDTO.setAca_event1(upstream);
		aDTO.setTel(tel);
		aDTO.setAca_area1(postcode);
		aDTO.setAca_area2(address1);
		aDTO.setAca_area3(address2);
		aDTO.setAca_comment(dealDate);
		
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
