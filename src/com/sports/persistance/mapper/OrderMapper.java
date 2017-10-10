package com.sports.persistance.mapper;

import com.sports.config.Mapper;
import com.sports.dto.BasketDTO;
import com.sports.dto.Basket_OptionDTO;
import com.sports.dto.Order_infoDTO;

import java.util.List;
@Mapper("OrderMapper")
public interface OrderMapper {
	public int insertOrderProdFromBasket(BasketDTO bDTO) throws Exception;
	public int insertOrderProdOptFromBasket(List<Basket_OptionDTO> oDTO) throws Exception;
	public int updateOrderProdStatusFromBasket(List<BasketDTO> bList) throws Exception;
	public int insertOrderInfoFromBasket(Order_infoDTO oDTO) throws Exception;
}
