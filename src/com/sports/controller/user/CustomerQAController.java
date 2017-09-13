package com.sports.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sports.dto.QADTO;
import com.sports.service.IQAService;
import com.sports.util.CmmUtil;

@Controller
public class CustomerQAController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="QAService")
	private IQAService qAService;
	
	@RequestMapping(value="customer/qaList", method=RequestMethod.GET)
	public String customerQaList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customer.qaList start!!!");
		
		log.info(this.getClass() + ".customer.qaList end!!!");
		return "customer/qaList";
	}
	
	@RequestMapping(value="customer/qaReg", method=RequestMethod.GET)
	public String customerQaReg(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customer.qaReg start!!!");
		
		log.info(this.getClass() + ".customer.qaReg end!!!");
		return "customer/qaRegView";
	}
	
	@RequestMapping(value="customer/qaRegProc", method=RequestMethod.POST)
	public String customerQaRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerQaRegProc start!!!");
		String title = CmmUtil.nvl(req.getParameter("title"));
		log.info(this.getClass() + " title : " + title);
		String contents = CmmUtil.nvl(req.getParameter("contents"));
		log.info(this.getClass() + " contents : " + contents);
		String secretStatus = CmmUtil.nvl(req.getParameter("secret"));
		log.info(this.getClass() + " secretStatus : " + secretStatus);
		String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		log.info(this.getClass() + " userNo : " + userNo);
		
		/**
		 * qa 등록 로직 만들기
		 */
		QADTO qDTO = new QADTO(userNo, secretStatus, title, contents, userNo);
		int result = qAService.insertCustomerQA(qDTO);
		if(result != 0){
			model.addAttribute("msg", "QnA 등록에 성공했습니다.");
			model.addAttribute("url", "qaList.do");
		}else{
			model.addAttribute("msg", "QnA 등록에 실패 했습니다.");
			model.addAttribute("url", "qaReg.do");
		}
		title = null;
		contents = null;
		secretStatus = null;
		userNo = null;
		qDTO = null;
		log.info(this.getClass() + ".customerQaRegProc end!!!");
		return "alert";
	}
}
