package com.sports.controller.user;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sports.dto.BasketDTO;
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
	
	@RequestMapping(value="customer/addBasket", method=RequestMethod.POST)
	public void customerAddBasket(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerAddBasket start!!!");
		
		String prodNo = CmmUtil.nvl(req.getParameter("prod_no"));
		log.info(this.getClass() + ".customerAddBasket prod_no : " + prodNo);
		String prodQty = CmmUtil.nvl(req.getParameter("prod_qty"));
		log.info(this.getClass() + ".customerAddBasket prod_qty : " + prodQty);
		String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		log.info(this.getClass() + ".customerAddBasket user_no : " + userNo);

		PrintWriter out = resp.getWriter();
		if("".equals(userNo)){//만약 로그인을 하지 않았다면 3보내고 함수 종료
			out.println("3");
			out.flush();
			out.close();
			return;
		}
		/**
		 * 로그인을 한 상태라면 디비에 값 넣고 
		 */
		BasketDTO bDTO = new BasketDTO();
		bDTO.setUser_no(userNo);
		bDTO.setProd_no(prodNo);
		bDTO.setProd_qty(prodQty);
		bDTO.setReg_user_no(userNo);
		
		int result = 0;
		result = basketService.insertCustomerAddBasket(bDTO);
		
		if(result != 0){//값이 제대로 들어갓다면
			out.println("1");
		}else{//값이 제대로 들어가지 않았다면
			out.println("2");
		}
		out.flush();
		out.close();//stream 닫고!!!!!!!이거 꼭!!!
		
		/**
		 * null 처리 
		 */
		prodNo = null;
		prodQty = null;
		userNo = null;
		out = null;
		bDTO = null;
		log.info(this.getClass() + ".customerAddBasekt end!!!");
	}
}
