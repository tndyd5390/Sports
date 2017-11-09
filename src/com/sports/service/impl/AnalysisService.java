package com.sports.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.AnalysisDTO;
import com.sports.persistance.mapper.AnalysisMapper;
import com.sports.service.IAnalysisService;

@Service("AnalysisService")
public class AnalysisService implements IAnalysisService{
	@Resource(name="AnalysisMapper")
	private AnalysisMapper analysisMapper;

	@Override
	public List<AnalysisDTO> getBasketDay(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getBasketDay(aDTO);
	}

	@Override
	public List<AnalysisDTO> getBasketQuarter(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getBasketQuarter(aDTO);
	}

	@Override
	public List<AnalysisDTO> getBasketYear(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getBasketYear(aDTO);
	}

	@Override
	public List<AnalysisDTO> getBasketQuarterDoughnut(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getBasketQuarterDoughnut(aDTO);
	}

	@Override
	public List<AnalysisDTO> getBasketDayDoughnut(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getBasketDayDoughnut(aDTO);
	}

	@Override
	public List<AnalysisDTO> getBasketYearDoughnut(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getBasketYearDoughnut(aDTO);
	}

	@Override
	public List<AnalysisDTO> getSalesDay(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getSalesDay(aDTO);
	}

	@Override
	public List<AnalysisDTO> getSalesQuarter(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getSalesQuarter(aDTO);
	}

	@Override
	public List<AnalysisDTO> getSalesYear(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getSalesYear(aDTO);
	}

	@Override
	public List<AnalysisDTO> getSalesMonth(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getSalesMonth(aDTO);
	}

	@Override
	public List<AnalysisDTO> getBasketMonth(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getBasketMonth(aDTO);
	}

	@Override
	public List<AnalysisDTO> getBasketMonthDoughnut(AnalysisDTO aDTO) throws Exception {
		return analysisMapper.getBasketMonthDoughnut(aDTO);
	}

}
