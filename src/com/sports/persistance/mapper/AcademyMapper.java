package com.sports.persistance.mapper;

import java.util.List;

import com.sports.config.Mapper;
import com.sports.dto.AcademyDTO;

@Mapper("AcademyMapper")
public interface AcademyMapper {
	public void insertAcademy(AcademyDTO aDTO) throws Exception;
	public List<AcademyDTO> getAcademyList() throws Exception;
	public AcademyDTO getAcademyDetailInfo(AcademyDTO cDTO) throws Exception;
	public void updateAcademyDetail(AcademyDTO aDTO) throws Exception;
	public void academyDelete(String aca_no) throws Exception;
	public List<AcademyDTO> getSearchList(AcademyDTO aDTO) throws Exception;
	public List<AcademyDTO> getAcademyMoreView(AcademyDTO aDTO) throws Exception;
}
