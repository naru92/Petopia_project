package co.kr.petopia.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.petopia.service.OrderService;
import co.kr.petopia.vo.OrderDetailVO;
import co.kr.petopia.vo.OrderVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	// 주문서 작성(장바구니 리스트 불러오기)
	@GetMapping("/checkout")	
	public String getOrderForm(Model model) {
		log.info("getOrderForm()..");
		log.info("OrderService.getCartList()..");
		
		model.addAttribute("order", orderService.getCartList());
	
		return "/order/checkout";
	}
	
	// 주문 상세 페이지(무통장입금)
	@GetMapping("/confirmation_deposit")
	public String confirmation_deposit(OrderVO orderVO, Model model) {
		log.info("confirmation_deposit");
		log.info("orderService.readOrderInfo()..");
		
		model.addAttribute("confirmation_deposit", orderService.readOrderInfo());
		model.addAttribute("order", orderService.getCartList());
		
		return "/order/confirmation_deposit";
	}
	
	// 주문 상세 페이지(카드)
	@GetMapping("/confirmation_card")
	public String confirmation_card(OrderVO orderVO, Model model) {
		log.info("confirmation_card");
		log.info("orderService.readOrderInfo()..");
		
		model.addAttribute("confirmation_deposit", orderService.readOrderInfo());
		model.addAttribute("order", orderService.getCartList());
		
		return "/order/confirmation_card";
	}
	
	// 주문자 정보 입력 데이터 넘기기
	@PostMapping("/order-proc") 
	@ResponseBody
	public String orderInsert(OrderVO orderVO , RedirectAttributes rttr){
		log.info("order : " + orderVO);	
	
		orderVO.setMember_id("dummy20");
		
		orderService.orderFormInsert(orderVO);
		
		orderVO.setOrder_idx(orderService.getOrderFormCurrVal());
		
		orderService.orderDetailInsert(orderVO);
		
		rttr.addFlashAttribute("result", "success");
		
		return "success";
	}	
	
}
