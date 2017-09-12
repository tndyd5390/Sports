package com.sports.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.persistance.mapper.ComMapper;
import com.sports.service.IComService;

@Service("ComService")
public class ComService implements IComService{
	@Resource(name="ComMapper")
	private ComMapper comMapper;

}
