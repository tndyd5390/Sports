package com.sports.persistance.mapper;

import java.util.List;

import com.sports.config.Mapper;
import com.sports.dto.ProductInfoDTO;

@Mapper("ProductInfoMapper")
public interface ProductInfoMapper {

	List<ProductInfoDTO> getCategoryParents() throws Exception;

	List<ProductInfoDTO> getCategoryChild(ProductInfoDTO pDTO) throws Exception;

}
