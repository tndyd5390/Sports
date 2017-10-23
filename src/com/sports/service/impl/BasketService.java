package com.sports.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.BasketDTO;
import com.sports.dto.Basket_OptionDTO;
import com.sports.dto.UserDTO;
import com.sports.persistance.mapper.BasketMapper;
import com.sports.service.IBasketService;

@Service("BasketService")
public class BasketService implements IBasketService{
	
	@Resource(name="BasketMapper")
	private BasketMapper basketMapper;

	@Override
	public int insertCustomerAddBasket(BasketDTO bDTO, List<String> optNos, List<String> optNames, List<String> optKinds, String userNo) throws Exception{
		List<Basket_OptionDTO> oList = new ArrayList<>();
		if(optNos.size() != optNames.size() || optNos.size() != optKinds.size() || optNames.size() != optKinds.size()) throw new IndexOutOfBoundsException("�ε����� ���� �ʽ��ϴ�.");
		for(int i = 0; i < optNos.size(); i++){
			Basket_OptionDTO oDTO = new Basket_OptionDTO();
			oDTO.setOpt_no(optNos.get(i));
			oDTO.setReg_user_no(userNo);
			oDTO.setOpt_name(optNames.get(i));
			oDTO.setOpt_kind(optKinds.get(i));
			oList.add(oDTO);
		}
		int insertBaseket = basketMapper.insertCustomerAddBasekt(bDTO);
		int insertBasketOption = basketMapper.insertCustormerBasketOption(oList); 
		if(insertBaseket != 0 && insertBasketOption != 0){
			return 1;
		}else{
			return 0;
		}
	}

	@Override
	public int insertCustomerAddBasketNoOption(BasketDTO bDTO) throws Exception {
		return basketMapper.insertCustomerAddBasketNoOption(bDTO);
	}

	@Override
	public List<BasketDTO> getCustomerBasketList(String userNo) throws Exception {
		
		List<BasketDTO> bList = basketMapper.getCustomerBasketList(userNo);
		for(int i = 0; i < bList.size(); i++){
			Map<String, String> parameterMap = new HashMap<String, String>();
			parameterMap.put("userNo", bList.get(i).getUser_no());
			parameterMap.put("bskNo", bList.get(i).getBsk_no());
			List<Basket_OptionDTO> bOptList = basketMapper.getCustomerBasketOptionList(parameterMap);
			if(bOptList == null){
				bOptList  = new ArrayList<Basket_OptionDTO>();
			}
			System.out.println("bOptList.size() : " + bOptList.size());
			bList.get(i).setBskOptList(bOptList);
		}
		
		return bList;
	}

	@Override
	public List<BasketDTO> updateCustomerBasketOne(String bskNo, String userNo) throws Exception {
		int updateResult = 0;
		updateResult = basketMapper.updateCustomerBasketDeleteOne(bskNo);
		List<BasketDTO> bList = getCustomerBasketList(userNo);
		if(bList == null){
			bList = new ArrayList<>();
		}
		return bList;
	}

	@Override
	public UserDTO getUserInfoForOrderView(String userNo) throws Exception {
		return basketMapper.getUserInfoForOrderView(userNo);
	}
}
