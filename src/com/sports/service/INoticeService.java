package com.sports.service;

import java.util.List;

import com.sports.dto.NoticeDTO;

public interface INoticeService {

	List<NoticeDTO> getNoticeList() throws Exception;
	
	void InsertNoticeInfo(NoticeDTO nDTO) throws Exception;
	
	NoticeDTO getNoticeInfo(NoticeDTO nDTO) throws Exception;
	
	void updateNoticeReadCnt(NoticeDTO nDTO) throws Exception;
	
	void updateNoticeInfo(NoticeDTO nDTO) throws Exception;
	
	void deleteNoticeInfo(NoticeDTO nDTO) throws Exception;

	NoticeDTO getNoticeDetailInfo(NoticeDTO nDTO) throws Exception;
	
	List<NoticeDTO> Notice_MoreView(NoticeDTO nDTO) throws Exception;

	void deleteCheckList(NoticeDTO nDTO) throws Exception;

	List<NoticeDTO> searchNoticeList(NoticeDTO nDTO)throws Exception;
}
