package com.sports.service;

import java.util.List;
import java.util.Map;

import com.sports.dto.ProdOptionDTO;
import com.sports.dto.ProductFileDTO;
import com.sports.dto.ProductInfoDTO;

public interface IProductInfoService {

	List<ProductInfoDTO> getCategoryParents() throws Exception;

	List<ProductInfoDTO> getCategoryChild(ProductInfoDTO pDTO) throws Exception;

	int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO) throws Exception;

	List<ProductInfoDTO> getProductList() throws Exception;

	List<ProductInfoDTO> getProductSelectList(ProductInfoDTO pDTO) throws Exception;

	Map<String, Object> getProductDetail(ProductInfoDTO pDTO) throws Exception;

	int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, ProductFileDTO fdDTO) throws Exception;

	List<ProductInfoDTO> getSelectOption() throws Exception;

	int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, ProductFileDTO fdDTO, List<ProductInfoDTO> optList) throws Exception;

	int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, List<ProductInfoDTO> optList) throws Exception;

	void deleteOpt(ProdOptionDTO poDTO) throws Exception;

	void insertMainFile(ProductFileDTO fDTO) throws Exception;

	void insertDetailFile(ProductFileDTO fdDTO) throws Exception;

	void insertOption(List<ProductInfoDTO> optList) throws Exception;

	void updateProduct(ProductInfoDTO pDTO) throws Exception;

	void deleteFile(ProductFileDTO pDTO) throws Exception;

}