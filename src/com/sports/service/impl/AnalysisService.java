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

}
