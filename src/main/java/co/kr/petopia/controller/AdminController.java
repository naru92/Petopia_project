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
		
		
		//??????(??????) ?????? ??????
		int getTodayMemberCount = adminService.getTotalMemberCount();
		//????????????
		Integer todayIncome= adminService.getTodayIncome();
		//?????? ?????????
		int todayDonation = adminService.getTodayDonation();
		//??????&?????? ????????????
		int refundCount = adminService.getRefundCount(); 
		//?????? ?????? ??????
		int currentOrderCount = adminService.currentOrderCount();
		//????????? ??????(?????????)
		List<DeliveryVO> getUnprocessedOrderList = adminService.getUnprocessedOrderList();
		//????????????
		int statisticsOrderConut =  adminService.getStatisticsOrderCount(); 
		//????????? ?????????
		int statisticsTotalMemberConut = adminService.getTotalMemberCount();
		
		model.addAttribute("getTodayMemberCount", getTodayMemberCount);
		model.addAttribute("todayIncome" , todayIncome);
		model.addAttribute("todayDonation", todayDonation);
		model.addAttribute("refundCount", refundCount);
		model.addAttribute("getUnprocessedOrderList", getUnprocessedOrderList);
		model.addAttribute("currentOrderCount" , currentOrderCount);
		model.addAttribute("statisticsOrderConut" , statisticsOrderConut);
		model.addAttribute("statisticsTotalMemberConut" , statisticsTotalMemberConut);
		
		
		//MY_GENDER ??????		

		return "admin/adminmain";
	}

	// ???????????????(?????????,principal)
	@GetMapping("/member")
	public String getMemberList(Model model, Criteria cri, Authentication authenticate) {
		SecurityContextHolder.getContext().getAuthentication();


		log.info("getMemberList().." + cri);

		int totalMember = adminService.getTotalMemberCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalMember));

		model.addAttribute("memberList", adminService.getMemberListWithPaging(cri));
		return "/admin/memberList";
	}

	// ????????????(?????????)
	@GetMapping("/product")
	public String productPage(Model model, Criteria cri) {
		
		
		int totalProduct = adminService.getTotalProductCount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalProduct));
		
		model.addAttribute("productList", adminService.getProductListWithPaging(cri));

		return "admin/productList";

	}
	

	// ?????? ????????????
	@ResponseBody
	@PostMapping(value = "/product", consumes = "application/json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<ProductVO>> selectOptionProductList(@RequestBody Map<String, Object> options,
			Criteria cri, Model model) {
		
		HashMap<String, Object> optionMap = new HashMap<String, Object>();

		String product_stock = (String) options.get("product_stock");
		String product_price = (String) options.get("product_price");
		String select_category_id = String.valueOf(options.get("select_category_id"));
		
		
		log.info("???????????? ???: " + select_category_id);
		
		
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

	// ??? ?????????, ????????? ?????????
	@GetMapping("/order")
	public String orderPage(Model model, Criteria cri) {

		int totalOrderList = adminService.getOrderCount(cri);
		
		model.addAttribute("pageMaker", new PageVO(cri, totalOrderList));
		model.addAttribute("orderList", adminService.getOrderListWithPaging(cri));

		return "admin/orderList";
	}

	// ??? ?????????, ????????? ?????????
	@GetMapping("/delivery")
	public String deliveryPage(Model model, Criteria cri) {

		int totalDeliveryList = adminService.getOrderCount(cri);
		
		model.addAttribute("pageMaker", new PageVO(cri, totalDeliveryList));
		model.addAttribute("deliveryList", adminService.getDeliveryListWithPaging(cri));

		return "admin/deliveryList";
	}

	// ?????? ????????????
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

	// ?????? ????????????
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
	
	//????????????
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
	
	
	
	//????????????
	@GetMapping("/QnA")
	public String QnAPage(Model model, Criteria cri) {

		int totalQnAList = adminService.getTotalQnACount(cri);
		model.addAttribute("pageMaker", new PageVO(cri, totalQnAList));

		
		model.addAttribute("QnAList", adminService.getQnAListWithPaging(cri));

		return "admin/QnAList";
	}
	//???????????? ??????
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
	
	
	//????????????
	@DeleteMapping(value = "/deleteMember", 
			consumes = "application/json", 
			produces = { MediaType.APPLICATION_XML_VALUE, 
			MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public ResponseEntity<String> deleteMember(MemberVO memberVO, 
			@RequestBody String member_id) {
		
		//?????? ???????????? int???  1 ?????? 0 ??????
		int count = 0;
		member_id = member_id.replaceAll("\\\"","");
		
		MemberVO vo = new MemberVO();
		memberVO.setMember_id(member_id);
		log.info("delete member " + memberVO.getMember_name() + " " + memberVO.getMember_id());
		count = adminService.deleteMember(memberVO);
		
		log.info("?????? ????????? 1??? ??????????????? :" +count);
		
		return count >= 1
				? new ResponseEntity<> ("success", HttpStatus.OK)
				: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/statistics")
	public String statisticsPage(Model model) {
		
		return "/admin/statisticsList";
	}
	
	//?????? ?????? ?????????
	@GetMapping(value = "/getStatistics1", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String getStatistics(Model model) {

		Gson gson = new Gson();
		//?????? - ?????? 3????????? ????????? - ????????????
		List<MemberVO> List1 = adminService.member_statistics_3month();
		
		return gson.toJson(List1);
		
	}
	//?????? ?????? ?????????
		@GetMapping(value = "/getStatistics2", produces = "text/plain;charset=UTF-8")
		public @ResponseBody String getStatistics2(Model model) {

			Gson gson = new Gson();
			//?????? - 3????????? ?????????, 1??? ?????????
			List<MemberVO> List2 = adminService.donation_statistics_3month();
			
			
			return gson.toJson(List2);
			
		}
		//?????? ?????? ?????????
		@GetMapping(value = "/getStatistics3", produces = "text/plain;charset=UTF-8")
		public @ResponseBody String getStatistics3(Model model) {

			Gson gson = new Gson();
			//?????? - ?????? 3????????? ?????? ?????? ?????? - ?????????
			List<ProductVO> List3 = adminService.order_statistics_3month();
			return gson.toJson(List3);
			
		}
		

	/* ?????? ?????? ?????? */

	// ?????? ?????? ???
	@GetMapping("/product/insert")
	public String insertProduct(ProductVO productVO) {
		
		
		return "/product/insertProduct";
	}
	
	
	//?????? ????????????
	@GetMapping("/getModal")
	public void get( @RequestParam("product_idx") int product_idx, 
			@ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("product_idx : " + product_idx);
		
		
		/* ?????? ????????? ?????? */
		log.info("getProduct ()");
		
		model.addAttribute("productVO", adminService.getProductOne(product_idx));
	}
	
	
	//?????? ?????? post
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
	
		//?????? ????????? ???????????? ????????????
		return "/product/insert_success";
	}
	
	
	@GetMapping("/product/update")
	public void update(@RequestParam("product_idx") int product_idx, 
			@ModelAttribute("cri") Criteria cri, Model model) {
		
		
		log.info("/update");
		
		model.addAttribute("productVO", adminService.getProductOne(product_idx));
		
		
	}
	
	//????????????
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
		
		log.info("????????? ?????? ?????? : " + productVO.getProduct_idx() + cri.getPageNum() + cri.getAmount());
		
		return "redirect:/admin/product";// ???????????? ?????? ?????? ??????????????? ??????
	}
	
	
	//????????????
	@PostMapping("/product/delete")
	public String delete(@RequestParam("product_idx") int product_idx,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		//????????? ???????????? ???????????? ????????? ???????????????
		log.info("deleteProducts : " + product_idx);
		
		List<FileUploadVO> attachList = adminService.findByProduct(product_idx);
		
		if(adminService.deleteProduct(product_idx)) {
			rttr.addFlashAttribute("result", "success");
			}
		
		return "redirect:/admin/product" + cri.getListLink();
	}
	
	
	//?????????????????????
	@ResponseBody
	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<FileUploadVO>> getAttachList(int product_idx) {
		
		log.info("productVOList " + product_idx);
		
		return new ResponseEntity<>(adminService.findByProduct(product_idx), HttpStatus.OK);
	}
	
	//???????????? ??????

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
