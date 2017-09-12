package com.sports.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.NoticeDTO;
import com.sports.dto.UserDTO;
import com.sports.persistance.mapper.NoticeMapper;
import com.sports.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
	@Override
	public UserDTO testUser(String userNo) throws Exception {
		return noticeMapper.testUser(userNo);
	}
}
