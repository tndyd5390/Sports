package com.sports.service;

import java.util.List;

import com.sports.dto.ProductInfoDTO;

public interface IProductInfoService {

	List<ProductInfoDTO> getCategoryParents() throws Exception;

	List<ProductInfoDTO> getCategoryChild(ProductInfoDTO pDTO) throws Exception;

}
