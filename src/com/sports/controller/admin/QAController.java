package com.sports.controller.admin;

import java.util.List;
import java.util.Map;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sports.dto.QADTO;
import com.sports.service.IQAService;
import com.sports.util.AES256Util;
import com.sports.util.CmmUtil;
import com.sports.util.DateUtil;

@Controller
public class QAController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "QAService") 
	private IQAService qaService;
	
	@RequestMapping(value="admin/QA/QAList", method=RequestMethod.GET)
	public String QAList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAList start!");

		List<QADTO> rList = qaService.getQAList();
		
		if (rList==null) {
			rList = new ArrayList<QADTO>();
		}
		
		for (QADTO qaDTO : rList) {
			
			String reg_dt = CmmUtil.nvl(qaDTO.getReg_dt());
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = transFormat.parse(reg_dt);

			long now = System.currentTimeMillis();
			long inputDate = to.getTime();
			
			if (now - inputDate < (1000*60*60*24*3)) {
				qaDTO.setNew_yn("Y");
			} else {
				qaDTO.setNew_yn("");	
			}
		
			String title = CmmUtil.nvl(qaDTO.getTitle());	//제목이 14자 이상이면 ...붙여주기
		
			if (title.length() >= 14) {
				title = title.substring(0, 14) + "...";
			}
		
		}
		
		model.addAttribute("rList", rList);
		
		rList = null;
		
		log.info(this.getClass().getName() + ".QAList end!");
		
		return "/admin/QA/QAList";
		
	}
	
	@RequestMapping(value="admin/QA/QAReg", method=RequestMethod.GET)
	public String QAReg(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAReg start!");
		
		log.info(this.getClass().getName() + ".QAReg end!");
		
		return "/admin/QA/QAReg";
		
	}
	
	@RequestMapping(value="admin/QA/QAInsert", method=RequestMethod.POST)
	public String QAInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAInsert start!");
		
		String msg = "";
		String url = "";
		
		try {
			
			String reg_user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
			String secret_yn = CmmUtil.nvl(request.getParameter("secret_yn"));
			String title = CmmUtil.nvl(request.getParameter("title"));
			String contents = CmmUtil.nvl(request.getParameter("contents"));
			
			contents = contents.replace("\r\n", "<br>");
			
			log.info("reg_user_no: " + reg_user_no);
			log.info("secret_yn: " + secret_yn);
			log.info("title: " + title);
			log.info("contents: " + contents);		
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setReg_user_no(reg_user_no);
			qaDTO.setSecret_yn(secret_yn);
			qaDTO.setTitle(title);
			qaDTO.setContents(contents);

			qaService.insertQADetail(qaDTO);

			msg = "게시글 등록에 성공하였습니다.";
			url = "/admin/QA/QAList.do";
			
			qaDTO = null;
			
		} catch (Exception e) {
					
			msg = "게시글 등록에 실패하였습니다." + e.toString();
			url = "/admin/QA/QAList.do";
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QAInsert end!");

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="admin/QA/QADetail", method=RequestMethod.GET)
	public String QADetail(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QADetail start!");
		
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));

		log.info("qa_no: " + qa_no);
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setQa_no(qa_no);
		
		QADTO rDTO = qaService.getQADetail(qaDTO);
		
		if (rDTO==null) {
			rDTO = new QADTO();
		}
		
		log.info("getQADetail success!");

		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;
		qaDTO = null;
		
		log.info(this.getClass().getName() + ".QADetail end!");
		
		return "/admin/QA/QADetail";
		
	}
	
	@RequestMapping(value="admin/QA/QADelete", method=RequestMethod.GET)
	public String QADelete(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QADelete start!");
		
		String msg = "";
		String url = "";
		
		try {
			
			String q_no = CmmUtil.nvl(request.getParameter("q_no"));
			
			log.info("q_no: "+ q_no);
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setQ_no(q_no);
			
			qaService.deleteQADetail(qaDTO);
			
			msg = "게시글 삭제에 성공하였습니다.";
			url = "/admin/QA/QAList.do";
			
			qaDTO = null;
			
		} catch (Exception e) {
			
			msg = "게시글 삭제에 실패하였습니다."+ e.toString();
			url = "/admin/QA/QADetail.do";
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QADelete end!");
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="/admin/QA/QACheckboxDelete", method=RequestMethod.POST)
	public String QACheckboxDelete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QACheckboxDelete start!");
		
		String[] deleteSelect = request.getParameterValues("deleteSelect");
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setQa_no(qa_no);
		qaDTO.setAllCheckSeq(deleteSelect);
		
		qaService.deleteQAList(qaDTO);
		
		log.info(this.getClass().getName() + ".QACheckboxDelete end!");
		
		model.addAttribute("msg", "선택된 게시글 삭제에 성공하였습니다.");
		model.addAttribute("url", "/admin/QA/QAList.do");
		
		return "/redirect";
		
	}
	
	@RequestMapping(value="admin/QA/QAAnswerReg", method=RequestMethod.GET)
	public String QAAnswerReg(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAAnswerReg start!");
		
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
		String q_no = CmmUtil.nvl(request.getParameter("q_no"));
		String answer_yn = CmmUtil.nvl(request.getParameter("answer_yn"));
		String secret_yn = CmmUtil.nvl(request.getParameter("secret_yn"));
		String title = CmmUtil.nvl(request.getParameter("title"));
		
		log.info("qa_no: " + qa_no);
		log.info("q_no: " + q_no);
		log.info("answer_yn: " + answer_yn);
		log.info("secret_yn: " + secret_yn);
		log.info("title: " + title);
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setQa_no(qa_no);
		qaDTO.setQ_no(q_no);
		qaDTO.setAnswer_yn(answer_yn);
		qaDTO.setSecret_yn(secret_yn);
		qaDTO.setTitle(title);
		
		QADTO rDTO = qaService.getQADetail(qaDTO);
		
		if (rDTO==null) {
			rDTO = new QADTO();	
		}
		
		log.info("secret_yn: " + rDTO.getSecret_yn());
		log.info("title: " + rDTO.getTitle());
	
		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;
		qaDTO = null;
		
		log.info(this.getClass().getName() + ".QAAnswerReg end!");
		
		return "/admin/QA/QAAnswerReg";
		
	}
	
	@RequestMapping(value="admin/QA/QAAnswerInsert", method=RequestMethod.POST)
	public String QAAnswerInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAAnswerInsert start!");
		
		String msg = "";
		String url = "";
		
		try {
			
			String reg_user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
			String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
			String q_no = CmmUtil.nvl(request.getParameter("q_no"));
			String answer_yn = CmmUtil.nvl(request.getParameter("answer_yn"));
			String secret_yn = CmmUtil.nvl(request.getParameter("secret_yn"));
			String title = CmmUtil.nvl(request.getParameter("title"));
			String contents = CmmUtil.nvl(request.getParameter("contents"));
			
			contents = contents.replace("\r\n", "<br>");
			
			log.info("reg_user_no: " + reg_user_no);
			log.info("qa_no: " + qa_no);
			log.info("q_no: " + q_no);
			log.info("answer_yn: " + answer_yn);
			log.info("secret_yn: " + secret_yn);
			log.info("title: " + title);
			log.info("contents: " + contents);		
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setReg_user_no(reg_user_no);
			qaDTO.setQa_no(qa_no);
			qaDTO.setQ_no(q_no);
			qaDTO.setAnswer_yn(answer_yn);
			qaDTO.setSecret_yn(secret_yn);
			qaDTO.setTitle(title);
			qaDTO.setContents(contents);
				
			qaService.insertQAAnswerDetail(qaDTO);

			msg = "답글 등록에 성공하였습니다.";
			url = "/admin/QA/QAList.do";
			
			qaDTO = null;
			
		} catch (Exception e) {
					
			msg = "답글 등록에 실패하였습니다." + e.toString();
			url = "/admin/QA/QAList.do";
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QAAnswerInsert end!");

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="admin/QA/QAAnswerDetail", method=RequestMethod.GET)
	public String QAAnswerDetail(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAAnswerDetail start!");
		
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));

		log.info("qa_no: " + qa_no);
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setQa_no(qa_no);
		
		QADTO rDTO = qaService.getQAAnswerDetail(qaDTO);
		
		if (rDTO==null) {
			rDTO = new QADTO();
		}
		
		log.info("getQAAnswerDetail success!");

		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;
		qaDTO = null;
		
		log.info(this.getClass().getName() + ".QAAnswerDetail end!");
		
		return "/admin/QA/QAAnswerDetail";
		
	}
	
	@RequestMapping(value="admin/QA/QAAnswerEdit", method=RequestMethod.GET)
	public String QAAnswerEdit(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAAnswerEdit start!");
		
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
		String q_no = CmmUtil.nvl(request.getParameter("q_no"));
		
		log.info("qa_no: " + qa_no);
		log.info("q_no: " + q_no);
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setQa_no(qa_no);
		qaDTO.setQ_no(q_no);;	
		
		QADTO rDTO = qaService.getQAAnswerDetail(qaDTO);
		
		if (rDTO==null) {
			rDTO = new QADTO();	
		}
		
		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;
		qaDTO = null;
		
		log.info(this.getClass().getName() + ".QAAnswerEdit end!");
		
		return "/admin/QA/QAAnswerEdit";
		
	}
	
	@RequestMapping(value="admin/QA/QAAnswerUpdate", method=RequestMethod.POST)
	public String QAAnswerUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAAnswerUpdate start!");
		
		String msg = "";
		String url = "";
		
		try {
			
			String reg_user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no")); 
			String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
			String q_no = CmmUtil.nvl(request.getParameter("q_no"));
			String answer_yn = CmmUtil.nvl(request.getParameter("answer_yn"));
			String secret_yn = CmmUtil.nvl(request.getParameter("secret_yn")); 
			String title = CmmUtil.nvl(request.getParameter("title")); 
			String contents = CmmUtil.nvl(request.getParameter("contents"));
			
			contents = contents.replace("\r\n", "<br>");
			
			log.info("reg_user_no: " + reg_user_no);
			log.info("qa_no: " + qa_no);
			log.info("q_no: " + q_no);
			log.info("answer_yn: " + answer_yn);
			log.info("secret_yn: " + secret_yn);
			log.info("title: " + title);
			log.info("contents: " + contents);		
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setReg_user_no(reg_user_no);
			qaDTO.setQa_no(qa_no);
			qaDTO.setQ_no(q_no);
			qaDTO.setAnswer_yn(answer_yn);
			qaDTO.setSecret_yn(secret_yn);
			qaDTO.setTitle(title);
			qaDTO.setContents(contents);
			
			qaService.updateQAAnswerDetail(qaDTO);
	
			msg = "답글 수정에 성공하였습니다.";
			url = "/admin/QA/QAAnswerDetail.do?qa_no=" + qa_no;
			
			qaDTO = null;
			
		} catch(Exception e) {
			
			String qa_no = CmmUtil.nvl(request.getParameter("qa_no")); 
			
			msg = "답글 수정에 실패하였습니다."+ e.toString();
			url = "/admin/QA/QAAnswerDetail.do?qa_no=" + qa_no;
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QAAnswerUpdate end!");
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="admin/QA/QAAnswerDelete", method=RequestMethod.GET)
	public String QAAnswerDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAAnswerDelete start!");
		
		String msg = "";
		String url = "";
		
		try {
			
			String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
			
			log.info("qa_no: "+ qa_no);
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setQa_no(qa_no);
			
			qaService.deleteQAAnswerDetail(qaDTO);
			
			msg = "답글 삭제에 성공하였습니다.";
			url = "/admin/QA/QAList.do";
			
			qaDTO = null;
			
		} catch (Exception e) {
			
			msg = "답글 삭제에 실패하였습니다."+ e.toString();
			url = "/admin/QA/QAAnswerDetail.do";
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {   
			
			log.info(this.getClass().getName() + ".QAAnswerDelete end!");
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="/admin/QA/QAReadMore")
	public @ResponseBody List<QADTO> getQAMoreView(@RequestParam(value = "cnt") String cnt, @RequestParam(value = "search") String search) throws Exception {
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setRead_more(cnt);
		qaDTO.setSearch(search);
		
		System.out.println("넘어온 cnt: " + cnt);
		System.out.println("넘어온 search: " + search);
		
		List<QADTO> viewMore_list = qaService.getQAMoreView(qaDTO);
		
		for (QADTO qaDT : viewMore_list) {	//new 붙히는 시간 계산해서 rList의 title에 new 붙여주기
			
			String reg_dt = CmmUtil.nvl(qaDT.getReg_dt());
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = transFormat.parse(reg_dt);

			long now = System.currentTimeMillis();
			long inputDate = to.getTime();

			String title = CmmUtil.nvl(qaDT.getTitle());	//제목이 14자 이상이면 ...붙여주
			
			if (title.length() >= 14) {
			
				title = title.substring(0, 14) + "...";
				qaDT.setTitle(title);
				
			}
			
			if (now - inputDate < (1000*60*60*24*3)) {
				qaDT.setNew_yn("Y");
			}
			
			qaDT.setUser_name(qaDT.getUser_name());
			
		}
		
		System.out.println("겟 리드모어: " + qaDTO.getRead_more());
		
		for (QADTO qaDT : viewMore_list) {
			System.out.println("제목: " +  qaDT.getTitle());
		}
		
		qaDTO = null;
		
		return viewMore_list;
		
	}
	
	@RequestMapping(value="/admin/QA/QASearchList")
	public @ResponseBody List<QADTO> getQASearchList(@RequestParam(value="search") String search) throws Exception {
		
		System.out.println("search: " + search);
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setSearch(search);
		
		List<QADTO> viewSearch_list = qaService.getQASearchList(qaDTO);
		
		for (QADTO qaDT : viewSearch_list) {
			
			String reg_dt = CmmUtil.nvl(qaDT.getReg_dt());
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = transFormat.parse(reg_dt);
			
			long now = System.currentTimeMillis();
			long inputDate = to.getTime();

			String title = CmmUtil.nvl(qaDT.getTitle());	//제목이 14자 이상이면 ...붙여주기
			
			if (title.length() >= 14) {
				
				title = title.substring(0, 14) + "...";
				qaDT.setTitle(title);
				
			}
			
			if (now - inputDate < (1000*60*60*24*3)) {
				qaDT.setNew_yn("Y");
			}
			
			qaDT.setUser_name(qaDT.getUser_name());
			
		}	
		
		System.out.println("search: " + search);
		
		for (QADTO qaDT : viewSearch_list) {
			System.out.println("제목: " +  qaDT.getTitle());
		}
		
		qaDTO = null;
		
		return viewSearch_list;
		
	}
	
}