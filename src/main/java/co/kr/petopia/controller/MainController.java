package co.kr.petopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/main")
	public String mainPage() {
		
		/*
		 * 메인에 필요한것들
		 * 상품정보  
		*/
		
		
	
		
		
		
		return "main";
	}

}
