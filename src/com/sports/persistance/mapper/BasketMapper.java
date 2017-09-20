package com.sports.persistance.mapper;

import com.sports.config.Mapper;
import com.sports.dto.BasketDTO;

@Mapper("BasketMapper")
public interface BasketMapper {
	public int insertCustomerAddBasekt(BasketDTO bDTO) throws Exception;
}
