package co.kr.petopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/main")
	public String mainPage() {
		
		return "home/main";
	}

	@GetMapping("/petstagram")
	public String petstagram() {
		
		return "home/petstagram";
	}
	
}
