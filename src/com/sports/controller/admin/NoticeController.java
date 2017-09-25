package com.sports.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sports.dto.NoticeDTO;
import com.sports.dto.ProductInfoDTO;
import com.sports.service.INoticeService;
import com.sports.util.AES256Util;
import com.sports.util.CmmUtil;

@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	
	@RequestMapping(value="/notice/NoticeList",method=RequestMethod.GET)
	public String noticeList(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome _join");
		
		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();
		
		nList = noticeService.getNoticeList();
		
		
		if(nList == null){
			nList = new ArrayList<NoticeDTO>();
		}
		
		for(NoticeDTO nDTO : nList){
		
		String reg_dt = CmmUtil.nvl(nDTO.getReg_dt());//new 붙히는 시간 계산해서 nList의 title에 new 붙여주기
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = transFormat.parse(reg_dt);

		long now = System.currentTimeMillis();
		long inputDate = to.getTime();

		if (now - inputDate < (1000*60*60*24*3)) {
			nDTO.setNew_yn("Y");
			}else{
			nDTO.setNew_yn("");	
			}
		
		String title = CmmUtil.nvl(nDTO.getTitle());//제목이 14자 이상이면 ...붙여주기
		if (title.length() >= 14) {
			title = title.substring(0, 14) + "...";
			}
		}
				
		model.addAttribute("nList",nList);
		
		nList = null;
		
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		return "/notice/NoticeList";
	}
	
	@RequestMapping(value="/notice/readMore.do")
	public @ResponseBody List<NoticeDTO> Notice_MoreView(@RequestParam(value = "cnt") String cnt,@RequestParam(value = "search") String search) throws Exception{
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setRead_more(cnt);
		System.out.println("넘어온 cnt : " +cnt);
		
		nDTO.setSearch(search);
		System.out.println("넘어온 search : " +search);
		
		
		List <NoticeDTO> viewMore_list = noticeService.Notice_MoreView(nDTO);
		
		for(NoticeDTO nDT : viewMore_list){//new 붙히는 시간 계산해서 nList의 title에 new 붙여주기
			String reg_dt = CmmUtil.nvl(nDT.getReg_dt());
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = transFormat.parse(reg_dt);

			long now = System.currentTimeMillis();
			long inputDate = to.getTime();

			if (now - inputDate < (1000*60*60*24*3)) {
				nDT.setNew_yn("Y");
					}
			
			String title = CmmUtil.nvl(nDT.getTitle());//제목이 14자 이상이면 ...붙여주기
			if (title.length() >= 14) {
				title = title.substring(0, 14) + "...";
			}
			
		}
		
		System.out.println("겟 리드모어 : " + nDTO.getRead_more());
		
		for(NoticeDTO ndt : viewMore_list ){
			System.out.println( "제목 :"+  ndt.getTitle());
			System.out.println("유저 이름은 :"+ndt.getUser_name());
		}
		
		nDTO= null;
		return viewMore_list;
	}
	
	
	@RequestMapping(value="/notice/search")
	public @ResponseBody List<NoticeDTO> searchNoticeList(@RequestParam(value="search") String search) throws Exception{
		
		System.out.println("search : " + search);
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setSearch(search);
		
		List<NoticeDTO> ndTO = noticeService.searchNoticeList(nDTO);
		
		for(NoticeDTO nDT : ndTO){//new 붙히는 시간 계산해서 nList의 title에 new 붙여주기
			String reg_dt = CmmUtil.nvl(nDT.getReg_dt());
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = transFormat.parse(reg_dt);

			long now = System.currentTimeMillis();
			long inputDate = to.getTime();

			if (now - inputDate < (1000*60*60*24*3)) {
				nDT.setNew_yn("Y");
					}
			
			String title = CmmUtil.nvl(nDT.getTitle());//제목이 14자 이상이면 ...붙여주기
			if (title.length() >= 14) {
				title = title.substring(0, 14) + "...";
				}
			}
		
		for(NoticeDTO n : ndTO){
			System.out.println(n.getTitle());
		}
		
				
		
		return ndTO;
		
	}
	
	@RequestMapping(value="/notice/NoticeInfo",method={RequestMethod.GET, RequestMethod.POST})
	public String noticeInfo(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /NoticeInfo");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_no(notice_no);
		
		NoticeDTO rDTO = noticeService.getNoticeDetailInfo(nDTO);
		
		model.addAttribute("rDTO",rDTO);
		
		nDTO = null;
		
		log.info(this.getClass().getName() + ".NoticeInfo end!");
		
		return "/notice/NoticeInfo";
	}
	
	@RequestMapping(value="/notice/NoticeReg",method=RequestMethod.GET)
	public String noticeReg(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		
		log.info(this.getClass().getName() + ".NoticeReg start!");
		
		
		
		log.info(this.getClass().getName() + ".NoticeReg end!");
		
		return "/notice/NoticeReg";
		
	}
	
	@RequestMapping(value="/notice/NoticeInsert",method=RequestMethod.POST)
	public String noticeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /NoticeInsert");
		
		String user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		String title = CmmUtil.nvl(request.getParameter("title"));
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		String notice_yn = CmmUtil.nvl(request.getParameter("notice_yn"));
		
		contents = contents.replace("\r\n","<br>");
		
		
		log.info("user_no : "+ user_no);
		log.info("title : "+ title);
		log.info("noticeYn : "+ notice_yn);
		log.info("contents : "+ contents);
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setContents(contents);
		noticeDTO.setTitle(title);
		noticeDTO.setUser_no(user_no);
		noticeDTO.setNotice_yn(notice_yn);
		
		noticeService.InsertNoticeInfo(noticeDTO);
		
		noticeDTO = null;
		
		model.addAttribute("msg","게시글 등록에 성공하였습니다.");
		model.addAttribute("url","/notice/NoticeList.do");
		
		return "alert/alert";
	}
	
	
	
	@RequestMapping(value="/notice/NoticeEditInfo",method=RequestMethod.GET)
	public String noticeEditInfo(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /NoticeEditInfo");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_no(notice_no);
		
		NoticeDTO rDTO = noticeService.getNoticeDetailInfo(nDTO);
		
		nDTO = null;
		log.info("notice_no :"+rDTO.getNotice_no());
		
		model.addAttribute("rDTO",rDTO);

		return "/notice/NoticeEditInfo";
	}
	
	@RequestMapping(value="/notice/NoticeUpdate",method=RequestMethod.POST)
	public String noticeUpdate(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /NoticeUpdate");
		
		String notice_no = CmmUtil.nvl(request.getParameter("notice_no"));
		String title = CmmUtil.nvl(request.getParameter("title"));
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		
		String notice_yn = CmmUtil.nvl(request.getParameter("notice_yn"));
		
		contents = contents.replace("\r\n","<br>");
		
		log.info("notice_no : "+ notice_no);
		log.info("title : "+ title);
		log.info("noticeYn : "+ notice_yn);
		log.info("contents : "+ contents);
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setContents(contents);
		noticeDTO.setTitle(title);
		noticeDTO.setNotice_no(notice_no);
		noticeDTO.setNotice_yn(notice_yn);
		
		noticeService.updateNoticeInfo(noticeDTO);
		
		model.addAttribute("msg","게시글 수정에 성공하였습니다.");
		model.addAttribute("url","/notice/NoticeInfo.do?notice_no="+notice_no);
		
		
		return "alert/alert";
	}
	
	@RequestMapping(value="/notice/NoticeDelete",method=RequestMethod.GET)
	public String noticeDelete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /NoticeDelete");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_no(notice_no);
		
		noticeService.deleteNoticeInfo(nDTO);
		
		model.addAttribute("msg","게시글 삭제에 성공하였습니다.");
		model.addAttribute("url","/notice/NoticeList.do");
		
		return "alert/alert";
	}
	
	
	@RequestMapping(value="/notice/NoticeCheckboxDelete",method=RequestMethod.POST)
	public String NoticeCheckboxDelete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		log.info("welcome /NoticeCheckboxDelete");

		String[] deleteSelect = request.getParameterValues("checkbox");
		
		NoticeDTO nDTO = new NoticeDTO();
		
		
			nDTO.setAllCheckSeq(deleteSelect);
		
			noticeService.deleteCheckList(nDTO);
		
		model.addAttribute("msg","선택된 게시글 삭제에 성공하였습니다.");
		model.addAttribute("url","/notice/NoticeList.do");
		
		return "alert/alert";
		
	}
	
	
}