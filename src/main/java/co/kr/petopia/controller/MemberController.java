	package co.kr.petopia.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
		
	@GetMapping("/joinagree")
	public String joinagree() {
		return "member/joinagree";
	}	
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}	
	
	@GetMapping("/welcome")
	public String welcome() {
		return "member/welcome";
	}
	
	@GetMapping("/jusoPopup")
	public String jusoPopup() {
		return "member/jusoPopup";
	}
}
