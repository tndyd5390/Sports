package com.sports.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.persistance.mapper.NoticeMapper;
import com.sports.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService {
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
}
