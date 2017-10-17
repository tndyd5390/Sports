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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sports.dto.AcademyDTO;
import com.sports.service.IAcademyService;
import com.sports.util.CmmUtil;
import com.sports.util.GeoCodeUtil;
import com.sports.util.TextUtil;

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
		String aca_ceo = "";
		String tel = "";
		String reg_user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		String acaname = CmmUtil.nvl(req.getParameter("aca_name"));
		String aca_name = TextUtil.exchangeEscapeNvl(acaname);
		String acaceo = CmmUtil.nvl(req.getParameter("aca_ceo"));
		if(acaceo.equals("")){
			aca_ceo = "정보없음";
		}else{
			aca_ceo = acaceo;
		}
		String aca_area1 = CmmUtil.nvl(req.getParameter("aca_area1"));
		String aca_area = CmmUtil.nvl(req.getParameter("aca_area2"));
		String aca_area2 = TextUtil.exchangeEscapeNvl(aca_area);
		String aca_area3 = CmmUtil.nvl(req.getParameter("aca_area3"));
		String aca_event1 = CmmUtil.nvl(req.getParameter("aca_event1"));
		String Tel = CmmUtil.nvl(req.getParameter("tel"));
		if(Tel.equals("")){
			tel = "정보없음";
		}else{
			tel = Tel;
		}
		String aca_comment = CmmUtil.nvl(req.getParameter("aca_comment"));
		Float[] locs = GeoCodeUtil.geoCoding(aca_area2);
		String x = CmmUtil.nvl(locs[0].toString());
		String y = CmmUtil.nvl(locs[1].toString());
		
		log.info("reg_user_no : "+ reg_user_no);
		log.info("aca_name : " + aca_name);
		log.info("aca_ceo : " + aca_ceo);
		log.info("aca_area1 : " + aca_area1);
		log.info("aca_area2 : " + aca_area2);
		log.info("aca_area3 : " + aca_area3);
		log.info("aca_event1 : " + aca_event1);
		log.info("tel : " + tel);
		log.info("aca_comment : " + aca_comment);
		log.info("x : " + x);
		log.info("y : " + y);
		
		AcademyDTO aDTO = new AcademyDTO();
		
		aDTO.setAca_name(aca_name);
		aDTO.setAca_ceo(aca_ceo);
		aDTO.setAca_area1(aca_area1);
		aDTO.setAca_area2(aca_area2);
		aDTO.setAca_area3(aca_area3);
		aDTO.setAca_event1(aca_event1);
		aDTO.setTel(tel);
		aDTO.setAca_comment(aca_comment);
		aDTO.setAca_lat(x);
		aDTO.setAca_lng(y);
		aDTO.setReg_user_no(reg_user_no);
		
		log.info("test!!!!!!!!!");
		
		academyService.insertAcademy(aDTO);
		
		log.info("test???????????");
		
		aDTO = null;
		
		model.addAttribute("msg", "등록되었습니다.");
		model.addAttribute("url", "accountmanagement.do");
		
		log.info(this.getClass() + "accountRegProc End!!");
		return "alert/alert";
	}
	
	@RequestMapping(value="accountDetail")
	public String accountDetail(HttpServletRequest req, HttpServletResponse res, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + "accountDetail Start!!");
		
		String aca_no = req.getParameter("aca_no");
		
		AcademyDTO cDTO = new AcademyDTO();
		cDTO.setAca_no(aca_no);
		
		AcademyDTO aDTO = academyService.getAcademyDetailInfo(cDTO);
		
		model.addAttribute("aDTO", aDTO);
		
		cDTO = null;
		
		log.info(this.getClass() + "accountDetail End!!");
		return "account/accountDetail";
	}
	@RequestMapping(value="accountUpdate")
	public String accountUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + "accountUpdate Start!!");
		String aca_no = req.getParameter("aca_no");
		AcademyDTO cDTO = new AcademyDTO();
		cDTO.setAca_no(aca_no);

		AcademyDTO aDTO = academyService.getAcademyDetailInfo(cDTO);

		model.addAttribute("aDTO", aDTO);

		cDTO = null;
		log.info(this.getClass() + "accountUpdate End!!");
		return "account/accountUpdate";
	}
	@RequestMapping(value="accountUpdateProc")
	public String accountUpdateProc(HttpServletRequest req, HttpSession session, Model model)throws Exception{
		log.info(this.getClass() + "accountUpdateProc Start!!");
		
		String chg_user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		String aca_no = CmmUtil.nvl(req.getParameter("aca_no"));
		String acaname = CmmUtil.nvl(req.getParameter("aca_name"));
		String aca_name = TextUtil.exchangeEscapeNvl(acaname);
		String aca_ceo = CmmUtil.nvl(req.getParameter("aca_ceo"));
		String aca_area1 = CmmUtil.nvl(req.getParameter("aca_area1"));
		String aca_area = CmmUtil.nvl(req.getParameter("aca_area2"));
		String aca_area2 = TextUtil.exchangeEscapeNvl(aca_area);
		String aca_area3 = CmmUtil.nvl(req.getParameter("aca_area3"));
		String aca_event1 = CmmUtil.nvl(req.getParameter("aca_event1"));
		String tel = CmmUtil.nvl(req.getParameter("tel"));
		String aca_comment = CmmUtil.nvl(req.getParameter("aca_comment"));
		Float[] locs = GeoCodeUtil.geoCoding(aca_area2);
		String x = CmmUtil.nvl(locs[0].toString());
		String y = CmmUtil.nvl(locs[1].toString());
		
		log.info("chg_user_no : "+ chg_user_no);
		log.info("aca_no : " + aca_no);
		log.info("aca_name : " + aca_name);
		log.info("aca_ceo : " + aca_ceo);
		log.info("aca_area1 : " + aca_area1);
		log.info("aca_area2 : " + aca_area2);
		log.info("aca_area3 : " + aca_area3);
		log.info("aca_event1 : " + aca_event1);
		log.info("tel : " + tel);
		log.info("aca_comment : " + aca_comment);
		log.info("x : " + x);
		log.info("y : " + y);
		
		AcademyDTO aDTO = new AcademyDTO();
		aDTO.setAca_no(aca_no);
		aDTO.setAca_name(aca_name);
		aDTO.setAca_ceo(aca_ceo);
		aDTO.setAca_area1(aca_area1);
		aDTO.setAca_area2(aca_area2);
		aDTO.setAca_area3(aca_area3);
		aDTO.setAca_event1(aca_event1);
		aDTO.setTel(tel);
		aDTO.setAca_comment(aca_comment);
		aDTO.setAca_lat(x);
		aDTO.setAca_lng(y);
		aDTO.setChg_user_no(chg_user_no);
		
		academyService.updateAcademyDetail(aDTO);
		
		aDTO = null;
		
		model.addAttribute("msg", "수정되었습니다.");
		model.addAttribute("url", "accountDetail.do?aca_no="+aca_no);
		
		log.info(this.getClass() + "accountUpdateProc End!!");
		return "alert/alert";
	}
	@RequestMapping(value="accountDelete")
	public String accountDelete(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + "accountDelte start!!");
		
		String aca_no = CmmUtil.nvl(req.getParameter("aca_no"));
		log.info("aca_no : " + aca_no);
		academyService.academyDelete(aca_no);
		
		model.addAttribute("msg", "삭제되었습니다.");
		model.addAttribute("url", "accountmanagement.do");
		
		log.info(this.getClass() + "accountDelte end!!");
		return "alert/alert";
	}
	@RequestMapping(value="readMore")
	public @ResponseBody List<AcademyDTO> AcademyMoreView(@RequestParam(value = "cnt") String cnt,
			@RequestParam(value = "search") String search) throws Exception{
		AcademyDTO aDTO = new AcademyDTO();
		
		aDTO.setRead_more(cnt);
		log.info("cnt : " + cnt);
		aDTO.setSearch(search);
		log.info("search : " + search);
		
		List <AcademyDTO> MoreList = academyService.AcademyMoreList(aDTO);
		
		return MoreList;
	}
	@RequestMapping(value="search")
	public @ResponseBody List<AcademyDTO> searchAcademyList(@RequestParam(value="search") String search) throws Exception {
		log.info("search : " + search);
		
		AcademyDTO aDTO = new AcademyDTO();
		aDTO.setSearch(search);
		
		List<AcademyDTO> adTO = academyService.searchAcademyList(aDTO);
		
		for(AcademyDTO a : adTO){
			log.info(a.getAca_name());
		}
		
		return adTO;
	}
	
	
	
	@RequestMapping(value="mapAcaList")
	public @ResponseBody List<AcademyDTO> mapAcaList() throws Exception{
		log.info(this.getClass() + " mapAcaList Start!!");
		
		List<AcademyDTO> aList = new ArrayList<AcademyDTO>(); 
		
		aList = academyService.getMapAcaList();
		
		log.info(this.getClass() + " mapAcaList End!!");
		return aList;
	}
}
