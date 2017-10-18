package com.sports.persistance.mapper;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sports.config.Mapper;
import com.sports.dto.QADTO;

@Mapper("QAMapper")
public interface QAMapper {

	List<QADTO> getQAList() throws Exception;

	void insertQADetail(QADTO qaDTO) throws Exception;
	
	QADTO getQADetail(QADTO qaDTO) throws Exception;

	void updateQADetailNoImg(QADTO qaDTO) throws Exception;
	
	void updateQADetailImg(QADTO qaDTO) throws Exception;

	void deleteQADetail(QADTO qaDTO) throws Exception;
	
	void deleteQAList(QADTO qaDTO) throws Exception;
	
	void insertQAAnswerDetail(QADTO qaDTO) throws Exception;

	QADTO getQAAnswerDetail(QADTO qaDTO) throws Exception;
	
	void updateQAAnswerDetailNoImg(QADTO qaDTO) throws Exception;
	
	void updateQAAnswerDetailImg(QADTO qaDTO) throws Exception;
	
	void deleteQAAnswerDetail(QADTO qaDTO) throws Exception;
	
	List<QADTO> getQAMoreView(QADTO qaDTO) throws Exception;
	
	List<QADTO> getQASearchList(QADTO qaDTO) throws Exception;
	
}