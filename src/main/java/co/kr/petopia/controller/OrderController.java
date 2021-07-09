package co.kr.petopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.vo.MemberVO;

@Controller
public class OrderController {

@GetMapping("/order")	
public String getOrderForm(Model model) {
		
		
		return "/order/confirmation";
	}
}
