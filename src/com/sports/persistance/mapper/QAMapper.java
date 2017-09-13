package com.sports.persistance.mapper;

import com.sports.config.Mapper;
import com.sports.dto.QADTO;

@Mapper("QAMapper")
public interface QAMapper {
	public int insertCustomerQA(QADTO qDTO) throws Exception;
}
