package co.kr.petopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.kr.petopia.service.OrderService;


@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@GetMapping("/order")	
	public String getOrderForm(Model model) {
		System.out.println("getOrderForm()..");
		System.out.println("OrderService.getCartList()..");
		
		model.addAttribute("order", orderService.getCartList());
	
		return "/order/checkout";
	}
}
