package com.sports.service;

import java.util.List;

import com.sports.dto.Order_infoDTO;

public interface IOrderService {
	public void insertOrderFromBasket(List<String> bskNoList, Order_infoDTO oDTO, String userNo, String tranNo) throws Exception;
	public List<Order_infoDTO> getTotalOrderInfoList(String userNo) throws Exception;
	public List<Order_infoDTO> getOrderInfoDate(String userNo) throws Exception;
	public List<Order_infoDTO> getOrderInfoDateDatailList(Order_infoDTO oDTO) throws Exception;
	public Order_infoDTO getOrderInfoDetail(String tranNo) throws Exception;
	public void setDelivery(Order_infoDTO oDTO)throws Exception;
}
