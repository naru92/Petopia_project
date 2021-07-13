package co.kr.petopia.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.service.MemberSecurtiyService;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.utils.PageVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	MemberSecurtiyService memberSecurtiyService;

	@GetMapping("/main")
	public String adminMain() {

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

	//상품 검색필터
	@ResponseBody
	@PostMapping(value = "/product", consumes = "application/json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<ProductVO>> productList(@RequestBody Map<String, Object> options, Criteria cri) {
		ResponseEntity<String> result = null;
		HashMap<String, Object> result1 = new HashMap<String, Object>();

//		int totalProduct = adminService.getTotalMemberCount(cri);
//		result1.put("pageMaker", new PageVO(cri, totalProduct));
//		result1.put("productList", adminService.getProductListWithPaging(cri));

		String product_stock = (String) options.get("product_stock");
		String product_price = (String) options.get("product_price");
		result1.put("product_stock", product_stock);
		result1.put("product_price", product_price);

		log.info("options : " + options);
		log.info("options : " + options.get("product_price"));

		List<ProductVO> productList = adminService.getSelectOptionList(result1);

		return new ResponseEntity<>(productList, HttpStatus.OK);
	}
	
	//총 주문수, 페이징 가져감
	@GetMapping("/order")
	public String orderPage(Model model, Criteria cri) {
		
		int totalOrderList = adminService.getOrderCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalOrderList));
		
		model.addAttribute("orderList", adminService.getOrderListWithPaging(cri));
		

		return "admin/orderList";
	}
	
	//총 배송수, 페이징 가져감
	@GetMapping("/delivery")
	public String deliveryPage(Model model, Criteria cri) {
		
		int totalDeliveryList = adminService.getOrderCount(cri); 		
		model.addAttribute("pageMaker", new PageVO(cri, totalDeliveryList));
		
		model.addAttribute("deliveryList", adminService.getDeliveryListWithPaging(cri));
		
		return "admin/deliveryList";
	}

	@GetMapping("/donation")
	public String donationPage(Model model , Criteria cri ) {
		
		int totalDonationList = adminService.getDonationCount(cri); 		
		model.addAttribute("pageMaker", new PageVO(cri, totalDonationList));
		
		model.addAttribute("donationList", adminService.getDonationWithPaging(cri));
		
		
		return "admin/donationList";
	}
	//@RequestParam( value ="board_idx" ,required = false) int board_idx
	@GetMapping("/QnA")
	public String QnAPage(Model model, Criteria cri ) {
				
		int totalQnAList = adminService.getQnACount(cri); 		
		model.addAttribute("pageMaker", new PageVO(cri, totalQnAList));
		
		model.addAttribute("QnAList", adminService.getQnAListWithPaging(cri));
		
		
		return "admin/QnAList";
	}

	@GetMapping("/statistics")
	public String statisticsPage() {

		return "admin/statisticsList";
	}

	//상품정보
	public String getProductList(Model model, int product_idx) {

		return "/admin/productList";
	}

	//배송정보
	public String getDeliveryList(Model model, int delivery_idx) {

		return "/admin/DeliveryList";
	}

	//기부정보
	public String getDonationList(Model model) {

		return "/admin/donationList";
	}

	//회원수 통계
	public String getMemberStatistics(Model model) {

		return "/admin/statistics";
	}

	public String getProductStatistics(Model model) {

		return "/admin/statistics";

	}

	//기부액 통계
	public String getDonationStatistics(Model model) {

		return "/admin/statistics";
	}

	//금일매출
	public String getTodayIncome(Model model) {

		return "/admin/DonationList";
	}

	//금일 기부금
	public String getTodayDonation(Model model) {

		return "/admin/DonationList";
	}

	//신규 가입수
	public String getTodayMemberList(Model model) {
		
		adminService.getTodayMemberList();
		
		return "/admin/DonationList";
	}

	//현재주문수
	public String getCurrentOrderList(Model model) {

		return "/admin/DonationList";
	}

	//교환,환불 신청
	public String getRefundList(Model model) {

		return "/admin/DonationList";
	}

	//총 주문량
	public String getTotalOrderList(Model model) {

		return "/admin/DonationList";
	}

	//미처리주문
	public String getUnprocessedOrderList(Model model) {

		return "/admin/DonationList";
	}

	//총 회원수 
	public String getTotalMemberList() {

		return "/admin/DonationList";
	}
	
	/*상품 등록 관련*/
	
	//상품 등록
	
	//상품 삭제
	
	//상품 수정
	
}
