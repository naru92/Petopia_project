package co.kr.petopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	@GetMapping("/petstagram")
	public String petstagram() {
		
		return "board/petstagram";
	}
}
