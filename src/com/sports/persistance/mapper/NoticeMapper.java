package com.sports.persistance.mapper;

import java.util.List;
import com.sports.config.Mapper;
import com.sports.dto.NoticeDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {

	List<NoticeDTO> getNoticeList() throws Exception;

	void InsertNoticeInfo(NoticeDTO nDTO) throws Exception;

	NoticeDTO getNoticeInfo(NoticeDTO nDTO) throws Exception;

	void updateNoticeReadCnt(NoticeDTO nDTO) throws Exception;

	void updateNoticeInfo(NoticeDTO nDTO) throws Exception;

	void deleteNoticeInfo(NoticeDTO nDTO) throws Exception;

	NoticeDTO getNoticeDetailInfo(NoticeDTO nDTO)throws Exception;
	
	List<NoticeDTO> getNotice_MoreView(NoticeDTO nDTO)throws Exception;

	void deleteCheckList(NoticeDTO nDTO) throws Exception;

	List<NoticeDTO> getSearchList(NoticeDTO nDTO)throws Exception;
	

}
