package com.sports.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.ProductInfoDTO;
import com.sports.persistance.mapper.ProductInfoMapper;
import com.sports.service.IProductInfoService;

@Service("ProductInfoService")
public class ProductInfoService implements IProductInfoService{
	@Resource(name="ProductInfoMapper")
	private ProductInfoMapper productInfoMapper;

	@Override
	public List<ProductInfoDTO> getCategoryParents() throws Exception {
		return productInfoMapper.getCategoryParents();
	}

	@Override
	public List<ProductInfoDTO> getCategoryChild(ProductInfoDTO pDTO) throws Exception {
		return productInfoMapper.getCategoryChild(pDTO);
	}

}
