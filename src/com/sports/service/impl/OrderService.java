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
import com.sports.service.IBasketService;
import com.sports.service.IOrderService;

@Service("OrderService")
public class OrderService implements IOrderService {
	@Resource(name="OrderMapper")
	private OrderMapper orderMapper;
	@Resource(name="BasketService")
	private IBasketService basketService;
	
	@Override
	public void insertOrderFromBasket(List<String> bskNoList, Order_infoDTO oDTO, String userNo, String tranNo) throws Exception {
		List<BasketDTO> bList = basketService.getCustomerBasketList(userNo);
		int insertOrdProdResult = 0;
		if(bList == null){
			bList = new ArrayList<>();
		}
		for(BasketDTO bDTO : bList){
			bDTO.setTranNo(tranNo);
			bDTO.setUser_no(userNo);
			insertOrdProdResult += orderMapper.insertOrderProdFromBasket(bDTO);
			if(bDTO.getBskOptList() == null){
				bDTO.setBskOptList(new ArrayList<Basket_OptionDTO>());
			}
			if(bDTO.getBskOptList().size() != 0){
				for(Basket_OptionDTO dto : bDTO.getBskOptList()){
					dto.setTranNo(tranNo);
					dto.setReg_user_no(userNo);
				}
				orderMapper.insertOrderProdOptFromBasket(bDTO.getBskOptList());
			}
			/*if(bDTO.getBskOptList() == null){
				bDTO.setBskOptList(new ArrayList<Basket_OptionDTO>());
			}
			System.out.println("gogogogogo please");
			List<Basket_OptionDTO> optList = bDTO.getBskOptList();
			for(int i = 0; i < optList.size(); i++){
				optList.get(i).setTranNo(tranNo);
			}*/
		}
		orderMapper.updateOrderProdStatusFromBasket(bList);
		orderMapper.insertOrderInfoFromBasket(oDTO);
	}
}
