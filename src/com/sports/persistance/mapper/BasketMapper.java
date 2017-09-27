package com.sports.persistance.mapper;

import java.util.List;

import com.sports.config.Mapper;
import com.sports.dto.BasketDTO;
import com.sports.dto.Basket_OptionDTO;

@Mapper("BasketMapper")
public interface BasketMapper {
	public int insertCustomerAddBasekt(BasketDTO bDTO) throws Exception;
	public int insertCustormerBasketOption(List<Basket_OptionDTO> oList) throws Exception;
	public int insertCustomerAddBasketNoOption(BasketDTO bDTO) throws Exception;
}
