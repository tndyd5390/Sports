package com.sports.service;

import java.util.List;

import com.sports.dto.AnalysisDTO;

public interface IAnalysisService {

	List<AnalysisDTO> getBasketDay(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getBasketQuarter(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getBasketYear(AnalysisDTO aDTO) throws Exception;

}
