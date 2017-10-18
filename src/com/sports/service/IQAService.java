package com.sports.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sports.dto.QADTO;

public interface IQAService {
	
	List<QADTO> getQAList() throws Exception;

	void insertQADetail(QADTO qaDTO) throws Exception;

	QADTO getQADetail(QADTO qaDTO) throws Exception;
	
	void updateQADetail(QADTO qaDTO, MultipartFile file, String filePath) throws Exception;
	
	void deleteQADetail(QADTO qaDTO) throws Exception;
	
	void deleteQAList(QADTO qaDTO) throws Exception;
	
	void insertQAAnswerDetail(QADTO qaDTO) throws Exception;
	
	QADTO getQAAnswerDetail(QADTO qaDTO) throws Exception;
	
	void updateQAAnswerDetail(QADTO qaDTO, MultipartFile file, String filePath) throws Exception;
	
	void deleteQAAnswerDetail(QADTO qaDTO) throws Exception;
	
	List<QADTO> getQAMoreView(QADTO qaDTO) throws Exception;
	
	List<QADTO> getQASearchList(QADTO qaDTO) throws Exception;
	
}