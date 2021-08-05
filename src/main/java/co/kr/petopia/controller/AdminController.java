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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.utils.PageVO;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.DonationVO;
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


	@GetMapping("/main")
	public String adminMain(Model model) {
		
		Map<String, Object> statisticsMemberMap = new LinkedHashMap<>();
		
		LinkedList<MemberVO> getStatisticsMemberCount = adminService.get5DaysStatisticsMemberCount();
		statisticsMemberMap.get("statistics_join_count");
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		MemberVO nullVO = new MemberVO();
		ArrayList<String> mainStatistics_join_day = new ArrayList<>();
		

		if(getStatisticsMemberCount.size() !=0) {
		
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
		
		}else {
			nullVO.setStatistics_join_count(0);
			for(int i = 0 ;  i < 5 ; i++) {
			if(i == 0) {
				cal.add(Calendar.DATE , 0);
			}else {
				cal.add(Calendar.DATE, -1);	
				
			}	
				
			getStatisticsMemberCount.add(i, nullVO);
			mainStatistics_join_day.add(sdf.format(cal.getTime()));
			}
		}
		
		model.addAttribute("mainStatistics_join_day" , mainStatistics_join_day);
		model.addAttribute("getStatisticsMemberCount", getStatisticsMemberCount);
		
		
		//신규(오늘) 회원 가입
		int getTodayMemberCount = adminService.getTotalMemberCount();
		//금일매출
		Integer todayIncome= adminService.getTodayIncome();
		//금일 기부금
		int todayDonation = adminService.getTodayDonation();
		//교환&환불 신청건수
		int refundCount = adminService.getRefundCount(); 
		//현재 주문 건수
		int currentOrderCount = adminService.currentOrderCount();
		//미처리 주문(리스트)
		List<DeliveryVO> getUnprocessedOrderList = adminService.getUnprocessedOrderList();
		//총주문량
		int statisticsOrderConut =  adminService.getStatisticsOrderCount(); 
		//회원수 그래프
		int statisticsTotalMemberConut = adminService.getTotalMemberCount();
		
		model.addAttribute("getTodayMemberCount", getTodayMemberCount);
		model.addAttribute("todayIncome" , todayIncome);
		model.addAttribute("todayDonation", todayDonation);
		model.addAttribute("refundCount", refundCount);
		model.addAttribute("getUnprocessedOrderList", getUnprocessedOrderList);
		model.addAttribute("currentOrderCount" , currentOrderCount);
		model.addAttribute("statisticsOrderConut" , statisticsOrderConut);
		model.addAttribute("statisticsTotalMemberConut" , statisticsTotalMemberConut);
		
		
		//MY_GENDER 비율		

		return "admin/adminmain";
	}

	// 회원리스트(페이징,principal)
	@GetMapping("/member")
	public String getMemberList(Model model, Criteria cri, Authentication authenticate) {
		SecurityContextHolder.getContext().getAuthentication();


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
			Criteria cri, Model model) {
		
		HashMap<String, Object> optionMap = new HashMap<String, Object>();

		String product_stock = (String) options.get("product_stock");
		String product_price = (String) options.get("product_price");
		String select_category_id = String.valueOf(options.get("select_category_id"));
		
		
		log.info("카테고리 값: " + select_category_id);
		
		
		optionMap.put("total_memberList", adminService.getProductListWithPaging(cri));
		optionMap.put("product_stock", product_stock);
		optionMap.put("product_price", product_price);
		optionMap.put("select_category_id", select_category_id);
		
		log.info("options : " + options);

		List<ProductVO> productList = adminService.getSelectOptionList(optionMap);
		int totalSelectOptionProductList = productList.size();
		model.addAttribute("pageMaker", new PageVO(cri, totalSelectOptionProductList));
		
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
	
	//기부목록
	@GetMapping("/donation")
	public String donationPage(Model model, Criteria cri) {

		int totalDonationList = adminService.getDonationCount(cri);
		
		model.addAttribute("pageMaker", new PageVO(cri, totalDonationList));
		model.addAttribute("donationList", adminService.getDonationWithPaging(cri));

		return "admin/donationList";
	}
	
	@ResponseBody
	@PostMapping(value = "/donation", consumes = "application/json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<DonationVO>> selectOptionDonationList(@RequestBody Map<String, Object> options,
			Criteria cri) {
		
		HashMap<String, Object> optionMap = new HashMap<String, Object>();
		
		String donation_date_year = (String) options.get("donation_date_year");
		String donation_date_today = (String) options.get("donation_date_today");
		String donation_state = (String) options.get("donation_state");	
		
		optionMap.put("donation_date_year", donation_date_year);
		optionMap.put("donation_state", donation_state);
		log.info("options : " + options);

		List<DonationVO> donationList = adminService.selectOptionDonationList(optionMap);

		return new ResponseEntity<>(donationList, HttpStatus.OK);
	}
	
	
	
	//문의목록
	@GetMapping("/QnA")
	public String QnAPage(Model model, Criteria cri) {

		int totalQnAList = adminService.getTotalQnACount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalQnAList));

		
		model.addAttribute("QnAList", adminService.getQnAListWithPaging(cri));

		return "admin/QnAList";
	}
	//문의목록 필터
	@ResponseBody
	@PostMapping(value = "/QnA", consumes = "application/json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<BoardVO>> selectOptionQnAList(@RequestBody Map<String, Object> options,
			Criteria cri) {
		
		HashMap<String, Object> optionMap = new HashMap<String, Object>();
		
		String qna_lately_date = (String) options.get("qna_lately_date");
		String qna_state = (String) options.get("qna_lately_date");
		
		optionMap.put("qna_lately_date", qna_lately_date);
		optionMap.put("qna_state", qna_state);
		
		log.info("options : " + options);

		List<BoardVO> QnAList = adminService.selectOptionQnAList(optionMap);

		return new ResponseEntity<>(QnAList, HttpStatus.OK);
	}
	
	
	//회원삭제
	@DeleteMapping(value = "/deleteMember", 
			consumes = "application/json", 
			produces = { MediaType.APPLICATION_XML_VALUE, 
			MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public ResponseEntity<String> deleteMember(MemberVO memberVO, 
			@RequestBody String member_id) {
		
		//성공 실패여부 int값  1 성공 0 실패
		int count = 0;
		member_id = member_id.replaceAll("\\\"","");
		
		MemberVO vo = new MemberVO();
		memberVO.setMember_id(member_id);
		log.info("delete member " + memberVO.getMember_name() + " " + memberVO.getMember_id());
		count = adminService.deleteMember(memberVO);
		
		log.info("삭제 성공시 1이 출력됩니다 :" +count);
		
		return count >= 1
				? new ResponseEntity<> ("success", HttpStatus.OK)
				: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/statistics")
	public String statisticsPage(Model model) {
		
		return "/admin/statisticsList";
	}
	
	//통계 모음 페이지
	@GetMapping(value = "/getStatistics1", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getStatistics(Model model) {

		Gson gson = new Gson();
		//회원 - 최근 3개월간 회원수 - 라인차트
		List<MemberVO> List1 = adminService.member_statistics_3month();
		
		return gson.toJson(List1);
		
	}
	//통계 모음 페이지
		@GetMapping(value = "/getStatistics2", produces = "text/plain;charset=UTF-8")
		public @ResponseBody String getStatistics2(Model model) {

			Gson gson = new Gson();
			//기부 - 3개월간 기부금, 1년 기부금
			List<MemberVO> List2 = adminService.donation_statistics_3month();
			
			
			return gson.toJson(List2);
			
		}
		//통계 모음 페이지
		@GetMapping(value = "/getStatistics3", produces = "text/plain;charset=UTF-8")
		public @ResponseBody String getStatistics3(Model model) {

			Gson gson = new Gson();
			//주문 - 최근 3개월간 가장 많이 주문 - 바차트
			List<ProductVO> List3 = adminService.order_statistics_3month();
			return gson.toJson(List3);
			
		}
		

	/* 상품 등록 관련 */

	// 상품 등록 겟
	@GetMapping("/product/insert")
	public String insertProduct(ProductVO productVO) {
		
		
		return "/product/insertProduct";
	}
	
	
	//모달 상품보기
	@GetMapping("/getModal")
	public void get( @RequestParam("product_idx") int product_idx, 
			@ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("product_idx : " + product_idx);
		
		
		/* 해당 페이지 이동 */
		log.info("getProduct ()");
		
		model.addAttribute("productVO", adminService.getProductOne(product_idx));
	}
	
	
	//상품 등록 post
	@PostMapping("/product/insert_pro")
	public String insertProduct_pro(ProductVO productVO,
			 RedirectAttributes redirectAttributes) {
			
			
	log.info("insert_pro()..");
	log.info("add products : " + productVO);

	if(productVO.getProductVOList() != null) {
		productVO.getProductVOList().forEach( file ->System.out.println(productVO));
	}	
	
	log.info("========================");
	
	
	adminService.insertProduct(productVO);
	redirectAttributes.addFlashAttribute("result", productVO.getProduct_idx());
	
		//등록 메시지 보여주고 상품메인
		return "/product/insert_success";
	}
	
	
	@GetMapping("/product/update")
	public void update(@RequestParam("product_idx") int product_idx, 
			@ModelAttribute("cri") Criteria cri, Model model) {
		
		
		log.info("/update");
		
		model.addAttribute("productVO", adminService.getProductOne(product_idx));
		
		
	}
	
	//상품수정
	@PostMapping("/product/update")
	public String update(ProductVO productVO, 
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("updateProducts : " + productVO);
		
		if(adminService.updateProduct(productVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		
		rttr.addAttribute("product_idx", productVO.getProduct_idx());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		log.info("가져온 상품 정보 : " + productVO.getProduct_idx() + cri.getPageNum() + cri.getAmount());
		
		return "redirect:/admin/product";// 수정하면 해당 번호 상품정보로 간다
	}
	
	
	//상품삭제
	@PostMapping("/product/delete")
	public String delete(@RequestParam("product_idx") int product_idx,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		//상품이 삭제되면 이미지도 파일도 날려야한다
		log.info("deleteProducts : " + product_idx);
		
		List<FileUploadVO> attachList = adminService.findByProduct(product_idx);
		
		if(adminService.deleteProduct(product_idx)) {
			rttr.addFlashAttribute("result", "success");
			}
		
		return "redirect:/admin/product" + cri.getListLink();
	}
	
	
	//파일첨부리스트
	@ResponseBody
	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<FileUploadVO>> getAttachList(int product_idx) {
		
		log.info("productVOList " + product_idx);
		
		return new ResponseEntity<>(adminService.findByProduct(product_idx), HttpStatus.OK);
	}
	
	//딜리버리 갱신

	@ResponseBody
	@PostMapping(value = "/delivery/update")
	public ResponseEntity<String> updateDelivery(@RequestBody Map<String, Object> options){
		log.info("updateDelivery ()....");
		DeliveryVO deliveryVO = new DeliveryVO();
		
		
		int delivery_idx =(int)options.get("delivery_idx");
		String delivery_state = (String)options.get("delivery_state");
		
		log.info("delivery_state " + delivery_state);
		log.info("delivery_idx " + delivery_idx);
		
		deliveryVO.setDelivery_idx(delivery_idx);
		deliveryVO.setDelivery_state(delivery_state);
		
		try {
			adminService.updateDeliveryState(deliveryVO);	
		} catch (Exception e) {
			log.info("error");
			return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		log.info("return");
		return new ResponseEntity<>("success", HttpStatus.OK);
		
	}
}
