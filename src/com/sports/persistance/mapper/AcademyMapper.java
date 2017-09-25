package com.sports.persistance.mapper;

import com.sports.config.Mapper;
import com.sports.dto.AcademyDTO;

@Mapper("AcademyMapper")
public interface AcademyMapper {

	void insertAcademy(AcademyDTO aDTO);

}