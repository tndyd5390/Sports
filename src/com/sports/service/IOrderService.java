package com.sports.service;

import java.util.List;

import com.sports.dto.Order_infoDTO;

public interface IOrderService {
	public void insertOrderFromBasket(List<String> bskNoList, Order_infoDTO oDTO, String userNo, String tranNo) throws Exception;
}
