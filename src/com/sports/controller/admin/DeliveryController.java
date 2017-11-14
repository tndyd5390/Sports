package com.sports.controller.admin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

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
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

import com.sports.dto.DeliveryDTO;
import com.sports.dto.Order_infoDTO;
import com.sports.service.IOrderService;
import com.sports.util.CmmUtil;


@Controller
public class DeliveryController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="OrderService")
	private IOrderService orderService;
	
	
	@RequestMapping(value="delivery")
	public  String delivery(ModelMap model,HttpServletRequest request) throws Exception{
		
		
		String tran_no = request.getParameter("tran_no");
		String url = "http://info.sweettracker.co.kr/api/v1/trackingInfo?";
		String key = "Zor62AVA4uuZxCrPfUlANA";
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
        
        DeliveryDTO dDTO = new DeliveryDTO();
        List<DeliveryDTO> dList = new ArrayList<DeliveryDTO>();
        try{
        
        //deliveryDTO에 값 넣어주기
        
    	String code = t_code;//컨트롤러에서 받은 택배사 코드
    	String company = "";//택배사 이름 초기화
    	
    	if (code.equals("01")) {
    		company = "우체국택배";
    	} else if (code.equals("02")) {
    		company = "이노지스";
    	} else if (code.equals("04")) {
    		company = "CJ대한통운";
    	} else if (code.equals("05")) {
    		company = "한진택배";
    	} else if (code.equals("08")) {
    		company = "현대택배";
    	} else if (code.equals("37")) {
    		company = "범한판토스";
    	} else if (code.equals("31")) {
    		company = "스카이로지스";
    	} else if (code.equals("06")) {
    		company = "로젠택배";
    	}
    	
    	JSONParser parser = new JSONParser();//Json파서 생성
    	Object objt = parser.parse(result);//String 데이터를 Object로 파서
    	System.out.println("obj : " + objt);
    	JSONObject jsonObj = (JSONObject) objt; // Object데이터를 Json 데이터로 파서
    	System.out.println("jsonObj : " + jsonObj);
    	String invoiceNo = CmmUtil.nvl((String) jsonObj.get("invoiceNo"));//송장번호
    	String itemName = CmmUtil.nvl((String) jsonObj.get("itemName"));//상품명
    	String completeYN = CmmUtil.nvl((String) jsonObj.get("completeYN"));//배송완료여부
    	String receiverName = CmmUtil.nvl((String) jsonObj.get("receiverName"));//받는 사람
    	String receiverAddr = CmmUtil.nvl((String) jsonObj.get("receiverAddr"));//주소
    	JSONArray trackingDetails = (JSONArray) jsonObj.get("trackingDetails");//배열 형태의 json데이터를 JsonArray 로 생성
    	
    	JSONObject lastDeatail = (JSONObject)jsonObj.get("lastDetail");//Object 형태의 
    	
    	String kind = CmmUtil.nvl((String)lastDeatail.get("kind"));
    	
    	System.out.println("kind : "+kind);
    	System.out.println("trackingDetails : " + trackingDetails);
        
        String timeString = "";
        String where = "";
        String detailkind = "";
        
        
        
        
		for (int i = 0; i < trackingDetails.size(); i++) {
			DeliveryDTO dd = new DeliveryDTO(); 
			JSONObject order = (JSONObject) trackingDetails.get(i);
			timeString = (String)order.get("timeString").toString().substring(0, 10);
			where = (String)order.get("where");
			detailkind = (String)order.get("kind");
			dd.setTimeString(timeString);
			dd.setWhere(where);
			dd.setDetailkind(detailkind);
			System.out.println("timeString :"+timeString);
			System.out.println("where :"+where);
			System.out.println("detailkind :"+detailkind);
			dList.add(dd);
		}
			
			for(DeliveryDTO g : dList){
				System.out.println("리스트 확인");
				System.out.println(g.getTimeString());
				System.out.println(g.getWhere());
				System.out.println(g.getDetailkind());
			}
		dDTO.setCode(code);
		dDTO.setCompany(company);
		dDTO.setInvoiceNo(invoiceNo);
		dDTO.setItemName(itemName);
		dDTO.setCompleteYN(completeYN);
		dDTO.setReceiverName(receiverName);
		dDTO.setReceiverAddr(receiverAddr);
		dDTO.setKind(kind);
		
        }catch(Exception e){
        	e.printStackTrace();
        	model.addAttribute("msg","유효한 운송장 번호가 아닙니다.");
        	model.addAttribute("url","/orderDetail.do?tranNo="+tran_no);
        	return "/redirect";
        }
        System.out.println("result : "+result);
        
        model.addAttribute("dDTO",dDTO);
        model.addAttribute("tran_no",tran_no);
        model.addAttribute("dList",dList);
        model.addAttribute("result",result);
        
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