package com.sports.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sports.dto.QADTO;
import com.sports.persistance.mapper.QAMapper;
import com.sports.service.IQAService;
import com.sports.util.CmmUtil;

@Service("QAService")
public class QAService implements IQAService {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="QAMapper")
	private QAMapper qaMapper;
	
	@Override
	public List<QADTO> getQAList() throws Exception {
		return qaMapper.getQAList();
	}
	
	@Override
	public void insertQADetail(QADTO qaDTO) throws Exception {
		qaMapper.insertQADetail(qaDTO);
	}
	
	@Override
	public QADTO getQADetail(QADTO qaDTO) throws Exception {
		System.out.println("1: " + qaDTO.getReg_user_no());
		if (qaDTO.getReg_user_no() == "5") {
			
	
			
			//관리자일 경우
			return qaMapper.getAdminQADetail(qaDTO);
			
		} else {
			
			//사용자일 경우
			return qaMapper.getCustomerQADetail(qaDTO);
			
		}

	}
	
	@Override
	public void updateQADetail(QADTO qaDTO, MultipartFile file, String filePath) throws Exception {
		
		if (file.getOriginalFilename().equals("")) {
			
			//파일 X
			qaMapper.updateQADetailNoImg(qaDTO);
			
		} else {
 
			//파일 O
			QADTO rDTO = getQADetail(qaDTO);
			
			File f = new File(rDTO.getFile_path() + rDTO.getFile_name());
			
			if (f.delete()) {
				log.info(this.getClass() + ".deleteQADetail file success");
			} else {
				log.info(this.getClass() + ".deleteQADetail file fail");
			}
				
			String reFileName = "";
			String fileOrgName = file.getOriginalFilename();
			String extended = fileOrgName.substring(fileOrgName.indexOf("."), fileOrgName.length());
			String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
			
			filePath = CmmUtil.nvl(filePath);
			reFileName = filePath + now + extended;
			
			File newFile = new File(reFileName);
			file.transferTo(newFile);
			
			qaDTO.setFile_org_name(fileOrgName);
			qaDTO.setFile_name(now + extended);
			qaDTO.setFile_path(filePath);
			
			qaMapper.updateQADetailImg(qaDTO);
			
		}
		
	}
	
	@Override
	public void deleteQADetail(QADTO qaDTO) throws Exception {

		qaDTO = getQADetail(qaDTO);

		File f = new File(qaDTO.getFile_path() + qaDTO.getFile_name());
		
		if (f.delete()) {
			log.info(this.getClass() + ".deleteQADetail file success");
		} else {
			log.info(this.getClass() + ".deleteQADetail file fail");
		}
		
		qaMapper.deleteQADetail(qaDTO);
		
	}	
	
	@Override 
	public void deleteQAList(QADTO qaDTO) throws Exception {
		qaMapper.deleteQAList(qaDTO);
	}
	
	@Override
	public void insertQAAnswerDetail(QADTO qaDTO) throws Exception {
		qaMapper.insertQAAnswerDetail(qaDTO);
	}
	
	@Override
	public QADTO getQAAnswerDetail(QADTO qaDTO) throws Exception {
		return qaMapper.getQAAnswerDetail(qaDTO);
	}
	
	@Override
	public void updateQAAnswerDetail(QADTO qaDTO, MultipartFile file, String filePath) throws Exception {
		
		if (file.getOriginalFilename().equals("")) {
			
			//파일 X
			qaMapper.updateQAAnswerDetailNoImg(qaDTO);
			
		} else {
			
			//파일 O
			QADTO rDTO = qaMapper.getQAAnswerDetail(qaDTO);
			
			File f = new File(rDTO.getFile_path() + rDTO.getFile_name());
			
			if (f.delete()) {
				log.info(this.getClass() + ".deleteQAAnswerDetail file success");
			} else {
				log.info(this.getClass() + ".deleteQAAnswerDetail file fail");
			}
				
			String reFileName = "";
			String fileOrgName = file.getOriginalFilename();
			String extended = fileOrgName.substring(fileOrgName.indexOf("."), fileOrgName.length());
			String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
			
			filePath = CmmUtil.nvl(filePath);
			reFileName = filePath + now + extended;
			
			File newFile = new File(reFileName);
			file.transferTo(newFile);
			
			qaDTO.setFile_org_name(fileOrgName);
			qaDTO.setFile_name(now + extended);
			qaDTO.setFile_path(filePath);
			
			qaMapper.updateQAAnswerDetailImg(qaDTO);
			
		}
		
	}
	
	@Override
	public void deleteQAAnswerDetail(QADTO qaDTO) throws Exception {
		
		qaDTO = qaMapper.getQAAnswerDetail(qaDTO);
		
		File f = new File(qaDTO.getFile_path() + qaDTO.getFile_name());
		
		if (f.delete()) {
			log.info(this.getClass() + ".deleteQAAnswerDetail file success");
		} else {
			log.info(this.getClass() + ".deleteQAAnswerDetail file fail");
		}
		
		qaMapper.deleteQAAnswerDetail(qaDTO);
		
	}
	
	@Override
	public List<QADTO> getQAMoreView(QADTO qaDTO) throws Exception {
		return qaMapper.getQAMoreView(qaDTO);
	}
	
	@Override
	public List<QADTO> getQASearchList(QADTO qaDTO) throws Exception{
		return qaMapper.getQASearchList(qaDTO);
	}
	
}