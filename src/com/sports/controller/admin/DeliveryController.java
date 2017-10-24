package com.sports.controller.admin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sports.dto.Order_infoDTO;
import com.sports.service.IOrderService;


@Controller
public class DeliveryController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="OrderService")
	private IOrderService orderService;
	
	
	@RequestMapping(value="delivery")
	public  String delivery(ModelMap model,HttpServletRequest request) throws Exception{
		String tran_no = request.getParameter("tran_no");
		String url = "http://info.sweettracker.co.kr/api/v1/trackingInfo?";
		String key = "TGm4UKPZiaIyZsVe8nFsOQ";
		String t_code = request.getParameter("deli_co_no");
		String t_invoice = request.getParameter("invoice_no");
		String final_url = url + "t_key="+key+"&t_code="+t_code+"&t_invoice="+t_invoice;
		//05,8601360191
		System.out.println("final_url : "+final_url);

		
        URL obj = new URL(final_url);
        HttpURLConnection httpConn  = (HttpURLConnection) obj.openConnection();

        // 전송방식 GET 지정
        httpConn.setRequestMethod("GET");

        // 요청헤더 추가
        httpConn.setRequestProperty("User-Agent", "Mozilla/5.0");
        httpConn.setRequestProperty("Accept", "application/json");
      
        int responseCode = httpConn.getResponseCode();
        // 응답코드 확인(정상호출시 200)
        System.out.println("Response Code : " + responseCode);
        
        
        
        BufferedReader in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(),"UTF-8"));
        String inputLine;
        StringBuffer response = new StringBuffer();
        
        
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        
        //결과 확인
        System.out.println(response.toString());
        
        System.out.println("오류?");
        String result = response.toString();
        
        System.out.println("result : "+result);
        
        model.addAttribute("tran_no",tran_no);
        model.addAttribute("result",result);
        model.addAttribute("code",t_code);
        
        return "/delivery/deliverytracking";
	}
	
	@RequestMapping(value="/deliveryReg")
	public String deliveryReg(HttpServletRequest request, ModelMap model){
		
		String tran_no = request.getParameter("tran_no");
		
		model.addAttribute("tran_no",tran_no);
		
		
		return "/delivery/deliveryReg";
	}

	@RequestMapping(value="/deliveryReg_proc")
	public String deliveryReg_proc(HttpServletRequest request, ModelMap model)throws Exception{
		
		String tran_no = request.getParameter("tran_no");
		String invoice_no = request.getParameter("invoice_no");
		String deli_co_no = request.getParameter("deli_co_no");
		System.out.println("tran_no : "+tran_no);
		
		Order_infoDTO oDTO = new Order_infoDTO();
		
		oDTO.setTran_no(tran_no);
		oDTO.setInvoice_no(invoice_no);
		oDTO.setDeli_co_no(deli_co_no);
		orderService.setDelivery(oDTO);//sql문 적어야대
		
		model.addAttribute("msg", "운송장 번호 등록이 완료 되었습니다.");
		model.addAttribute("url", "/orderDetail.do?tranNo="+tran_no);
		
		return "/alert/alert";
	}
}