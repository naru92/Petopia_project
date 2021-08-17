package co.kr.petopia.controller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.petopia.service.MemberService;
import co.kr.petopia.service.MypetService;
import co.kr.petopia.vo.MemberVO;
import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypet")
@Slf4j
public class MypetController {
	
	@Autowired
    private MypetService mypetService;
	
	@Autowired
	BCryptPasswordEncoder password;
	
	@Autowired
	MemberService memberService;

	
	@ResponseBody
	@PostMapping("/passwordCheck")
	public String passwordCheck(@RequestParam HashMap<String, Object> param, Principal principal ) {
		
		log.info("param: " + param);

		param.get("member_password");
		String rawPassWord = (String)param.get("memberPassword");
		MemberVO temp= memberService.getSelectMemberInfo(principal.getName());
	
		
		if(password.matches(rawPassWord , temp.getMember_password())) {
			log.info("성공");
			return "success";
		}	
		
		return "fail";
		
	}
	
	
}
