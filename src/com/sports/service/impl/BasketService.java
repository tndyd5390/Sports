package com.sports.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.persistance.mapper.BasketMapper;
import com.sports.service.IBasketService;

@Service("BasketService")
public class BasketService implements IBasketService{
	
	@Resource(name="BasketMapper")
	private BasketMapper basketMapper;

}
