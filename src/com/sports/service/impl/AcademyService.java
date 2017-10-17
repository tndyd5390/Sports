package com.sports.service.impl;

import java.util.List;

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

	@Override
	public List<AcademyDTO> getAcademyList() throws Exception {
		return academyMapper.getAcademyList();
	}

	@Override
	public AcademyDTO getAcademyDetailInfo(AcademyDTO cDTO) throws Exception {
		return academyMapper.getAcademyDetailInfo(cDTO);
	}

	@Override
	public void updateAcademyDetail(AcademyDTO aDTO) throws Exception {
		academyMapper.updateAcademyDetail(aDTO);
	}

	@Override
	public void academyDelete(String aca_no) throws Exception {
		academyMapper.academyDelete(aca_no);
	}

	@Override
	public List<AcademyDTO> searchAcademyList(AcademyDTO aDTO) throws Exception {
		return academyMapper.getSearchList(aDTO);
	}

	@Override
	public List<AcademyDTO> AcademyMoreList(AcademyDTO aDTO) throws Exception {
		return academyMapper.getAcademyMoreView(aDTO);
	}

	@Override
	public List<AcademyDTO> getMapAcaList() throws Exception {
		return academyMapper.getMapAcaList();
	}

	@Override
	public int updateAcaVisit(AcademyDTO aDTO) throws Exception {
		return academyMapper.updateAcaVisit(aDTO);
	}
}
