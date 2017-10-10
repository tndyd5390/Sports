package com.sports.controller.admin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class DeliveryController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="deliverytracking")
	public String deliverytracking(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		
		log.info(this.getClass() + "deliverytracking Start!!");
		String url = "http://tracking.sweettracker.net/tracking"; //서비스URL
        String key = "g1KSViceIkKV0hWrnB6rgQ"; //신청해서 받은 키
        String code = "01";
        String invoice = "6076550119370";
        
        String furl = String.format("%s/?t_key=%s&t_code=%s&t_invoice=%s", url, key, code, invoice);
        System.out.println(furl);
        URL obj = new URL(furl);
        HttpURLConnection httpConn  = (HttpURLConnection) obj.openConnection();

        // 전송방식 GET 지정
        httpConn .setRequestMethod("GET");

        // 요청헤더 추가
        httpConn .setRequestProperty("User-Agent", "Mozilla/5.0");
        httpConn .setRequestProperty("Accept", "application/json");
        
        int responseCode = httpConn.getResponseCode();
        
        // 응답코드 확인(정상호출시 200)
        System.out.println("Response Code : " + responseCode);
        
        BufferedReader in = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
        String inputLine;
        StringBuffer response2 = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response2.append(inputLine);
        }
        in.close();
        String val = response2.toString();
        //결과 확인
        System.out.println(response2.toString());
        
		
        
        String decoded_result = new String(val.getBytes("UTF-8"), "UTF-8");
        System.out.println(" 값 : " + decoded_result);
		
        model.addAttribute("decoded_result",decoded_result);
        model.addAttribute("code",code);
        
		log.info(this.getClass() + "deliverytracking End!!");
		return "delivery/deliverytracking";
	}
	
	/*@RequestMapping(value="accountmanagement")
	public String accountmanagement() throws Exception{
		log.info(this.getClass() + "deliverytracking Start!!");
		
		log.info(this.getClass() + "deliverytracking End!!");
		return "account/accountmanagement";
	}*/
	
	@RequestMapping(value="delivery")
	public  String delivery(ModelMap model) throws Exception{
		String url = "http://info.sweettracker.co.kr/api/v1/trackingInfo?";
		String key = "vHIm8cvc9TWPvLHhaAFXnA";
		String t_code = "05";
		String t_invoice = "8601360191";
		String final_url = url + "t_key="+key+"&t_code="+t_code+"&t_invoice="+t_invoice;
		
		System.out.println("final_url : "+final_url);
/*		
		URL connUrl = new URL(final_url);
		http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=g1KSViceIkKV0hWrnB6rgQ&t_code=04&t_invoice=611517826623
		ObjectMapper objMapper = new ObjectMapper();
		DeliveryDTO dDTO = new DeliveryDTO();
		dDTO = objMapper.readValue(connUrl, DeliveryDTO.class);
		
		return dDTO; */
		
		//http://tracking.sweettracker.net/tracking
		
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
        
        model.addAttribute("result",result);
        model.addAttribute("code",t_code);
        
        return "/delivery/deliverytracking";
	}
}
