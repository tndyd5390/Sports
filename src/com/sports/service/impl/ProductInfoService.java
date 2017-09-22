package com.sports.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	public Map<String, Object> getProductDetail(ProductInfoDTO pDTO) throws Exception {
		//return productInfoMapper.getProductDetail(pDTO);
		return null;
	}

	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, ProductFileDTO fdDTO) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		fDTO.setProd_no(pDTO.getProd_no());
		fdDTO.setProd_no(pDTO.getProd_no());
		productInfoMapper.insertProductMainFile(fDTO);
		return productInfoMapper.insertProductDetailFile(fdDTO);
	}

	@Override
	public List<ProductInfoDTO> getSelectOption() throws Exception {
		return productInfoMapper.getSelectOption();
	}

	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, ProductFileDTO fdDTO, List<ProductInfoDTO> optList) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		fDTO.setProd_no(pDTO.getProd_no());
		fdDTO.setProd_no(pDTO.getProd_no());
		List<ProductInfoDTO> setList = new ArrayList<ProductInfoDTO>();
		for(ProductInfoDTO optDTO : optList){
			ProductInfoDTO setDTO = new ProductInfoDTO();
			setDTO.setOpt_kind(optDTO.getOpt_kind());
			setDTO.setOpt_name(optDTO.getOpt_name());
			setDTO.setOpt_price(optDTO.getOpt_price());
			setDTO.setProd_no(pDTO.getProd_no());
			setList.add(setDTO);
		}
		productInfoMapper.insertProductMainFile(fDTO);
		productInfoMapper.insertProductOption(setList);
		return productInfoMapper.insertProductDetailFile(fdDTO);
	}

	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, List<ProductInfoDTO> optList) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		fDTO.setProd_no(pDTO.getProd_no());
		List<ProductInfoDTO> setList = new ArrayList<ProductInfoDTO>();
		for(ProductInfoDTO optDTO : optList){
			ProductInfoDTO setDTO = new ProductInfoDTO();
			setDTO.setOpt_kind(optDTO.getOpt_kind());
			setDTO.setOpt_name(optDTO.getOpt_name());
			setDTO.setOpt_price(optDTO.getOpt_price());
			setDTO.setProd_no(pDTO.getProd_no());
			setList.add(setDTO);
		}
		productInfoMapper.insertProductOption(setList);
		return productInfoMapper.insertProductMainFile(fDTO);
	}
}
