package com.sports.controller.user;

import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sports.dto.BasketDTO;
import com.sports.dto.Basket_OptionDTO;
import com.sports.service.IBasketService;
import com.sports.service.impl.BasketService;
import com.sports.util.CmmUtil;

@Controller
public class CustomerBasketController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BasketService")
	private IBasketService basketService;
	
	@RequestMapping(value="customer/userBasket", method=RequestMethod.GET)
	public String customerBasketList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerBasketList start!!!");
		log.info(this.getClass() + ".customerBassketList end!!!");
		return "basket/userBasket";
	}
	
	/**
	 * 
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @throws Exception
	 * 장바구니 추가 로직을 만들거다 제품 번호와 갯수, 가격, 옵션 번호는 파라미터로 받고 회원 번호는  session에서 가져와서 장바구니에 넣어보자
	 */
	@RequestMapping(value="customer/addBasket", method=RequestMethod.POST)
	public void customerAddBasket(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam(value="opt_no[]") List<String> optNo) throws Exception{
		log.info(this.getClass() + ".customerAddBasket start!!!");
		//장바구니 insert에 필요한 여러가지 정보들을 파라미터와 세션에서 가져온다.
		String prodNo = CmmUtil.nvl(req.getParameter("prod_no"));
		log.info(this.getClass() + ".customerAddBasket prodNo : " + prodNo);
		String prodQty = CmmUtil.nvl(req.getParameter("prod_qty"));
		log.info(this.getClass() + ".customerAddBasket prodQty : " + prodQty);
		String bskPrice = CmmUtil.nvl(req.getParameter("bsk_price"));
		log.info(this.getClass() + ".customerAddBasket prod_price : " + bskPrice);
		String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		log.info(this.getClass() + ".customerAddBasket userNO : " + userNo);
		
		
		//가져온 정보들로 DTO를 생성한다.
		BasketDTO bDTO = new BasketDTO();
		bDTO.setUser_no(userNo);
		bDTO.setProd_no(prodNo);
		bDTO.setReg_user_no(userNo);
		bDTO.setBsk_price(bskPrice);
		bDTO.setProd_qty(prodQty);
		
		//insert를 하고 결과에 따라 return해줄 문자열을 세팅한다.
		int result = 0;
		String resultChar;
		result = basketService.insertCustomerAddBasket(bDTO, optNo, userNo);
		if(result != 0){
			resultChar = "1";
		}else{
			resultChar = "0";
		}

		//문자열을 아작스로 보내준다.
		resp.getWriter().println(resultChar);
		//null처리
		prodNo = null;
		prodQty = null;
		optNo = null;
		bskPrice = null;
		userNo = null;
		bDTO = null;
		resultChar = null;
		log.info(this.getClass() + ".customerAddBasekt end!!!");
	}
	/**
	 * 
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 옵션이 없는 제품을 장바구니에 담을때 사용할 컨트롤러
	 */
	@RequestMapping(value="customer/addBasketNoOption", method=RequestMethod.POST)
	public void addBasketNoOption(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerAddBasketNoOption start!!!");
		//전달 받은 파라이터 로그찍기
		String prodNo = CmmUtil.nvl(req.getParameter("prod_no"));
		log.info(this.getClass() + ".customerAddBasketNoOption prodNo : " + prodNo);
		String prodQty = CmmUtil.nvl(req.getParameter("prod_qty"));
		log.info(this.getClass() + ".customerAddBaksetNoOption prodQty : " + prodQty);
		String bskPrice = CmmUtil.nvl(req.getParameter("bsk_price"));
		log.info(this.getClass() + ".customerAddBasketNoOption bskPrice : " + bskPrice);
		String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		log.info(this.getClass() + ".customerAddBasketNoOption userNo : " + userNo);
		
		//데이터베이스에 입력할 DTO 만들기
		BasketDTO bDTO = new BasketDTO();
		bDTO.setProd_no(prodNo);
		bDTO.setProd_qty(prodQty);
		bDTO.setBsk_price(bskPrice);
		bDTO.setUser_no(userNo);
		
		//DB에 인서트 시키기
		int result = 0;
		result = basketService.insertCustomerAddBasketNoOption(bDTO);
		
		//
		if(result != 0){
			resp.getWriter().println("1");
		}else{
			resp.getWriter().println("0");
		}
		
		log.info(this.getClass() + ".customerAddBasketNoOption end!!!");
	}
	
	@RequestMapping(value="customer/customerBasket", method=RequestMethod.GET)
	public String customerBasket(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + ".customerBasket start!!!");
		
		log.info(this.getClass() + ".customerbasekt end!!!");
		return null;
	}
}
