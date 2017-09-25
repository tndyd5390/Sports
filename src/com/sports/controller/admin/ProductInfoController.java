package com.sports.controller.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sports.dto.ProdOptionDTO;
import com.sports.dto.ProductFileDTO;
import com.sports.dto.ProductInfoDTO;
import com.sports.service.IProductInfoService;
import com.sports.util.CmmUtil;

@Controller
public class ProductInfoController {
	private Logger log = Logger.getLogger(this.getClass());
	
	private String filePath = "C:\\sportspace\\Sports\\WebContent\\upload\\product_file\\";
	
	@Resource(name="ProductInfoService")
	private IProductInfoService productInfoService;
	
	@RequestMapping(value="productList")
	public String productList(Model model)throws Exception{
		log.info(this.getClass() + " productList Start!!");
		
		List<ProductInfoDTO> pList = new ArrayList<ProductInfoDTO>();
		
		pList = productInfoService.getCategoryParents();
		
		model.addAttribute("pList", pList);
		pList = null;
		log.info(this.getClass() + " productList End!!");
		return "product/sports_goods_list";
	}
	
	@RequestMapping(value="productAll")
	public @ResponseBody List<ProductInfoDTO> productAll() throws Exception{
		log.info(this.getClass() + " productAll Start!!");
		
		List<ProductInfoDTO> pList = new ArrayList<ProductInfoDTO>();
		
		pList = productInfoService.getProductList();
		
		
		log.info(this.getClass() + " productAll End!!");
		return pList;
	}
	@RequestMapping(value="productSelect")
	public @ResponseBody List<ProductInfoDTO> productSelect(@RequestParam("pNo") String parentsNo) throws Exception{
		log.info(this.getClass() + " productSelect Start!!");

		ProductInfoDTO pDTO = new ProductInfoDTO();
		pDTO.setParents_no(parentsNo);
		
		List<ProductInfoDTO> pList = new ArrayList<ProductInfoDTO>();
		pList = productInfoService.getProductSelectList(pDTO);
		
		log.info(this.getClass() + " productSelect End!!");
		return pList;
	}
	
	@RequestMapping(value="productReg")
	public String productReg(Model model) throws Exception{
		log.info(this.getClass() + " productReg Start!!");
		
		List<ProductInfoDTO> pList = new ArrayList<ProductInfoDTO>();		
		pList = productInfoService.getCategoryParents();
		
		model.addAttribute("pList", pList);
		log.info(this.getClass() + " productReg End!!");
		return "product/sports_goods_reg";
	}
	
	@RequestMapping(value="selectParents")
	public @ResponseBody List<ProductInfoDTO> selectParents(@RequestParam(value="parents") String parents)throws Exception{
		log.info(this.getClass() + " selectParents Start!!");
		
		log.info("parents_no : "+ parents);
		ProductInfoDTO pDTO = new ProductInfoDTO();
		pDTO.setParents_no(parents);
		List<ProductInfoDTO> pList = new ArrayList<ProductInfoDTO>();
		pList = productInfoService.getCategoryChild(pDTO);
		
		log.info(this.getClass() + " selectParents End!!");
		return pList;
	}
	@RequestMapping(value="productRegProc")
	public String productRegProc(HttpServletRequest req, Model model, @RequestParam("main_file") MultipartFile file) throws Exception{
		log.info(this.getClass() + " productRegProc Start!!");
		
		String prodName = CmmUtil.nvl(req.getParameter("product_name"));
		String prodPrice = CmmUtil.nvl(req.getParameter("product_price"));
		String prodContents = CmmUtil.nvl(req.getParameter("product_contents"));
		String categoryNo = CmmUtil.nvl(req.getParameter("category_no"));
		log.info("--------product---------");
		log.info("prodName : " +prodName);
		log.info("prodPrice : " +prodPrice);
		log.info("prodContents : " +prodContents);
		log.info("categoryNo : " +categoryNo);
		log.info("--------product---------");
		String newName = "";
		String orgName = file.getOriginalFilename();
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
		String extension = orgName.substring(orgName.indexOf("."), orgName.length());
		newName = filePath + now + extension;
		File newFile = new File(newName);
		file.transferTo(newFile);
		log.info("--------file---------");
		log.info("filePath : "+filePath);
		log.info("orgName : "+orgName);
		log.info("newName : "+now);
		log.info("extension : "+extension);
		log.info("fullName : "+newName);
		log.info("--------file---------");
		
		ProductInfoDTO pDTO = new ProductInfoDTO();
		ProductFileDTO fDTO = new ProductFileDTO();
		newName = "upload\\product_file\\"+now+extension;
		pDTO.setProd_name(prodName);
		pDTO.setProd_price(prodPrice);
		pDTO.setProd_contents(prodContents);
		pDTO.setCategory_no(categoryNo);
		fDTO.setOrg_filename(orgName);
		fDTO.setFile_path(filePath);
		fDTO.setSrc_filename(newName);
		
		int res = -1;
		res = productInfoService.insertProduct(pDTO, fDTO);
		
		if(res != 0){
			model.addAttribute("msg", "등록 성공!");
		}else{
			model.addAttribute("msg", "등록 실패!");
		}
		model.addAttribute("url", "productList.do");
		
		pDTO = null;
		fDTO = null;
		log.info(this.getClass() + " productRegProc End!!");
		return "alert/alert";
	}
	
	@RequestMapping(value="productDetail")
	public String productDetail(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass() + ".productDetail start!!!");
		
		//가져올 제품의 번호
		String prodNo = CmmUtil.nvl(req.getParameter("pNo"));
		log.info(this.getClass() + ".productDetail prodNo : " + prodNo);
		
		//service를 호출하기 위해 DTO생성
		ProductInfoDTO pDTO = new ProductInfoDTO();
		pDTO.setProd_no(prodNo);
		
		//service호출
		Map<String, Object> pMap = productInfoService.getProductDetail(pDTO);
		if(pMap == null){
			pMap = new HashMap<String, Object>();
		}
		
		log.info(((Map<String, List<ProdOptionDTO>>)pMap.get("prodOpt")).size());
		log.info(((ProductInfoDTO)pMap.get("prodDetail")).getProd_name());
		
		//model에 올리기
		model.addAttribute("pDTO", (ProductInfoDTO)pMap.get("prodDetail"));
		model.addAttribute("pMap", (Map<String, List<ProdOptionDTO>>)pMap.get("prodOpt"));
		
		//null 처리
		prodNo = null;
		pDTO = null;
		pMap = null;
		log.info(this.getClass() + ".productDetail end!!!");
		
		/**
		 * 기존의 코드
		 * 	log.info(this.getClass() + " productDetail Start!!");
		 *	String prodNo = CmmUtil.nvl(req.getParameter("pNo"));
		 *	log.info("prodNo : " + prodNo);
		 *	ProductInfoDTO pDTO = new ProductInfoDTO();
		 *	pDTO.setProd_no(prodNo);
		 *	pDTO = productInfoService.getProductDetail(pDTO);
		 *
		 *	model.addAttribute("pDTO", pDTO);
		 *	pDTO = null;
		 *	log.info(this.getClass() + " productDetail End!!");
		 */
		return "product/sports_goods_detail";
	}
}