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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sports.dto.BasketDTO;
import com.sports.dto.Basket_OptionDTO;
import com.sports.dto.UserDTO;
import com.sports.service.IBasketService;
import com.sports.service.impl.BasketService;
import com.sports.util.CmmUtil;

@Controller
public class CustomerBasketController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BasketService")
	private IBasketService basketService;

	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @throws Exception
	 * ###################################################################################################
	 * # 
	 * # 장바구니 추가 로직을 만들거다 제품 번호와 갯수, 가격, 옵션 번호는 파라미터로 받고 회원 번호는  session에서 가져와서 장바구니에 넣어보자
	 * #
	 * ###################################################################################################
	 */
	@RequestMapping(value="customerAddBasket", method=RequestMethod.POST)
	public void customerAddBasket(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam(value="opt_no[]") List<String> optNos,
			@RequestParam(value="opt_name[]") List<String> optNames, @RequestParam(value="opt_kind[]") List<String> optKinds) throws Exception{
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
		result = basketService.insertCustomerAddBasket(bDTO, optNos, optNames, optKinds, userNo);
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
		optNos = null;
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
	 * ###################################################################################################
	 * # 
	 * # 옵션이 없는 제품을 장바구니에 담을때 사용할 컨트롤러
	 * #
	 * ###################################################################################################
	 */
	@RequestMapping(value="customerAddBasketNoOption", method=RequestMethod.POST)
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
		//null 처리
		prodNo = null;
		prodQty = null;
		bskPrice = null;
		userNo = null;
		bDTO =null;
		log.info(this.getClass() + ".customerAddBasketNoOption end!!!");
	}
	
	/**
	 * 
	 * @param req
	 * @param resp
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 * ###################################################################################################
	 * # 
	 * # 장바구니 목록을 가져올 메소드
	 * #
	 * ###################################################################################################
	 */
	@RequestMapping(value="customerBasketList", method=RequestMethod.GET)
	public String customerBasket(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + ".customerBasket start!!!");
		
		//장바구니 목록에는 사용자의 회원 번호만 필요하다
		String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		log.info(this.getClass() + ".customerBasket userNo : " + userNo);
		
		//장바구니 목록을 가져온다.
		List<BasketDTO> bList = basketService.getCustomerBasketList(userNo);
		if(bList == null){
			bList = new ArrayList<BasketDTO>();
		}
		
		//모델에 올린다.
		model.addAttribute("bList", bList);
		
		//null처리 한다.
		userNo = null;
		bList =  null;
		
		log.info(this.getClass() + ".customerbasekt end!!!");
		return "basket/userBasket";
	}
	
	/**
	 * 
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * ###################################################################################################
	 * # 
	 * # 장바구니 리스트 화면에서 하나를 삭제버튼을 눌렀을때 사용할 메소드
	 * #
	 * ###################################################################################################
	 */
	@RequestMapping(value="customerBasketDeleteOne", method=RequestMethod.POST)
	public @ResponseBody List<BasketDTO> customerBasketDeleteOne(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerBasketDeleteOne start!!!");
		
		//장바구니에서 삭제는 status컬럼을 N으로 업데이트 해야하기 때문에 bskNo를 하나 받는다.
		String bskNo = CmmUtil.nvl(req.getParameter("bskNo"));
		log.info(this.getClass() + ".customerBasketDeleteOne bskNo : " + bskNo);
		
		//사용자장바구니 리스트를 다시 불러와야 하기때문에 사용자의 번호도 하나 가져온다.
		String userNo  = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		log.info(this.getClass() + ".customerBasketDeleteOne userNo : " + userNo);
		
		List<BasketDTO> bList = basketService.updateCustomerBasketOne(bskNo, userNo);
		if(bList == null){
			bList = new ArrayList<>();
		}
		bskNo = null;
		userNo = null;
		log.info(this.getClass() + ".customerBasketDeleteOne end!!!");
		return bList;
	}
	
	/**
	 * 
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * ###################################################################################################
	 * # 
	 * # 장바구니 리스트에서 주문 화면으로 이동할 메소드 사용자 번호를 가져오고 장바구니의 최종 결제 번호를 가져오고
	 * # 사용자 번호로 DB에 장바구니를 불러와서 최종 결제 금액을 비교후 일치하면 결제 진행 일치 하지 않으면 결제 불가
	 * #
	 * ###################################################################################################
	 */
	@RequestMapping(value="customerOrderView", method=RequestMethod.POST)
	public String customerOrderView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerOrderView start!!!");
		
		//장바구니 목록의 금액을 다 더할 변수
		int totalProdPrice = 0;
		String returnURL = "";
		//파라미터 가져오기
		String userNo = CmmUtil.nvl(req.getParameter("userNo"));
		log.info(this.getClass() + ".custoemrOrderView userNo : " + userNo);
		int totalProdPriceFromView = Integer.parseInt(CmmUtil.nvl(req.getParameter("totalProdPrice")));
		log.info(this.getClass() + ".customerOrderView totalProdPriceFromView : " + totalProdPriceFromView);
		
		//userInfo
		//장바구니 목록을 가져온다
		List<BasketDTO> bList = basketService.getCustomerBasketList(userNo);
		if(bList == null){
			bList = new ArrayList<BasketDTO>();
		}
		
		//장바구니 목록의 금액을 다 더한다.
		for(BasketDTO bDTO : bList){
			totalProdPrice += Integer.parseInt(CmmUtil.nvl(bDTO.getBsk_price()));
		}
		log.info(this.getClass() + ".customerOrderView totalProdPrice : " + totalProdPrice);
		
		if((totalProdPrice + 3000) != totalProdPriceFromView){//만약 최종 결제금액이 같지 않다면(3000원은 배송비)결제를 진행 하면 안된다.
			model.addAttribute("msg", "시스템에 에러가 발생했습니다. 다시 시도해 주세요.");
			model.addAttribute("url", "customerBasketList.do");
			returnURL = "alert/alert";
		}else{//최종 결제 금액이 같다면 그대로 결제 진행!!~~
			UserDTO uDTO = basketService.getUserInfoForOrderView(userNo);
			if(uDTO == null) uDTO = new UserDTO();
			model.addAttribute("bList", bList);
			model.addAttribute("uDTO", uDTO);
			model.addAttribute("totalProdPriceFromView", totalProdPriceFromView);
			returnURL = "customer/orderView";
		}
		
		//null 처리ㅣ
		userNo = null;
		bList = null;
		
		log.info(this.getClass() + ".customerOrderView end!!!");
		return returnURL;
	}
	
	@RequestMapping(value = "noBasketItem")
	public String noBasketItem(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + ".noBasketItem start!!!");
		
		model.addAttribute("msg", "장바구니에 담긴 상품이 없습니다.");
		model.addAttribute("url", "main.do");
		
		log.info(this.getClass() + ".noBasketItem end");
		return "redirect";
	}
}
