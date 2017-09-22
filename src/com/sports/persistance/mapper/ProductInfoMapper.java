package com.sports.persistance.mapper;

import java.util.List;

import com.sports.config.Mapper;
import com.sports.dto.ProdOptionDTO;
import com.sports.dto.ProductFileDTO;
import com.sports.dto.ProductInfoDTO;

@Mapper("ProductInfoMapper")
public interface ProductInfoMapper {

	List<ProductInfoDTO> getCategoryParents() throws Exception;

	List<ProductInfoDTO> getCategoryChild(ProductInfoDTO pDTO) throws Exception;

	int insertProductMainFile(ProductFileDTO fDTO) throws Exception;

	int insertProductDetailFile(ProductFileDTO fdDTO) throws Exception;

	void insertProduct(ProductInfoDTO pDTO) throws Exception;

	List<ProductInfoDTO> getProductList() throws Exception;

	List<ProductInfoDTO> getProductSelectList(ProductInfoDTO pDTO) throws Exception;

	ProductInfoDTO getProductDetail(ProductInfoDTO pDTO) throws Exception;

	ProdOptionDTO getProductOption(String prodNo) throws Exception;
	
	List<ProductInfoDTO> getSelectOption() throws Exception;

	int insertProductOption(List<ProductInfoDTO> setList) throws Exception;

}
