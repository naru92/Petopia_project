package co.kr.petopia.controller;


import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import co.kr.petopia.service.MemberService;
//import co.kr.petopia.service.PointService;
import co.kr.petopia.vo.MemberVO;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {

	@Autowired
    private MemberService memberService;
	@Autowired
	//private PointService pointService;
    

    @GetMapping("/login")
    public String loginPage() {
        log.info("로그인 페이지-----------");
        return "member/login";
    }
    
    @GetMapping("/joinAgree")
    public String joinAgreePage() {
        log.info("약관동의 페이지-----------");
        return "member/joinAgree";
    }

    @GetMapping("/joinForm")
    public String joinFormPage() {
        log.info("회원가입 페이지-----------");
        return "member/joinForm";
    }

    @GetMapping("/welcome")
    public String welcomePage() {
        log.info("회원가입 완료 페이지-----------");
        return "member/welcome";
    }
    
    // 회원가입
    @PostMapping("/joinProcess")
    @ResponseBody
    public String signUp(MemberVO member, RedirectAttributes rttr) throws Exception{

        log.info("join -----------");
        
        memberService.memberRegister(member);
        
        rttr.addFlashAttribute("result", "success");

        log.info("join service 완료-----------");

        return "success";
    }
    
    // 아이디 찾기 폼
    @GetMapping("/help/findid")
    public String findMeberIdForm() {
        return "member/findId";
    }
    // 아이디 찾기
    
    // 아이디 찾기 결과 화면
    
    // 비밀번호 찾기 폼
    @GetMapping("/help/findpw")
    public String findMeberPwForm() {
        return "member/findPassword";
    }
    // 비밀번호 찾기
    
    // 비밀번혼 찾기 결과 화면
    
    

    // joinForm -> 아이디 중복 체크
    @GetMapping("/idCheck")
    @ResponseBody
    public int checkMemberId(@RequestParam("memberId") String member_id) {
        
        return memberService.checkMemberId(member_id);
    }
    
    // joinForm -> 휴대폰 번호 중복 체크
    @GetMapping("/pnCheck")
    @ResponseBody
    public int checkMemberPhoneNumber(@RequestParam("memberPN") String member_phoneNumber) {
        
        return memberService.checkMemberPhoneNumber(member_phoneNumber);
    }
    
    
    // 이메일 인증
    
    /*
     * 이메일 인증 번호를 json으로 변환하여 return해 줘야,
     * 자바스크립트에서 인식 가능!
     */
    
    @Autowired
    JavaMailSender javaMailSender;
    
    @RequestMapping({"/CheckMail","member/CheckMail"})
    @ResponseBody
    public String SendMail(String mail) {
        Random random = new Random();
        String key = "";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mail); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
        
        // 입력 키를 위한 코드
        for (int i = 0; i < 3; i++) {
            int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
            key += (char) index;
        }
        
        int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
        
        key += numIndex;
        message.setSubject("[PETOPIA] 인증번호 입력을 위한 메일 전송");
        message.setText("이메일 인증 번호 : " + key);
        javaMailSender.send(message);
        
        Gson gson = new Gson();
        
        return gson.toJson(key);
    }
    

    // 마이페이지 메인
    @GetMapping("member/mypage")
    public String mypage() {
        return "member/mypage";
    }

    // 마이페이지 기부
    @GetMapping("member/mypage_donation")
    public String mypage_donation(MemberVO donation) {
        
        //pointService.donationPoint(donation);
        
        return "member/mypage_donation";
    }
    
    // 마이페이지 포인트
    @GetMapping("member/mypage_point")
    public String mypage_point(MemberVO point) {
        
        //pointService.retentionPoint(point);
        
        return "member/mypage_point";
    }

    
    // 회원 탈퇴
    @GetMapping("member/withdrawal_agree")
    public String withdrawal_agree() {
        return "member/withdrawal_agree";
    }

    @GetMapping("member/withdrawal")
    public String withdrawal() {
        return "member/withdrawal";
    }

    @GetMapping("member/withdrawal_success")
    public String withdrawal_success() {
        return "member/withdrawal_success";
    }
	
    
	// 마이펫 등록
	@GetMapping("member/myPet1")
	public String myPet1() {
		return "member/myPet1";
	}
	
	// 회원정보수정 비밀번호 확인
	@GetMapping("member/passwordConfirm")
	public String passwordConfirm() {
		
		return "member/passwordConfirm";
	}

	
	// 회원정보수정
	@GetMapping("member/modify")
	public String memberModify() {
		

		return "member/memberModify";
	}


}
