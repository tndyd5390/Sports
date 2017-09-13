package com.sports.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.NoticeDTO;
import com.sports.persistance.mapper.NoticeMapper;
import com.sports.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{

	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;

	@Override
	public List<NoticeDTO> getNoticeList() throws Exception {
		return noticeMapper.getNoticeList();
	}

	@Override
	public void InsertNoticeInfo(NoticeDTO nDTO) throws Exception {
		noticeMapper.InsertNoticeInfo(nDTO);
	}

	@Override
	public NoticeDTO getNoticeInfo(NoticeDTO nDTO) throws Exception {
		return noticeMapper.getNoticeInfo(nDTO);
	}

	@Override
	public void updateNoticeReadCnt(NoticeDTO nDTO) throws Exception {
		noticeMapper.updateNoticeReadCnt(nDTO);
	}

	@Override
	public void updateNoticeInfo(NoticeDTO nDTO) throws Exception {
		noticeMapper.updateNoticeInfo(nDTO);
	}

	@Override
	public void deleteNoticeInfo(NoticeDTO nDTO) throws Exception {
		noticeMapper.deleteNoticeInfo(nDTO);
	}

	@Override
	public NoticeDTO getNoticeDetailInfo(NoticeDTO nDTO) throws Exception {
		return noticeMapper.getNoticeDetailInfo(nDTO);
	}
	
	@Override
	public List<NoticeDTO> Notice_MoreView(NoticeDTO nDTO) throws Exception {
		return noticeMapper.getNotice_MoreView(nDTO);
	}

	@Override
	public void deleteCheckList(NoticeDTO nDTO) throws Exception {
		noticeMapper.deleteCheckList(nDTO);
	}

	@Override
	public List<NoticeDTO> searchNoticeList(NoticeDTO nDTO) throws Exception {
		
		return noticeMapper.getSearchList(nDTO);
	}
}
