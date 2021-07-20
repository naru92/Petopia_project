package co.kr.petopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class BoardController {
	
	@GetMapping("/petstagram")
	public String list() {
	    
		log.info("list.................");
		return "board/petstagram";
		
	}
}
