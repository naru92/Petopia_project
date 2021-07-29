package co.kr.petopia.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.service.CartService;
import co.kr.petopia.service.MemberService;
import co.kr.petopia.vo.ProductVO;

@Controller
public class MainController {
	
	@Autowired
	AdminService adminService;
	@Autowired
	CartService cartService;
	@Autowired
	MemberService memberService;
	
	@GetMapping("/main")
	public String mainPage(Model model, Principal principal) {
		
		Random random = new Random();
		ArrayList<ProductVO> md = new ArrayList<>();
		/*
		 * 메인에 필요한것들
		 * 상품정보  
		*/
		
		
		List<ProductVO> AllProductList = adminService.getAllProductList();
	
		//MD추천제품
		List<ProductVO> allList= adminService.getAllProductList();
		for(int i=0; i < 2; i++) {
			md.add(allList.get(random.nextInt(allList.size()+1))); 
		}
		
		model.addAttribute("productVO", AllProductList);
		model.addAttribute("single_product", AllProductList);
		model.addAttribute("popular_product" , adminService.productListBestDesc());
		model.addAttribute("new_product" , adminService.productListDateDesc());
		model.addAttribute("md_product", md);
		
		
		
		return "main";
	}

}
