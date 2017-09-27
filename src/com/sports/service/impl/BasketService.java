package com.sports.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.BasketDTO;
import com.sports.dto.Basket_OptionDTO;
import com.sports.persistance.mapper.BasketMapper;
import com.sports.service.IBasketService;

@Service("BasketService")
public class BasketService implements IBasketService{
	
	@Resource(name="BasketMapper")
	private BasketMapper basketMapper;

	@Override
	public int insertCustomerAddBasket(BasketDTO bDTO, List<String> optNos, List<String> optNames, List<String> optKinds, String userNo) throws Exception{
		List<Basket_OptionDTO> oList = new ArrayList<>();
		if(optNos.size() != optNames.size() || optNos.size() != optKinds.size() || optNames.size() != optKinds.size()) throw new IndexOutOfBoundsException("제품의 인덱스가 맞지 않습니다.");
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

}
