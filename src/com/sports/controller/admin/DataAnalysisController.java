package com.sports.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sports.dto.AnalysisDTO;
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
	
	@RequestMapping(value="basketDay")
	public @ResponseBody List<AnalysisDTO> basketDay(@RequestParam(value="date") String date) throws Exception{
		log.info(this.getClass() + " basketDay Start!!");
		
		log.info("date : "+date);
		AnalysisDTO aDTO = new AnalysisDTO();
		aDTO.setReg_dt(date);
		
		List<AnalysisDTO> aList = new ArrayList<AnalysisDTO>();
		
		aList = analysisService.getBasketDay(aDTO);
		
		aDTO = null;
		log.info(this.getClass() + " basketDay End!!");
		return aList;
	}
	
	@RequestMapping(value="basketQuarter")
	public @ResponseBody List<AnalysisDTO> basketQuater(@RequestParam(value="quarter") String quarter) throws Exception{
		log.info(this.getClass() + " basketQuarter Start!!");
		
		log.info("quarter : " +quarter);
		AnalysisDTO aDTO = new AnalysisDTO();
		aDTO.setQuarter(quarter);
		List<AnalysisDTO> aList = new ArrayList<AnalysisDTO>();
		aList = analysisService.getBasketQuarter(aDTO);
		
		log.info(this.getClass() + " basketQuarter End!!");
		return aList;
	}
	@RequestMapping(value="basketYear")
	public @ResponseBody List<AnalysisDTO> basketYear(@RequestParam(value="year") String year) throws Exception{
		log.info(" basketYear Start!!");
		
		log.info(" year :" +year);
		AnalysisDTO aDTO = new AnalysisDTO();
		aDTO.setYear(year);
		List<AnalysisDTO> aList = new ArrayList<AnalysisDTO>();
		aList = analysisService.getBasketYear(aDTO);
		
		log.info(" basketYear End!!");
		return aList;
	}
}
