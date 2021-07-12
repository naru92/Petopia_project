package co.kr.petopia.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.utils.PageVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.ProductVO;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	
	
	@GetMapping("/main")
	public String adminMain() {

		return "admin/adminmain";
	}
	
	@GetMapping("/member")
	public String getMemberList(Model model, Criteria cri) {
		
		log.info("getMemberList().." + cri);
		
					
		int totalMember = adminService.getTotalMemberCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalMember));
		
		model.addAttribute("memberList", adminService.getMemberListWithPaging(cri));
		return "/admin/memberList";
	}

	@GetMapping("/product")
	public String productPage(Model model, Criteria cri) {
		
		int totalProduct = adminService.getTotalProductCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalProduct));
		
		model.addAttribute("productList", adminService.getProductListWithPaging(cri));
		
		
		return "admin/productList";
			
	}
	
	@ResponseBody
	@PostMapping(value = "/product", 
	consumes = "application/json", 
	produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<String> selectOptionList(@RequestBody String option ) {
		System.out.println(option);
		return null;
	}
	
	@GetMapping("/order")
	public String orderPage() {

		return "admin/orderList";
	}


	@GetMapping("/delivery")
	public String deliveryPage() {

		return "admin/deliveryList";
	}

	@GetMapping("/donation")
	public String donationPage() {

		return "admin/donationList";
	}

	@GetMapping("/QnA")
	public String QnAPage() {

		return "admin/QnAList";
	}

	@GetMapping("/statistics")
	public String statisticsPage() {

		return "admin/statisticsList";
	}

//상품정보
	public String getProductList(Model model) {

		return "/admin/productList";
	}

//배송정보
	public String getDeliveryList(Model model) {

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
}
