package com.sports.service;

import java.util.List;

import com.sports.dto.BasketDTO;

public interface IBasketService {
	public int insertCustomerAddBasket(BasketDTO bDTO, List<String> optNo, String userNo) throws Exception;
}
