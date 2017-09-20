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
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeliveryController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="deliverytracking")
	public String deliverytracking(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		
		log.info(this.getClass() + "deliverytracking Start!!");
		String url = "http://tracking.sweettracker.net/tracking"; //서비스URL
        String key = "X12Wsgl4c8NuVRBikX2T4g"; //신청해서 받은 키
        String code = "04";
        String invoice = "610154387133";
        
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
	
	@RequestMapping(value="accountmanagement")
	public String accountmanagement() throws Exception{
		log.info(this.getClass() + "deliverytracking Start!!");
		
		log.info(this.getClass() + "deliverytracking End!!");
		return "account/accountmanagement";
	}
}
