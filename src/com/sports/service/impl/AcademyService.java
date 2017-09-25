package com.sports.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.AcademyDTO;
import com.sports.persistance.mapper.AcademyMapper;
import com.sports.service.IAcademyService;

@Service("AcademyService")
public class AcademyService implements IAcademyService {
	@Resource(name="AcademyMapper")
	private AcademyMapper academyMapper;

	@Override
	public void insertAcademy(AcademyDTO aDTO) throws Exception {
		academyMapper.insertAcademy(aDTO);
	}
}