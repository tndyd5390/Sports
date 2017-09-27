package com.sports.persistance.mapper;

import java.util.List;

import com.sports.config.Mapper;
import com.sports.dto.AcademyDTO;

@Mapper("AcademyMapper")
public interface AcademyMapper {

	public void insertAcademy(AcademyDTO aDTO) throws Exception;

	public List<AcademyDTO> getAcademyList() throws Exception;
}
