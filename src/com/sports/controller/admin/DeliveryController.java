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
	
	
	
	@RequestMapping(value="delivery")
	public  String delivery(ModelMap model) throws Exception{
		String url = "http://info.sweettracker.co.kr/api/v1/trackingInfo?";
		String key = "vHIm8cvc9TWPvLHhaAFXnA";
		String t_code = "05";
		String t_invoice = "8601360191";
		String final_url = url + "t_key="+key+"&t_code="+t_code+"&t_invoice="+t_invoice;
		
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
        
        model.addAttribute("result",result);
        model.addAttribute("code",t_code);
        
        return "/delivery/deliverytracking";
	}
	
	@RequestMapping(value="/deliveryReg")
	public String deliveryReg(){
		
		return "/delivery/deliveryReg";
	}
}
