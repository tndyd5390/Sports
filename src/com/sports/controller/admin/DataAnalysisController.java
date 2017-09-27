package com.sports.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sports.service.IAnalysisService;

@Controller
public class DataAnalysisController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AnalysisService")
	private IAnalysisService analysisService;
	
	@RequestMapping(value="dataAnalysis")
	public String userDataAnaysis(HttpServletRequest req,HttpServletResponse resp,Model model)throws Exception{
		log.info(this.getClass());
		return "dataAnalysis/dataAnalysis";
	}
	
	@RequestMapping(value="basketAnalysis")
	public String basketAnalysis()throws Exception{
		
		return "dataAnalysis/basketAnalysis";
	}
}
