package com.sports.service;

import java.util.List;

import com.sports.dto.BasketDTO;

public interface IBasketService {
	public int insertCustomerAddBasket(BasketDTO bDTO, List<String> optNos, List<String> optNames, String userNo) throws Exception;
	public int insertCustomerAddBasketNoOption(BasketDTO bDTO) throws Exception;
	
}
