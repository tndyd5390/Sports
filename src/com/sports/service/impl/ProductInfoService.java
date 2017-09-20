package com.sports.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.ProductFileDTO;
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

	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		fDTO.setProd_no(pDTO.getProd_no());
		System.out.println("file_prod_no : " +pDTO.getProd_no());
		return productInfoMapper.insertProductMainFile(fDTO);
	}

	@Override
	public List<ProductInfoDTO> getProductList() throws Exception {
		return productInfoMapper.getProductList();
	}

	@Override
	public List<ProductInfoDTO> getProductSelectList(ProductInfoDTO pDTO) throws Exception {
		return productInfoMapper.getProductSelectList(pDTO);
	}

	@Override
	public ProductInfoDTO getProductDetail(ProductInfoDTO pDTO) throws Exception {
		return productInfoMapper.getProductDetail(pDTO);
	}

	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, ProductFileDTO fdDTO) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		fDTO.setProd_no(pDTO.getProd_no());
		fdDTO.setProd_no(pDTO.getProd_no());
		System.out.println("file_prod_no : " +pDTO.getProd_no());
		productInfoMapper.insertProductMainFile(fDTO);
		return productInfoMapper.insertProductDetailFile(fdDTO);
	}
}
