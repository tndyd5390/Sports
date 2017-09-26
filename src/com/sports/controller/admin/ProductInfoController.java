package com.sports.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.lf5.viewer.configure.MRUFileManager;
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
	@RequestMapping(value="selectOpt")
	public @ResponseBody List<ProductInfoDTO> selectOpt()throws Exception{
		log.info(this.getClass() + " selectOpt Start!!");
		
			
		List<ProductInfoDTO> pList = new ArrayList<ProductInfoDTO>();	
		
		pList = productInfoService.getSelectOption();
		
		log.info(this.getClass() + " selectOpt End!!");
		return pList;
	}
	/**
	 *  새로운 프로덕트를 생성하기 위한 컨트롤러 임
	 *  단순 text값을 삽입하는 구조가 아닌, 다중 파일 업로드, 다중 옵션을 가지기 때문에
	 *  파일을 업로드 하지 않을 때, 옵션을 등록하지 않을 때 같은 예외를 처리 해줘야 함
	 * @param req
	 * @param model
	 * @param files
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="productRegProc")
	public String productRegProc(HttpServletRequest req, Model model, @RequestParam("files") MultipartFile[] files ) throws Exception{
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
		// 프로덕트 파라미터
		String optParents[] = req.getParameterValues("opt_parents");
		// opt_parents 값 배열로 받아 옴 
		String newName = "";
		String orgName = files[0].getOriginalFilename();
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
		String extension = orgName.substring(orgName.indexOf("."), orgName.length());
		newName = filePath + "MAIN_" +now + extension;
		File newFile = new File(newName);
		files[0].transferTo(newFile);
		log.info("--------mainfile---------");
		log.info("filePath : "+filePath);
		log.info("orgName : "+orgName);
		log.info("newName : "+now);
		log.info("extension : "+extension);
		log.info("fullName : "+newName);
		log.info("--------mainfile---------");
		// 메인파일 등록
		ProductInfoDTO pDTO = new ProductInfoDTO();
		ProductFileDTO fDTO = new ProductFileDTO();
		newName = "upload\\product_file\\MAIN_"+now+extension;
		// WebContents 를 루트로 하는 경로로 DB에 삽입
		pDTO.setProd_name(prodName);
		pDTO.setProd_price(prodPrice);
		pDTO.setProd_contents(prodContents);
		pDTO.setCategory_no(categoryNo);
		fDTO.setOrg_filename(orgName);
		fDTO.setFile_path(filePath);
		fDTO.setSrc_filename(newName);
		int res = -1;
		// Insert 성공시 1 반환이기 때문에 성공 여부를 판단 하기 위해 res 값을 int로 설정
		if(files[1].getSize()!=0){
			// 등록시 메인파일, 디테일파일 두개를 받는데 디테일 파일의 사이즈가 0이 아닐때 (파일이 존재 할 때) 실행 함
			String detailOrgName = files[1].getOriginalFilename();
			String detailExtension = detailOrgName.substring(detailOrgName.indexOf("."), detailOrgName.length());
			String detailName = filePath + "DETAIL_" +now + detailExtension;
			File detailFile = new File(detailName);
			files[1].transferTo(detailFile);
			log.info("--------detailfile---------");
			log.info("filePath : "+filePath);
			log.info("detailOrgName : "+detailOrgName);
			log.info("detailExtension : "+detailExtension);
			log.info("detailName : "+detailName);
			log.info("--------detailfile---------");
			ProductFileDTO fdDTO = new ProductFileDTO();
			detailName = "upload\\product_file\\DETAIL_"+now+detailExtension;
			fdDTO.setFile_path(filePath);
			fdDTO.setOrg_filename(detailOrgName);
			fdDTO.setSrc_filename(detailName);
			// 디테일 파일 등록
			if(optParents[0].equals("0")){
				// optParents 첫 번째 값이 0이면 옵션을 등록하지 않은 것임
				res = productInfoService.insertProduct(pDTO, fDTO, fdDTO);
				// 프로덕트, 메인파일, 디테일파일 3가지를 서비스로 넘김
				fdDTO = null;
			}else{
				// 옵션 값이 있기 때문에 옵션을 등록해야 함
				String optName[] = req.getParameterValues("opt_name");
				String optPrice[] = req.getParameterValues("opt_price");
				// 옵션은 2개 이상일 수 있기 때문에 배열로 받아옴
				List<ProductInfoDTO> optList = new ArrayList<ProductInfoDTO>();
				// 한번에 서비스로 넘기기 위해 리스트를 생성해 줌
				log.info("-----option-----");
				for(int i=0;i<optName.length;i++){
					// 반복문으로 배열에 있는 값들을 DTO에 설정해 줌
					ProductInfoDTO optDTO = new ProductInfoDTO();
					optDTO.setOpt_name(optName[i]);
					optDTO.setOpt_kind(optParents[i]);
					optDTO.setOpt_price(optPrice[i]);
					optList.add(optDTO);
					// 미리 생성해 둔 리스트에 생성 한 DTO를 넣어 줌
					log.info("optName : "+optName[i]);
					log.info("optKind : "+optParents[i]);
					log.info("optPrice : "+optPrice[i]);
				}
				log.info("-----option-----");
				res = productInfoService.insertProduct(pDTO, fDTO, fdDTO, optList);
				// 프로덕트, 메인파일, 디테일파일, 옵션리스트 4가지를 서비스로 넘김
				fdDTO = null;
				optList = null;
			}
		}else{
			if(optParents[0].equals("0")){
				// 옵션, 디테일 파일 없음
				res = productInfoService.insertProduct(pDTO, fDTO);
				// 프로덕트, 메인파일만 서비스로 넘김
			}else{
				// 디테일파일은 없지만 옵션은 등록 함
				String optName[] = req.getParameterValues("opt_name");
				String optPrice[] = req.getParameterValues("opt_price");
				List<ProductInfoDTO> optList = new ArrayList<ProductInfoDTO>();
			
				log.info("-----option-----");
				for(int i=0;i<optName.length;i++){
					ProductInfoDTO optDTO = new ProductInfoDTO();
					optDTO.setOpt_name(optName[i]);
					optDTO.setOpt_kind(optParents[i]);
					optDTO.setOpt_price(optPrice[i]);
					optList.add(optDTO);
					log.info("optName : "+optName[i]);
					log.info("optKind : "+optParents[i]);
					log.info("optPrice : "+optPrice[i]);
				}
				log.info("-----option-----");

				res = productInfoService.insertProduct(pDTO, fDTO, optList);
				// 프로덕트, 메인파일, 옵션리스트 3가지를 서비스로 넘김
				optList = null;
			}
		}
		if(res != 0){
			// Insert 성공이면 1 반환
			model.addAttribute("msg", "등록 성공!");
		}else{
			// Insert 실패라면 0 반환
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
	/**
	 *  프로덕트의 내용을 새로 업데이트 시키기 위해
	 *  input text 타입의 html에 기존의 detail 내용을 호출해 주는 컨트롤러 임
	 * @param req
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="productUpdate")
	public String updateProd(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + " updateProd Start!!");
		
		String prodNo = CmmUtil.nvl(req.getParameter("pNo"));
		List<ProductInfoDTO> pList = new ArrayList<ProductInfoDTO>();
		pList = productInfoService.getCategoryParents();
		

		log.info("prodNo : " +prodNo);
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
		model.addAttribute("pList", pList);
		
		//null 처리
		prodNo = null;
		pDTO = null;
		pMap = null;
		pList = null;
		log.info(this.getClass() + " updateProd End!!");
		return "product/sports_goods_update";
	}
	/**
	 *  프로덕트 업데이트를 실제 처리 해 주는 컨트롤러 임
	 *  프로덕트 생성때와 같은 파일을 수정 할 때, 옵션을 수정 할 때 등 예외를 처리해야 함
	 *  여기서는 옵션과 파일은 수정 = (삭제 + 생성) 라는 공식으로 구현 하였음
	 *  파일과 옵션을 수정할 때 기존의 것을 지우고 새롭게 insert 하는 형식으로 구현
	 * @param req
	 * @param session
	 * @param files
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("productUpdateProc")
	public String productUpdateProc(HttpServletRequest req, HttpSession session, @RequestParam("files") MultipartFile[] files) throws Exception{
		log.info(this.getClass() + " productUpdateProc Start!!");
		String prodNo = CmmUtil.nvl(req.getParameter("pNo"));
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
		String optParents[] = req.getParameterValues("opt_parents");
		ProductInfoDTO pDTO = new ProductInfoDTO();
		pDTO.setProd_no(prodNo);
		pDTO.setProd_name(prodName);
		pDTO.setProd_price(prodPrice);
		pDTO.setProd_contents(prodContents);
		pDTO.setCategory_no(categoryNo);
		// 위는 생성 컨트롤러와 동일 한 내용
		
		String mainFileNo = CmmUtil.nvl(req.getParameter("mainFileNo"));
		String detailFileNo = CmmUtil.nvl(req.getParameter("detailFileNo"));
		String mainSrc = "C:\\sportspace\\Sports\\WebContent\\"+CmmUtil.nvl(req.getParameter("mainFileSrc"));
		String detailSrc = "C:\\sportspace\\Sports\\WebContent\\"+CmmUtil.nvl(req.getParameter("detailFileSrc"));
		// 파일의 삭제와 생성을 모듈화 했기 때문에 매개변수로 넘길 값을들 설정 해 줌
		// 필요한 값은 기존에 값이 있다면, 메인파일의 번호와 실제 경로, 디테일파일의 번호와 실제 경로가 필요 함
		
		if(optParents==null){
			// 옵션 수정이 없을 때
			fileUpdate(files, prodNo, mainFileNo, detailFileNo, mainSrc, detailSrc);
		}else{
			// 옵션 수정이 있을때 (옵션을 새로 생성 할 때)
			fileUpdate(files, prodNo, mainFileNo, detailFileNo, mainSrc, detailSrc);
			String optName[] = req.getParameterValues("opt_name");
			String optPrice[] = req.getParameterValues("opt_price");
			List<ProductInfoDTO> optList = new ArrayList<ProductInfoDTO>();
			log.info("-----option-----");
			for(int i=0;i<optName.length;i++){
				ProductInfoDTO optDTO = new ProductInfoDTO();
				optDTO.setProd_no(prodNo);
				optDTO.setOpt_name(optName[i]);
				optDTO.setOpt_kind(optParents[i]);
				optDTO.setOpt_price(optPrice[i]);
				optList.add(optDTO);
				log.info("optName : "+optName[i]);
				log.info("optKind : "+optParents[i]);
				log.info("optPrice : "+optPrice[i]);
			}
			log.info("-----option-----");
			productInfoService.insertOption(optList);
		}
		log.info(this.getClass() + " productUpdateProc End!!");
		return "redirect:productDetail.do?pNo="+prodNo;
	}
	/**
	 *  프로덕트 업데이트 컨트롤러에서 기존에 있는 파일을 지우기 위해 사용하는 메소드
	 * @param fileNo
	 * @param fileSrc
	 * @throws Exception
	 */
	public void fileDelete(String fileNo, String fileSrc) throws Exception{
		// 삭제를 위해 파일번호와, 실제경로를 매개변수로 받아 옴
		if(!fileNo.equals("") || fileNo!=null){
			// 파일번호가 null 값이 아닐 때 실행 됨
			ProductFileDTO pfDTO = new ProductFileDTO();
			pfDTO.setFile_no(fileNo);
			productInfoService.deleteFile(pfDTO);
			// DB에있는 파일정보를 file_no로 delete
			File file = new File(fileSrc);
			// 실제경로를 file객체로 만듦
			if(file.exists()==true){
				// 실제파일이 있다면
				file.delete();
				// 실제파일 삭제
			}
		}
	}
	/**
	 *  프로덕트 업데이트 컨트롤러에서 새로운 파일을 생성하기 위해 사용하는 메소드
	 *  내용은 프로덕트 생성 컨트롤러의 파일 생성과 같음
	 * @param files
	 * @param prodNo
	 * @param mainFileNo
	 * @param detailFileNo
	 * @param mainSrc
	 * @param detailSrc
	 * @throws Exception
	 */
	public void fileUpdate(MultipartFile files[], String prodNo, String mainFileNo, String detailFileNo, String mainSrc, String detailSrc) throws Exception{
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
		
		if(files[0].getSize() != 0){
			// 메인파일이 새로 등록 될 때
			fileDelete(mainFileNo, mainSrc);
			String newName = "";
			String orgName = files[0].getOriginalFilename();
			String extension = orgName.substring(orgName.indexOf("."), orgName.length());
			newName = filePath + "MAIN_" +now + extension;
			File newFile = new File(newName);
			files[0].transferTo(newFile);
			log.info("--------mainfile---------");
			log.info("filePath : "+filePath);
			log.info("orgName : "+orgName);
			log.info("newName : "+now);
			log.info("extension : "+extension);
			log.info("fullName : "+newName);
			log.info("--------mainfile---------");
			ProductFileDTO fDTO = new ProductFileDTO();
			newName = "upload\\product_file\\MAIN_"+now+extension;
			fDTO.setOrg_filename(orgName);
			fDTO.setFile_path(filePath);
			fDTO.setSrc_filename(newName);
			fDTO.setProd_no(prodNo);
			productInfoService.insertMainFile(fDTO);
		}
		if(files[1].getSize() != 0){
			// 디테일 파일이 새로 등록 될 때
			fileDelete(detailFileNo, detailSrc);
			String detailOrgName = files[1].getOriginalFilename();
			String detailExtension = detailOrgName.substring(detailOrgName.indexOf("."), detailOrgName.length());
			String detailName = filePath + "DETAIL_" +now + detailExtension;
			File detailFile = new File(detailName);
			files[1].transferTo(detailFile);
			log.info("--------detailfile---------");
			log.info("filePath : "+filePath);
			log.info("detailOrgName : "+detailOrgName);
			log.info("detailExtension : "+detailExtension);
			log.info("detailName : "+detailName);
			log.info("--------detailfile---------");
			ProductFileDTO fdDTO = new ProductFileDTO();
			detailName = "upload\\product_file\\DETAIL_"+now+detailExtension;
			fdDTO.setFile_path(filePath);
			fdDTO.setOrg_filename(detailOrgName);
			fdDTO.setSrc_filename(detailName);
			fdDTO.setProd_no(prodNo);
			productInfoService.insertDetailFile(fdDTO);
		}
	}
	/**
	 *  프로덕트 업데이트에서 옵션을 업데이트 하기 위해
	 *  기존의 옵션을 AJAX로 지우기 위한 컨트롤러
	 * @param optNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="deleteOpt")
	public @ResponseBody String deleteOpt(@RequestParam(value="optNo") String optNo) throws Exception{
		log.info(this.getClass() + " deleteOpt Start!!");
		
		ProdOptionDTO poDTO = new ProdOptionDTO();
		poDTO.setOpt_no(optNo);
		productInfoService.deleteOpt(poDTO);
		
		
		log.info(this.getClass() + " deleteOpt End!!");
		return "success";
	}
}