package co.kr.petopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import co.kr.petopia.service.OrderService;
import co.kr.petopia.vo.OrderVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@GetMapping("/order")	
	public String getOrderForm(Model model) {
		log.info("getOrderForm()..");
		log.info("OrderService.getCartList()..");
		
		model.addAttribute("order", orderService.getCartList());
	
		return "/order/checkout";
	}
	
	@PostMapping("/order/confirmation")
	public String orderInsert(OrderVO orderVO){
		log.info("order : " + orderVO);	
		
		orderService.orderFormInsert(orderVO);
		
		//orderService.getOrderFormCurrVal(orderVO.getOrder_idx());
		
		orderService.orderDetailInsert(orderVO);
		
		return "redirect:/confirmation";
	}
}
