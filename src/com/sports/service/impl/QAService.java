package com.sports.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.QADTO;
import com.sports.persistance.mapper.QAMapper;
import com.sports.service.IQAService;
@Service("QAService")
public class QAService implements IQAService{
	@Resource(name="QAMapper")
	private QAMapper qaMapper;
	@Override
	public int insertCustomerQA(QADTO qDTO) throws Exception {
		return qaMapper.insertCustomerQA(qDTO);
	}

}
