package com.sports.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.persistance.mapper.AnalysisMapper;
import com.sports.service.IAnalysisService;

@Service("AnalysisService")
public class AnalysisService implements IAnalysisService{
	@Resource(name="AnalysisMapper")
	private AnalysisMapper analysisMapper;

}
