package co.kr.petopia.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.service.MemberSecurtiyService;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.utils.PageVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.FileUploadVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	MemberSecurtiyService memberSecurtiyService;

	@GetMapping("/main")
	public String adminMain(Model model) {
		
		Map<String, Object> statisticsMemberMap = new LinkedHashMap<>();
		
		LinkedList<MemberVO> getStatisticsMemberCount = adminService.getStatisticsMemberCount();
		getStatisticsMemberCount.get(0).getStatistics_join_count();
		statisticsMemberMap.get("statistics_join_count");
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		MemberVO nullVO = new MemberVO();
		ArrayList<String> mainStatistics_join_day = new ArrayList<>();
		

		
		if(getStatisticsMemberCount.size() != 5) {
			
			nullVO.setStatistics_join_count(0);
			for(int i = getStatisticsMemberCount.size() ;  i < 5 ; i++) {
			getStatisticsMemberCount.add(i, nullVO);
				
			}
		}
	
		for(int i =0 ;  i < 5; i++) {
			cal.add(Calendar.DATE, -1);
			mainStatistics_join_day.add(sdf.format(cal.getTime()));
			statisticsMemberMap.put("statistics_join_count" , getStatisticsMemberCount.get(i).getStatistics_join_count());
		}
		
	
		
		model.addAttribute("mainStatistics_join_day" , mainStatistics_join_day);
		model.addAttribute("getStatisticsMemberCount", getStatisticsMemberCount);
		
//		//금일매출
//		adminService.getTodayIncome();
//		//금일 기부금
//		adminService.getTodayDonation();
//		//신규가입수
//		adminService.getTodayMemberList(); 
//		//현재주문
//		adminService.getCurrentOrderList(); 
//		//교환&환불 신청
//		adminService.getRefundList(); 
//		//총주문량
//		adminService.getOrderCount(null); 
//		//회원수 그래프
//		adminService.getTotalMemberCount(null); 
//		//MY_GENDER 비율
//		
//		//미처리 주문

		return "admin/adminmain";
	}

	// 회원리스트(페이징,principal)
	@GetMapping("/member")
	public String getMemberList(Model model, Criteria cri, Authentication authenticate) {
		SecurityContextHolder.getContext().getAuthentication();

		String username = (String) authenticate.getPrincipal();
		String userpassword = (String) authenticate.getCredentials();

		log.info("username : " + username);
		log.info("password " + userpassword);

		log.info("getMemberList().." + cri);

		int totalMember = adminService.getTotalMemberCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalMember));

		model.addAttribute("memberList", adminService.getMemberListWithPaging(cri));
		return "/admin/memberList";
	}

	// 상품목록(페이징)
	@GetMapping("/product")
	public String productPage(Model model, Criteria cri) {

		int totalProduct = adminService.getTotalProductCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalProduct));

		model.addAttribute("productList", adminService.getProductListWithPaging(cri));

		return "admin/productList";

	}

	// 상품 검색필터
	@ResponseBody
	@PostMapping(value = "/product", consumes = "application/json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<ProductVO>> selectOptionProductList(@RequestBody Map<String, Object> options,
			Criteria cri) {
		ResponseEntity<String> entity = null;
		HashMap<String, Object> optionMap = new HashMap<String, Object>();

//		int totalProduct = adminService.getTotalMemberCount(cri);
//		result1.put("pageMaker", new PageVO(cri, totalProduct));
//		result1.put("productList", adminService.getProductListWithPaging(cri));

		String product_stock = (String) options.get("product_stock");
		String product_price = (String) options.get("product_price");
		optionMap.put("product_stock", product_stock);
		optionMap.put("product_price", product_price);

		log.info("options : " + options);
		log.info("options : " + options.get("product_price"));

		List<ProductVO> productList = adminService.getSelectOptionList(optionMap);

		return new ResponseEntity<>(productList, HttpStatus.OK);
	}

	// 총 주문수, 페이징 가져감
	@GetMapping("/order")
	public String orderPage(Model model, Criteria cri) {

		int totalOrderList = adminService.getOrderCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalOrderList));

		model.addAttribute("orderList", adminService.getOrderListWithPaging(cri));

		return "admin/orderList";
	}

	// 총 배송수, 페이징 가져감
	@GetMapping("/delivery")
	public String deliveryPage(Model model, Criteria cri) {

		int totalDeliveryList = adminService.getOrderCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalDeliveryList));

		model.addAttribute("deliveryList", adminService.getDeliveryListWithPaging(cri));

		return "admin/deliveryList";
	}

	// 배송 검색필터
	@ResponseBody
	@PostMapping(value = "/delivery", consumes = "application/json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<DeliveryVO>> selectOptionDeliveryList(@RequestBody Map<String, Object> options,
			Criteria cri) {
		ResponseEntity<String> entity = null;
		HashMap<String, Object> optionMap = new HashMap<String, Object>();

		String delivery_state = (String) options.get("delivery_state");
		String delivery_refund = (String) options.get("delivery_refund");
		String is_member = (String) options.get("is_member");

		optionMap.put("delivery_state", delivery_state);
		optionMap.put("delivery_refund", delivery_refund);
		optionMap.put("is_member", is_member);
		optionMap.put("total_deliveryList", adminService.getDeliveryList());

		log.info("options : " + options);
		log.info("options : " + options.get("product_price"));

		List<DeliveryVO> deliveryList = adminService.selectOptionDeliveryList(optionMap);

		return new ResponseEntity<>(deliveryList, HttpStatus.OK);
	}

	// 주문 검색필터
	@ResponseBody
	@PostMapping(value = "/order", consumes = "application/json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<OrderVO>> selectOptionOrderList(@RequestBody Map<String, Object> options,
			Criteria cri) {
		
		ResponseEntity<String> entity = null;
		HashMap<String, Object> optionMap = new HashMap<String, Object>();

		String order_date = (String) options.get("order_date");
		String deposit = (String) options.get("deposit");

		optionMap.put("order_date", order_date);
		optionMap.put("deposit", deposit);
		optionMap.put("total_order_list", adminService.getOrderList());

		log.info("options : " + options);
		log.info("options : " + options.get("product_price"));

		List<OrderVO> orderList = adminService.selectOptionOrderList(optionMap);

		return new ResponseEntity<>(orderList, HttpStatus.OK);
	}

	@GetMapping("/donation")
	public String donationPage(Model model, Criteria cri) {

		int totalDonationList = adminService.getDonationCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalDonationList));

		model.addAttribute("donationList", adminService.getDonationWithPaging(cri));

		return "admin/donationList";
	}

	@GetMapping("/QnA")
	public String QnAPage(Model model, Criteria cri) {

		int totalQnAList = adminService.getQnACount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalQnAList));

		model.addAttribute("QnAList", adminService.getQnAListWithPaging(cri));

		return "admin/QnAList";
	}

	@GetMapping("/statistics")
	public String statisticsPage() {

		return "admin/statisticsList";
	}

	// 상품정보
	public String getProductList(Model model, int product_idx) {

		return "/admin/productList";
	}

	// 배송정보
	public String getDeliveryList(Model model, int delivery_idx) {

		return "/admin/DeliveryList";
	}

	// 기부정보
	public String getDonationList(Model model) {

		return "/admin/donationList";
	}

	// 회원수 통계
	public String getMemberStatistics(Model model) {

		return "/admin/statistics";
	}

	public String getProductStatistics(Model model) {

		return "/admin/statistics";

	}

	// 기부액 통계
	public String getDonationStatistics(Model model) {

		return "/admin/statistics";
	}

	// 금일매출
	public String getTodayIncome(Model model) {

		return "/admin/DonationList";
	}

	// 금일 기부금
	public String getTodayDonation(Model model) {

		return "/admin/DonationList";
	}

	// 신규 가입수
	public String getTodayMemberList(Model model) {

		adminService.getTodayMemberList();

		return "/admin/DonationList";
	}

	// 현재주문수
	public String getCurrentOrderList(Model model) {

		return "/admin/DonationList";
	}

	// 교환,환불 신청
	public String getRefundList(Model model) {

		return "/admin/DonationList";
	}

	// 총 주문량
	public String getTotalOrderList(Model model) {

		return "/admin/DonationList";
	}

	// 미처리주문
	public String getUnprocessedOrderList(Model model) {

		return "/admin/DonationList";
	}

	// 총 회원수
	public String getTotalMemberList() {

		return "/admin/DonationList";
	}

	/* 상품 등록 관련 */

	// 상품 등록 겟
	@GetMapping("/product/insert")
	public String insertProduct(ProductVO productVO) {
		
		
		
		return "/product/insertProduct";
	}
	//상품 등록 post
	@PostMapping("/product/insert_pro")
	public String insertProduct_pro(ProductVO productVO, FileUploadVO fileUploadVO,
			 RedirectAttributes redirectAttributes) {
		
	log.info("insert_pro()..");
	log.info("add products : " + productVO);

	if(productVO.getProductVOList() != null) {
		productVO.getProductVOList().forEach( file ->System.out.println(productVO));
	}	
	
	log.info("========================");
	
	
	adminService.insertProduct(productVO);
	redirectAttributes.addFlashAttribute("result", productVO.getProduct_idx());
	
		//상품 메인으로 리다이렉트 
		return "redirect:/admin/product";
	}
	// 상품 삭제
	@PostMapping("admin/product/delete")
	public String deleteProduct(@RequestParam int product_idx , Criteria cri, RedirectAttributes redirectAttributes ) {
		return "admin/deleteProduct";
	}
	// 상품 수정
	public String updateProduct() {
		return "admin/updateProduct";
	}

	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<FileUploadVO>> getAttachList(int product_idx) {
		
		log.info("productVOList " + product_idx);
		
		return new ResponseEntity<>(adminService.findByProduct(product_idx), HttpStatus.OK);
	}
}
