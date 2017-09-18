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

import com.sports.service.IOrderService;

@Controller
public class CustomerOrderController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="OrderService")
	private IOrderService orderService;
	
	@RequestMapping(value="customer/orderView", method=RequestMethod.GET)
	public String customerOrderView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerOrderView start!!!");
		
		log.info(this.getClass() + ".customerOrderView end!!!");
		return "customer/orderView";
	}
	
	@RequestMapping(value="customer/orderList", method=RequestMethod.GET)
	public String customerOrderInfo(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerOrderInfo start!!!");
		
		log.info(this.getClass() + ".customerOrderInfo end!!!");
		return "customer/orderList";
	}
	
	@RequestMapping(value="customer/orderDetail", method=RequestMethod.GET)
	public String customerOrderDetail(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cutomerOrderDetail start!!!");
		
		log.info(this.getClass() + ".customerOrderDetail end!!!");
		return "customer/orderDetail";
	}
	
	@RequestMapping(value="customer/orderRefundDetail", method=RequestMethod.GET)
	public String customerOrderRefundDetail(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerOrderRefundDetail start!!!");
		
		log.info(this.getClass() + ".customerOrderRefundDetail end!!!");
		return "customer/orderRefundDetail";
	}
	
	@RequestMapping(value="customer/orderRefundList", method=RequestMethod.GET)
	public String customerOrderRefundList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".customerOrderRefundList start!!!");
		
		log.info(this.getClass() + ".customerOrderRefundList end!!!");
		return "customer/orderRefundList";
	}
}
