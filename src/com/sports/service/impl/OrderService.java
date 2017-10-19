package com.sports.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.BasketDTO;
import com.sports.dto.Basket_OptionDTO;
import com.sports.dto.OrdProdOptionDTO;
import com.sports.dto.OrdProductDTO;
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
			bDTO.setReg_user_no(userNo);
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

	@Override
	public List<Order_infoDTO> getTotalOrderInfoList(String userNo) throws Exception {
		List<Order_infoDTO> oInfoList = orderMapper.getTotalOrderInfoList(userNo);
		if(oInfoList == null) oInfoList = new ArrayList<>();
		for(Order_infoDTO oDTO : oInfoList){
			List<OrdProductDTO> oProdList = orderMapper.getOrderProductList(oDTO.getTran_no());
			if(oProdList == null) new ArrayList<>();
			for(OrdProductDTO prodDTO : oProdList){
				List<OrdProdOptionDTO> oProdOptList = orderMapper.getOrderProductOptionList(prodDTO.getOrd_prod_no());
				if(oProdOptList == null) oProdOptList = new ArrayList<>();
				prodDTO.setOrd_prodOpt_list(oProdOptList);
			}
			oDTO.setOrdProductList(oProdList);
		}
		return oInfoList;
	}

	@Override
	public List<Order_infoDTO> getOrderInfoDate(String userNo) throws Exception {
		return orderMapper.getOrderInfoDate(userNo);
	}

	@Override
	public List<Order_infoDTO> getOrderInfoDateDatailList(Order_infoDTO oDTO) throws Exception {
		List<Order_infoDTO> oInfoList = orderMapper.getOrderInfoDateDetailList(oDTO);
		if(oInfoList == null) oInfoList = new ArrayList<>();
		for(Order_infoDTO oDTO1 : oInfoList){
			List<OrdProductDTO> oProdList = orderMapper.getOrderProductList(oDTO1.getTran_no());
			if(oProdList == null) new ArrayList<>();
			oDTO1.setOrdProductList(oProdList);
		}
		return oInfoList;
	}

	@Override
	public Order_infoDTO getOrderInfoDetail(String tranNo) throws Exception {
		Order_infoDTO oDTO = orderMapper.getOrderInfoDetail(tranNo);
		if(oDTO == null) oDTO = new Order_infoDTO();
		List<OrdProductDTO> opList = orderMapper.getOrderProductList(oDTO.getTran_no());
		if(opList == null) opList = new ArrayList<>();
		for(OrdProductDTO opDTO : opList){
			List<OrdProdOptionDTO> opOpList = orderMapper.getOrderProductOptionList(opDTO.getOrd_prod_no());
			if(opOpList == null) opOpList = new ArrayList<>();
			opDTO.setOrd_prodOpt_list(opOpList);
		}
		oDTO.setOrdProductList(opList);
		return oDTO;
	}

	@Override
	public List<Order_infoDTO> getAllOrderDate() throws Exception {
		return orderMapper.getAllOrderDate();
	}

	@Override
	public List<Order_infoDTO> getAdminOrderInfoDateDetailList(Order_infoDTO oDTO) throws Exception {
		List<Order_infoDTO> oInfoList = orderMapper.getAdminOrderInfoDateDetailList(oDTO);
		if(oInfoList == null) oInfoList = new ArrayList<>();
		for(Order_infoDTO oDTO1 : oInfoList){
			List<OrdProductDTO> oProdList = orderMapper.getOrderProductList(oDTO1.getTran_no());
			System.out.println(oProdList.size());
			if(oProdList == null) new ArrayList<>();
			oDTO1.setOrdProductList(oProdList);
		}
		return oInfoList;
	}
}
