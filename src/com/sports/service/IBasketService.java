package com.sports.service;

import java.util.List;

import com.sports.dto.BasketDTO;
import com.sports.dto.UserDTO;

public interface IBasketService {
	public int insertCustomerAddBasket(BasketDTO bDTO, List<String> optNos, List<String> optNames, List<String> optKinds, String userNo) throws Exception;
	public int insertCustomerAddBasketNoOption(BasketDTO bDTO) throws Exception;
	public List<BasketDTO> getCustomerBasketList(String userNo) throws Exception;
	public List<BasketDTO> updateCustomerBasketOne(String bskNo, String userNo) throws Exception;
	public UserDTO getUserInfoForOrderView(String userNo) throws Exception;
}
