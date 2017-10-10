package com.sports.service;

import java.util.List;

import com.sports.dto.AcademyDTO;

public interface IAcademyService {

	public void insertAcademy(AcademyDTO aDTO) throws Exception;

	public List<AcademyDTO> getAcademyList() throws Exception;

	public AcademyDTO getAcademyDetailInfo(AcademyDTO aDTO) throws Exception;

}
