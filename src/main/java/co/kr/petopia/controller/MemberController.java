package co.kr.petopia.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
		
	@GetMapping("/joinAgree")
	public String joinAgree() {
		return "member/joinAgree";
	}	
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}	
	
	@PostMapping("/welcome")
    public String signUp() {
        return "redirect:/member/welcome";
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
	
	// 기부 메인
	@GetMapping("/donation")
    public String donation() {
        return "member/donation";
    }

	// 마이펫 등록
	@GetMapping("/myPet1")
	public String myPet1() {
		return "member/myPet1";
	}
	
	// 회원정보수정 비밀번호 확인
	@GetMapping("/passwordConfirm")
	public String passwordConfirm() {
		
		return "member/passwordConfirm";
	}
	
	// 회원정보수정
	@GetMapping("/memberModify")
	public String memberModify() {
		
		return "member/memberModify";
	}
}
