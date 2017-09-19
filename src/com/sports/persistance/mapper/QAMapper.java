package com.sports.persistance.mapper;

import java.util.List;

import com.sports.config.Mapper;
import com.sports.dto.QADTO;

@Mapper("QAMapper")
public interface QAMapper {

	List<QADTO> getQAList() throws Exception;

	void insertQADetail(QADTO qaDTO) throws Exception;
	
	QADTO getQADetail(QADTO qaDTO) throws Exception;

	void updateQADetail(QADTO qaDTO) throws Exception;

	void deleteQADetail(QADTO qaDTO) throws Exception;
	
	void deleteQAList(QADTO qaDTO) throws Exception;
	
	void insertQAAnswerDetail(QADTO qaDTO) throws Exception;

	QADTO getQAAnswerDetail(QADTO qaDTO) throws Exception;
	
	void updateQAAnswerDetail(QADTO qaDTO) throws Exception;
	
	void deleteQAAnswerDetail(QADTO qaDTO) throws Exception;
	
	List<QADTO> getQAMoreView(QADTO qaDTO) throws Exception;
	
	List<QADTO> getQASearchList(QADTO qaDTO) throws Exception;
	
	//public int insertCustomerQA(QADTO qDTO) throws Exception;
}
