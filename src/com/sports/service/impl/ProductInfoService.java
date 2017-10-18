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
	 *  ���δ�Ʈ, �������� 2 ���� ��� ��
	 */
	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		// selectkey �������� ��� insert�� ���δ�Ʈ�� prod_no�� ��ȯ�� �� 
		fDTO.setProd_no(pDTO.getProd_no());
		// ���� ����� ���� fDTO�� �޾� �� prod_no �� ������ ��
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
	 * ��ǰ �� �����͸� ������ ���� �̴�. �ɼ��� �������ϼ� �ֱ⶧���� ���۸� �ι� ȣ���Ͽ� Map���� �ΰ��� ��ü�� return�Ѵ�.
	 */
	@Override
	public Map<String, Object> getProductDetail(ProductInfoDTO pDTO) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//��ǰ�� �󼼸� �����´�.
		ProductInfoDTO prodDTO = productInfoMapper.getProductDetail(pDTO);
		if(prodDTO == null){
			prodDTO = new ProductInfoDTO();
		}
		//��ǰ�� �ɼ��� �����´�. �ɼ��� Map���·� �����Ѵ�
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
		//return�� ��ü�� ��´�.
		resultMap.put("prodDetail", prodDTO);
		resultMap.put("prodOpt", pMap);
		
		//return ��Ų��.
		return resultMap;
	}
	/**
	 * ���δ�Ʈ, ��������, ���������� 3 ���� ��� ��
	 */
	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, ProductFileDTO fdDTO) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		// selectkey �������� ��� insert�� ���δ�Ʈ�� prod_no�� ��ȯ�� �� 
		fDTO.setProd_no(pDTO.getProd_no());
		// ���� ����� ���� fDTO�� �޾� �� prod_no �� ������ ��
		fdDTO.setProd_no(pDTO.getProd_no());
		// ���������� ����� ���� fDTO�� �޾� �� prod_no �� ������ ��
		productInfoMapper.insertProductMainFile(fDTO);
		return productInfoMapper.insertProductDetailFile(fdDTO);
	}

	@Override
	public List<ProductInfoDTO> getSelectOption() throws Exception {
		return productInfoMapper.getSelectOption();
	}
	/**
	 *  ���δ�Ʈ, ��������, ����������, �ɼ� 4 ���� ��� ��
	 */
	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, ProductFileDTO fdDTO, List<ProductInfoDTO> optList) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		// selectkey �������� ��� insert�� ���δ�Ʈ�� prod_no�� ��ȯ�� �� 
		fDTO.setProd_no(pDTO.getProd_no());
		// ���� ����� ���� fDTO�� �޾� �� prod_no �� ������ ��
		fdDTO.setProd_no(pDTO.getProd_no());
		// ���������� ����� ���� fDTO�� �޾� �� prod_no �� ������ ��
		List<ProductInfoDTO> setList = new ArrayList<ProductInfoDTO>();
		// List�� ����ִ� �ɼǵ鿡 prod_no�� �����ؾ� �ϱ� ������ �ٽ� ���� ���ο� ����Ʈ�� ����
		for(ProductInfoDTO optDTO : optList){
			ProductInfoDTO setDTO = new ProductInfoDTO();
			// prod_no�� ���� ���ο� DTO�� ����� ���� DTO ��ü ����
			setDTO.setOpt_kind(optDTO.getOpt_kind());
			setDTO.setOpt_name(optDTO.getOpt_name());
			setDTO.setOpt_price(optDTO.getOpt_price());
			setDTO.setProd_no(pDTO.getProd_no());
			setDTO.setReg_user_no(optDTO.getReg_user_no());
			// �޾ƿ� prod_no�� ��� ��
			setList.add(setDTO);
			// setList�� prod_no�� ���� DTO�� �־� ��
		}
		productInfoMapper.insertProductMainFile(fDTO);
		productInfoMapper.insertProductOption(setList);
		// prod_no�� ���� setList�� ���۷� �ѱ�
		return productInfoMapper.insertProductDetailFile(fdDTO);
	}
	/**
	 *  ���δ�Ʈ, ��������, �ɼ� 3 ���� ��� ��
	 */
	@Override
	public int insertProduct(ProductInfoDTO pDTO, ProductFileDTO fDTO, List<ProductInfoDTO> optList) throws Exception {
		productInfoMapper.insertProduct(pDTO);
		// selectkey �������� ��� insert�� ���δ�Ʈ�� prod_no�� ��ȯ�� �� 
		fDTO.setProd_no(pDTO.getProd_no());
		// ���� ����� ���� fDTO�� �޾� �� prod_no �� ������ ��
		List<ProductInfoDTO> setList = new ArrayList<ProductInfoDTO>();
		// List�� ����ִ� �ɼǵ鿡 prod_no�� �����ؾ� �ϱ� ������ �ٽ� ���� ���ο� ����Ʈ�� ����
		for(ProductInfoDTO optDTO : optList){
			ProductInfoDTO setDTO = new ProductInfoDTO();
			// prod_no�� ���� ���ο� DTO�� ����� ���� DTO ��ü ����
			setDTO.setOpt_kind(optDTO.getOpt_kind());
			setDTO.setOpt_name(optDTO.getOpt_name());
			setDTO.setOpt_price(optDTO.getOpt_price());
			setDTO.setProd_no(pDTO.getProd_no());
			setDTO.setReg_user_no(optDTO.getReg_user_no());
			// �޾ƿ� prod_no�� ��� ��
			setList.add(setDTO);
			// setList�� prod_no�� ���� DTO�� �־� ��
		}
		productInfoMapper.insertProductOption(setList);
		// prod_no�� ���� setList�� ���۷� �ѱ�
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
			String fileSrc = fDTO.getSrc_filename();
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