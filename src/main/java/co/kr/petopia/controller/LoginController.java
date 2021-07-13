	package co.kr.petopia.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class LoginController {

	@GetMapping("/login")
	public String login() {
		return "login/login";
	}
		
	@GetMapping("/joinagree")
	public String joinagree() {
		return "login/joinagree";
	}	
	
	@GetMapping("/join")
	public String join() {
		return "login/join";
	}	
	
	@GetMapping("/welcome")
	public String welcome() {
		return "login/welcome";
	}
}
