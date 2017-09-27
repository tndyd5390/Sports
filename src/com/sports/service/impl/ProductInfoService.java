package com.sports.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sports.dto.ProdOptionDTO;
import com.sports.dto.ProductFileDTO;
import com.sports.dto.ProductInfoDTO;
import com.sports.persistance.mapper.ProductInfoMapper;
import com.sports.service.IProductInfoService;
import com.sports.util.CmmUtil;

@Service("ProductInfoService")
public class ProductInfoService implements IProductInfoService{
	@Resource(name="ProductInfoMapper")
	private ProductInfoMapper productInfoMapper;

	@Override
	public List<ProductInfoDTO> getCategoryParents() throws Exception {
		return productInfoMapper.getCategoryParents();
	}

	@Override
	public List<ProductInfoDTO> getCategoryChild(ProductInfoDTO pDTO) throws Exception {
		return productInfoMapper.getCategoryChild(pDTO);
	}
	/**
	 *  프로덕트, 메인파일 2 가지 등록 시
	 */
	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		// selectkey 문법으로 방금 insert한 프로덕트의 prod_no를 반환해 줌 
		fDTO.setProd_no(pDTO.getProd_no());
		// 파일 등록을 위해 fDTO에 받아 온 prod_no 를 설정해 줌
		return productInfoMapper.insertProductMainFile(fDTO);
	}

	@Override
	public List<ProductInfoDTO> getProductList() throws Exception {
		return productInfoMapper.getProductList();
	}

	@Override
	public List<ProductInfoDTO> getProductSelectList(ProductInfoDTO pDTO) throws Exception {
		return productInfoMapper.getProductSelectList(pDTO);
	}
	
	/**
	 * 제품 상세 데이터를 가져올 서비스 이다. 옵션이 여러개일수 있기때문에 맵퍼를 두번 호출하여 Map으로 두개의 객체를 return한다.
	 */
	@Override
	public Map<String, Object> getProductDetail(ProductInfoDTO pDTO) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//제품의 상세를 가져온다.
		ProductInfoDTO prodDTO = productInfoMapper.getProductDetail(pDTO);
		if(prodDTO == null){
			prodDTO = new ProductInfoDTO();
		}
		//제품의 옵션을 가져온다. 옵션은 Map형태로 정제한다
		String prodNo = CmmUtil.nvl(pDTO.getProd_no());
		List<ProdOptionDTO> pList = productInfoMapper.getProductOption(prodNo);
		if(pList == null){
			pList = new ArrayList<ProdOptionDTO>();
		}
		Map<String, List<ProdOptionDTO>> pMap = new HashMap<String, List<ProdOptionDTO>>();
		if(pList.size() != 0){
			for(ProdOptionDTO optDTO : pList){
				if(pMap.containsKey(optDTO.getCode_name())){
					List<ProdOptionDTO> tmp = pMap.get(optDTO.getCode_name());
					tmp.add(optDTO);
					pMap.put(optDTO.getCode_name(), tmp);
				}else{
					List<ProdOptionDTO> newProdOptList = new ArrayList<ProdOptionDTO>();
					newProdOptList.add(optDTO);
					pMap.put(optDTO.getCode_name(), newProdOptList);
				}
			}
		}
		//return할 객체에 담는다.
		resultMap.put("prodDetail", prodDTO);
		resultMap.put("prodOpt", pMap);
		
		//return 시킨다.
		return resultMap;
	}
	/**
	 * 프로덕트, 메인파일, 디테일파일 3 가지 등록 시
	 */
	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, ProductFileDTO fdDTO) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		// selectkey 문법으로 방금 insert한 프로덕트의 prod_no를 반환해 줌 
		fDTO.setProd_no(pDTO.getProd_no());
		// 파일 등록을 위해 fDTO에 받아 온 prod_no 를 설정해 줌
		fdDTO.setProd_no(pDTO.getProd_no());
		// 디테일파일 등록을 위해 fDTO에 받아 온 prod_no 를 설정해 줌
		productInfoMapper.insertProductMainFile(fDTO);
		return productInfoMapper.insertProductDetailFile(fdDTO);
	}

	@Override
	public List<ProductInfoDTO> getSelectOption() throws Exception {
		return productInfoMapper.getSelectOption();
	}
	/**
	 *  프로덕트, 메인파일, 디테일파일, 옵션 4 가지 등록 시
	 */
	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, ProductFileDTO fdDTO, List<ProductInfoDTO> optList) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		// selectkey 문법으로 방금 insert한 프로덕트의 prod_no를 반환해 줌 
		fDTO.setProd_no(pDTO.getProd_no());
		// 파일 등록을 위해 fDTO에 받아 온 prod_no 를 설정해 줌
		fdDTO.setProd_no(pDTO.getProd_no());
		// 디테일파일 등록을 위해 fDTO에 받아 온 prod_no 를 설정해 줌
		List<ProductInfoDTO> setList = new ArrayList<ProductInfoDTO>();
		// List에 담겨있는 옵션들에 prod_no를 설정해야 하기 때문에 다시 담을 새로운 리스트를 생성
		for(ProductInfoDTO optDTO : optList){
			ProductInfoDTO setDTO = new ProductInfoDTO();
			// prod_no를 가진 새로운 DTO를 만들기 위해 DTO 객체 생성
			setDTO.setOpt_kind(optDTO.getOpt_kind());
			setDTO.setOpt_name(optDTO.getOpt_name());
			setDTO.setOpt_price(optDTO.getOpt_price());
			setDTO.setProd_no(pDTO.getProd_no());
			setDTO.setReg_user_no(optDTO.getReg_user_no());
			// 받아온 prod_no를 담아 줌
			setList.add(setDTO);
			// setList에 prod_no를 담은 DTO를 넣어 줌
		}
		productInfoMapper.insertProductMainFile(fDTO);
		productInfoMapper.insertProductOption(setList);
		// prod_no를 가진 setList를 매퍼로 넘김
		return productInfoMapper.insertProductDetailFile(fdDTO);
	}
	/**
	 *  프로덕트, 메인파일, 옵션 3 가지 등록 시
	 */
	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, List<ProductInfoDTO> optList) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		// selectkey 문법으로 방금 insert한 프로덕트의 prod_no를 반환해 줌 
		fDTO.setProd_no(pDTO.getProd_no());
		// 파일 등록을 위해 fDTO에 받아 온 prod_no 를 설정해 줌
		List<ProductInfoDTO> setList = new ArrayList<ProductInfoDTO>();
		// List에 담겨있는 옵션들에 prod_no를 설정해야 하기 때문에 다시 담을 새로운 리스트를 생성
		for(ProductInfoDTO optDTO : optList){
			ProductInfoDTO setDTO = new ProductInfoDTO();
			// prod_no를 가진 새로운 DTO를 만들기 위해 DTO 객체 생성
			setDTO.setOpt_kind(optDTO.getOpt_kind());
			setDTO.setOpt_name(optDTO.getOpt_name());
			setDTO.setOpt_price(optDTO.getOpt_price());
			setDTO.setProd_no(pDTO.getProd_no());
			setDTO.setReg_user_no(optDTO.getReg_user_no());
			// 받아온 prod_no를 담아 줌
			setList.add(setDTO);
			// setList에 prod_no를 담은 DTO를 넣어 줌
		}
		productInfoMapper.insertProductOption(setList);
		// prod_no를 가진 setList를 매퍼로 넘김
		return productInfoMapper.insertProductMainFile(fDTO);
	}

	@Override
	public void deleteOpt(ProdOptionDTO poDTO) throws Exception {
		productInfoMapper.deleteOpt(poDTO);
	}

	@Override
	public void insertMainFile(ProductFileDTO fDTO) throws Exception {
		productInfoMapper.insertProductMainFile(fDTO);
	}

	@Override
	public void insertDetailFile(ProductFileDTO fdDTO) throws Exception {
		productInfoMapper.insertProductDetailFile(fdDTO);
	}

	@Override
	public void insertOption(List<ProductInfoDTO> optList) throws Exception {
		productInfoMapper.insertProductOption(optList);
	}

	@Override
	public void updateProduct(ProductInfoDTO pDTO) throws Exception {
		productInfoMapper.updateProduct(pDTO);
	}

	@Override
	public void deleteFile(ProductFileDTO pDTO) throws Exception {
		productInfoMapper.deleteFile(pDTO);
	}

	@Override
	public void deleteProduct(String prodNo) throws Exception {
		productInfoMapper.deleteProduct(prodNo);
		productInfoMapper.deleteOptProdNo(prodNo);
		List<ProductFileDTO> fList = new ArrayList<ProductFileDTO>();
		fList = productInfoMapper.getFileInfo(prodNo);
		
		for(ProductFileDTO fDTO : fList){
			String fileSrc = "C:\\sportspace\\Sports\\WebContent\\"+fDTO.getSrc_filename();
			File file = new File(fileSrc);
			if(file.exists()==true){
				file.delete();
			}
		}
		productInfoMapper.deleteFileProdNo(prodNo);
	}

	@Override
	public List<ProductInfoDTO> getMoreProdList(int readMore) throws Exception {
		return productInfoMapper.getMoreProdList(readMore);
	}

	@Override
	public List<ProductInfoDTO> getSelectMoreProdList(ProductInfoDTO pDTO) throws Exception {
		return productInfoMapper.getSelectMoreProdList(pDTO);
	}
}
