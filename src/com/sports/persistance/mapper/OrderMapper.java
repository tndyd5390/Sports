package com.sports.persistance.mapper;

import com.sports.config.Mapper;
import com.sports.dto.BasketDTO;
import com.sports.dto.Basket_OptionDTO;
import com.sports.dto.OrdProdOptionDTO;
import com.sports.dto.OrdProductDTO;
import com.sports.dto.Order_infoDTO;

import java.util.List;
@Mapper("OrderMapper")
public interface OrderMapper {
	public int insertOrderProdFromBasket(BasketDTO bDTO) throws Exception;
	public int insertOrderProdOptFromBasket(List<Basket_OptionDTO> oDTO) throws Exception;
	public int updateOrderProdStatusFromBasket(List<BasketDTO> bList) throws Exception;
	public int insertOrderInfoFromBasket(Order_infoDTO oDTO) throws Exception;
	public List<Order_infoDTO> getTotalOrderInfoList(String userNo) throws Exception;
	public List<OrdProductDTO> getOrderProductList(String TRAN_NO) throws Exception;
	public List<OrdProdOptionDTO> getOrderProductOptionList(String ordProdNo) throws Exception;
	public List<Order_infoDTO> getOrderInfoDate(String userNo) throws Exception;
	public List<Order_infoDTO> getOrderInfoDateDetailList(Order_infoDTO oDTO) throws Exception;
	public Order_infoDTO getOrderInfoDetail(String tranNo) throws Exception;
	public void setDelivery(Order_infoDTO oDTO)throws Exception;
	public List<Order_infoDTO> getAllOrderDate() throws Exception;
	public List<Order_infoDTO> getAdminOrderInfoDateDetailList(Order_infoDTO oDTO) throws Exception;
}
