package com.sports.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.persistance.mapper.AnalysisMapper;

@Service("AnalysisService")
public class AnalysisService {
	@Resource(name="analysisMapper")
	private AnalysisMapper analysisMapper;

}
