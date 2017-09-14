package com.sports.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.sports.dto.QADTO;
import com.sports.persistance.mapper.QAMapper;
import com.sports.service.IQAService;

@Service("QAService")
public class QAService implements IQAService {
	
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
		return qaMapper.getQADetail(qaDTO);
	}
	
	@Override
	public void updateQADetail(QADTO qaDTO) throws Exception {
		qaMapper.updateQADetail(qaDTO);
	}
	
	@Override
	public void updateQA_file(QADTO qaDTO) throws Exception {
		qaMapper.updateQA_file(qaDTO);
	}
	
	@Override
	public void deleteQADetail(QADTO qaDTO) throws Exception {
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
	public void insertQAAnswer_file(QADTO qaDTO) throws Exception {
		qaMapper.insertQAAnswer_file(qaDTO);
	}
	
	@Override
	public QADTO getQAAnswerDetail(QADTO qaDTO) throws Exception {
		return qaMapper.getQAAnswerDetail(qaDTO);
	}
	
	@Override
	public void updateQAAnswerDetail(QADTO qaDTO) throws Exception {
		qaMapper.updateQAAnswerDetail(qaDTO);
	}
	
	@Override
	public void updateQAAnswer_file(QADTO qaDTO) throws Exception {
		qaMapper.updateQAAnswer_file(qaDTO);
	}
	
	@Override
	public void deleteQAAnswerDetail(QADTO qaDTO) throws Exception {
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
	
	/*@Override
	public int insertCustomerQA(QADTO qDTO) throws Exception {
		return qaMapper.insertCustomerQA(qDTO);
	}*/

}