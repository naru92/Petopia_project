package co.kr.petopia.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.petopia.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService MemberService;
	
	@GetMapping("member/login")
	public String login() {
		return "member/login";
	}
		
	@GetMapping("member/joinAgree")
	public String joinAgree() {
		return "member/joinAgree";
	}	
	
	@GetMapping("member/joinForm")
	public String join() {
		return "member/joinForm";
	}	
	
	@GetMapping("member/welcome")
	public String welcome() {
		return "member/welcome";
	}
	
	// 마이페이지 메인
	@GetMapping("/mypage")
	public String mypage() {
	    return "member/mypage";
	}
	// 마이페이지 기부
	@GetMapping("/mypage_donation")
    public String mypage_donation() {
        return "member/mypage_donation";
    }
	
	// 회원 탈퇴
	@GetMapping("/withdrawal_agree")
    public String withdrawal_agree() {
        return "member/withdrawal_agree";
    }
	@GetMapping("/withdrawal")
    public String withdrawal() {
        return "member/withdrawal";
    }
	@GetMapping("/withdrawal_success")
    public String withdrawal_success() {
        return "member/withdrawal_success";
    }
	
	// 이벤트 메인
	@GetMapping("/event")
    public String event() {
        return "member/event";
    }
	// 이벤트 상세
	@GetMapping("/event_detail")
    public String event_detail() {
        return "member/event_detail";
    }
	
	// 기부 메인
	@GetMapping("/donation")
    public String donation() {
        return "member/donation";
    }

}
