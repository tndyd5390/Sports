package com.sports.controller.user;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;
import com.sports.dto.BasketDTO;
import com.sports.dto.OrdProdOptionDTO;
import com.sports.dto.OrdProductDTO;
import com.sports.dto.Order_infoDTO;
import com.sports.service.IOrderService;
import com.sports.util.CmmUtil;

@Controller
public class CustomerOrderController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="OrderService")
	private IOrderService orderService;
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @throws Exception
	 * 결제에 성공 한 후 데이터를 받는 메소드
	 */
	@RequestMapping(value="orderSuccess")
	public void orderSuccess(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".orderSuccess start!!!");
		req.setCharacterEncoding("euc-kr");
		//결과코드
	    String rep_code =CmmUtil.nvl(req.getParameter("REP_CODE"));
	    log.info(this.getClass() + " rep_code : " + rep_code);
	    //승인 번호, 계좌 번호
	    String rep_auth_no =CmmUtil.nvl(req.getParameter("REP_AUTH_NO"));
	    log.info(this.getClass() + " rep_auth_no : " + rep_auth_no);
	    //거래 고유번호(페이누리측)
	    String tid =CmmUtil.nvl(req.getParameter("TID"));
	    log.info(this.getClass() + " tid : " + tid);
	    //은행 코드
	    String rep_bank =CmmUtil.nvl(req.getParameter("REP_BANK"));
	    log.info(this.getClass() + " rep_bank : " + rep_bank);
	    //가맹점 번호
	    String storeId   =CmmUtil.nvl(req.getParameter("STOREID"));
	    log.info(this.getClass() + " storeId : " + storeId);
	    //가맹점 이름
	    String store_name =CmmUtil.nvl(req.getParameter("STORE_NAME"));
	    log.info(this.getClass() + " store_name : " + store_name);
	    //가맹점 URL
	    String store_url =CmmUtil.nvl(req.getParameter("STORE_URL"));
	    log.info(this.getClass() + " store_url : " + store_url);
	    //사업자 번호
	    String business_no =CmmUtil.nvl(req.getParameter("BUSINESS_NO"));
	    log.info(this.getClass() + " business_no : " + business_no);
	    //가맹점 주문번호
	    String tran_no =CmmUtil.nvl(req.getParameter("TRAN_NO"));
	    log.info(this.getClass() + " tran_no : " + tran_no);
	    //카드종류
	    String cardCompany = CmmUtil.nvl(req.getParameter("CARDCOMPANY"));
	    log.info(this.getClass() + " cardCompany : " + cardCompany);
	    //상품명
	    String goods_name =CmmUtil.nvl(req.getParameter("GOODS_NAME"));
	    log.info(this.getClass() + " goods_name : " + goods_name);
	    //결제금액
	    String amt =CmmUtil.nvl(req.getParameter("AMT"));
	    log.info(this.getClass() + " amt : " + amt);
	    //상품수
	    String quantity   =CmmUtil.nvl(req.getParameter("QUANTITY"));
	    log.info(this.getClass() + " quantity : " + quantity);
	    //결제일자
	    String sale_date =CmmUtil.nvl(req.getParameter("SALE_DATE"));
	    log.info(this.getClass() + " sale_date : " + sale_date);
	    //고객이름
	    String customer_name =CmmUtil.nvl(req.getParameter("CUSTOMER_NAME"));
	    log.info(this.getClass() + " customer_name : " + customer_name);
	    //고객 이메일
	    String customer_email =CmmUtil.nvl(req.getParameter("CUSTOMER_EMAIL"));
	    log.info(this.getClass() + " customer_email : " + customer_email);
	    //고객 전화번호
	    String customer_tel   =CmmUtil.nvl(req.getParameter("CUSTOMER_TEL"));
	    log.info(this.getClass() + " customer_tel : " + customer_tel);
	    //고객 아이피
	    String customer_ip =CmmUtil.nvl(req.getParameter("CUSTOMER_IP"));
	    log.info(this.getClass() + " customer_ip : " + customer_ip);
	    //입금통보URL
	    String notice_url =CmmUtil.nvl(req.getParameter("NOTICE_URL"));
	    log.info(this.getClass() + " notice_url : " + notice_url);
	    //거래 유형
	    String tran_type =CmmUtil.nvl(req.getParameter("TRAN_TYPE"));
	    log.info(this.getClass() + " tran_type : " + tran_type);
	    //결과 메세지
	    String rep_msg =CmmUtil.nvl(req.getParameter("REP_MSG"));
	    log.info(this.getClass() + " rep_msg : " + rep_msg);
	    //여분의 데이터
	    String etc_data1 = CmmUtil.nvl(req.getParameter("ETC_DATA1"));
	    log.info(this.getClass() + " ETC_DATA1 : " + etc_data1);
	    String etc_data2 = CmmUtil.nvl(req.getParameter("ETC_DATA2"));
	    log.info(this.getClass() + " ETC_DATA2 : " + etc_data2);
	    String etc_data3 = CmmUtil.nvl(req.getParameter("ETC_DATA3"));
	    log.info(this.getClass() + " ETC_DATA3 : " + etc_data3);
	    
	    if(rep_code.equals("0000")){
	    	/**
	    	 * 결제 성공
	    	 */
	    	JSONParser jsonParser = new JSONParser();
	    	JSONObject jsonObject = (JSONObject)jsonParser.parse(etc_data1);
	    	String recipient = CmmUtil.nvl((String)jsonObject.get("recipient"));
	    	String tel = CmmUtil.nvl((String)jsonObject.get("tel"));
	    	String message = CmmUtil.nvl((String)jsonObject.get("message"));
	    	String postCode = CmmUtil.nvl((String)jsonObject.get("postCode"));
	    	String address = CmmUtil.nvl((String)jsonObject.get("address"));
	    	String addressDetail = CmmUtil.nvl((String)jsonObject.get("addressDetail"));
	    	String userNo = CmmUtil.nvl((String)jsonObject.get("regUserNo"));
	    	Order_infoDTO oDTO = new Order_infoDTO();
	    	oDTO.setRecipient(recipient);
	    	oDTO.setTel(tel);
	    	oDTO.setOrd_message(message);
	    	oDTO.setPostCode(postCode);
	    	oDTO.setAddress(address);
	    	oDTO.setAddressDetail(addressDetail);
	    	oDTO.setTran_no(tran_no);
	    	oDTO.setOrd_price(amt);
	    	oDTO.setOrd_stat("C");
	    	oDTO.setOrd_cancel("N");
	    	oDTO.setReg_user_no(userNo);
	    	oDTO.setTranType(tran_type);
	    	oDTO.setTid(tid);
	    	jsonObject = (JSONObject)jsonParser.parse(etc_data2);
	    	JSONArray jsonArray = (JSONArray)jsonObject.get("bsk_no");
	    	List<String> bskNoList = new ArrayList<>();
	    	if(jsonArray.size() != 0){
		    	for(int i = 0; i< jsonArray.size(); i++){
		    		JSONObject bskNoObject = (JSONObject)jsonArray.get(i);
		    		bskNoList.add(CmmUtil.nvl((String)bskNoObject.get("bsk_no")));
		    	}
	    	}
	    	orderService.insertOrderFromBasket(bskNoList, oDTO, userNo, tran_no);
	    	
	    }else{
	    	/**
	    	 * 결제 실패
	    	 */
	    }
		log.info(this.getClass() + ".orderSuccess end!!!");
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 결제에 성공한 후 사용자에게 화면을 뿌려줄 메소드
	 */
	@RequestMapping(value="orderSuccessView")
	public String orderSuccessView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".orderSuccessView start!!!");
		String userNo = CmmUtil.nvl(req.getParameter("userNo").split("[?]")[0]);
		log.info(this.getClass() + ".orderSuccessView userNo : " + userNo);
		
		List<Order_infoDTO> oList = orderService.getOrderInfoDate(userNo);
		if(oList == null) oList = new ArrayList<>();
		
		
		model.addAttribute("oList", oList);
		log.info(this.getClass() + ".orderSuccessView end!!!");
		return "customer/orderList";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 사용자가 결제도중 취소를 눌렀을 경우 화면을 뿌려줄 메소드
	 */
	@RequestMapping(value="orderCancel")
	public String orderCancel(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".orderCancel start!!!");
		
		log.info(this.getClass() + ".orderCancel end!!!");
		return null;
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 가상계좌 발급후 가상계좌에 입금이 되었을때 데이터를 받는 메소드
	 */
	@RequestMapping(value="noticeOfPayment")
	public String noticeOfPayment(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".noticeOfPayment start!!!");
		
		log.info(this.getClass() + ".noticeOfPayment end!!!");
		return null;
	}
	
	@RequestMapping(value="orderListDoToggle", method=RequestMethod.POST)
	public @ResponseBody List<Order_infoDTO> orderListDoToggle(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + ".orderListDoToggle start!!!");
		String regDt = CmmUtil.nvl(req.getParameter("reg_dt"));
		log.info(this.getClass() + ".orderListDoToggle regDt : " + regDt);
		String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		log.info(this.getClass() + ".orderListDoToggle userNo : " + userNo);
		Order_infoDTO oDTO = new Order_infoDTO();
		oDTO.setReg_dt(regDt);
		oDTO.setReg_user_no(userNo);
		List<Order_infoDTO> oList = orderService.getOrderInfoDateDatailList(oDTO);
		if(oList == null) oList = new ArrayList<>();
		log.info(this.getClass() + ".orderListDoToggle end");
		return oList;
	}
	
	@RequestMapping(value="orderDetail")
	public String orderDetail(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + ".orderDetail start!!!");
		String tranNo = CmmUtil.nvl(req.getParameter("tranNo"));
		log.info(this.getClass() + ".orderDetail tranNo : " + tranNo);
		
		Order_infoDTO oDTO = orderService.getOrderInfoDetail(tranNo);
		if(oDTO == null) oDTO = new Order_infoDTO();
		
		model.addAttribute("oDTO", oDTO);
		log.info(this.getClass() + ".orderDetail end!!!");
		
		return "customer/orderDetail";
	}
}
