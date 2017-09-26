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
	public int insertCustomerAddBasket(BasketDTO bDTO, List<String> optNos, List<String> optNames, String userNo) throws Exception{
		List<Basket_OptionDTO> oList = new ArrayList<>();
		if(optNos.size() != optNames.size()) throw new IndexOutOfBoundsException("배열의 갯수가 맞이 않음");
		for(int i = 0; i < optNos.size(); i++){
			Basket_OptionDTO oDTO = new Basket_OptionDTO();
			oDTO.setOpt_no(optNos.get(i));
			oDTO.setReg_user_no(userNo);
			oDTO.setOpt_name(optNames.get(i));
			oList.add(oDTO);
		}
		int insertBaseket = basketMapper.insertCustomerAddBasekt(bDTO);
		int insertBasketOption = basketMapper.insertCustormerBaksetOption(oList); 
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
