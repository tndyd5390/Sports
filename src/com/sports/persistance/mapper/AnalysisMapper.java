package com.sports.persistance.mapper;

import java.util.List;

import com.sports.config.Mapper;
import com.sports.dto.AnalysisDTO;

@Mapper("AnalysisMapper")
public interface AnalysisMapper {

	List<AnalysisDTO> getBasketDay(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getBasketQuarter(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getBasketYear(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getBasketQuarterDoughnut(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getBasketDayDoughnut(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getBasketYearDoughnut(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getSalesDay(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getSalesQuarter(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getSalesYear(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getSalesMonth(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getBasketMonth(AnalysisDTO aDTO) throws Exception;

	List<AnalysisDTO> getBasketMonthDoughnut(AnalysisDTO aDTO) throws Exception;

}
