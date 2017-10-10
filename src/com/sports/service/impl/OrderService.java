package com.sports.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.BasketDTO;
import com.sports.dto.Basket_OptionDTO;
import com.sports.dto.Order_infoDTO;
import com.sports.persistance.mapper.BasketMapper;
import com.sports.persistance.mapper.OrderMapper;
import com.sports.service.IOrderService;

@Service("OrderService")
public class OrderService implements IOrderService {
	@Resource(name="OrderMapper")
	private OrderMapper orderMapper;
	@Resource(name="BasketMapper")
	private BasketMapper basketMapper;
	
	@Override
	public void insertOrderFromBasket(List<String> bskNoList, Order_infoDTO oDTO, String userNo, String tranNo) throws Exception {
		List<BasketDTO> bList = basketMapper.getCustomerBasketList(userNo);
		int insertOrdProdResult = 0;
		if(bList == null){
			bList = new ArrayList<>();
		}
		for(BasketDTO bDTO : bList){
			bDTO.setTranNo(tranNo);
			insertOrdProdResult += orderMapper.insertOrderProdFromBasket(bDTO);
			if(bDTO.getBskOptList() != null){
				orderMapper.insertOrderProdOptFromBasket(bDTO.getBskOptList());
			}
		}
		orderMapper.updateOrderProdStatusFromBasket(bList);
		orderMapper.insertOrderInfoFromBasket(oDTO);
	}
}
