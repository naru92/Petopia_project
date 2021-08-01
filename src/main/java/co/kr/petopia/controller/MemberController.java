package co.kr.petopia.controller;

import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.google.gson.Gson;

import co.kr.petopia.service.MemberService;
import co.kr.petopia.vo.KakaoProfile;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OAuthToken;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    /* 
     * 2021.07.23
     * url은 대소문자 구분 -> 사용자의 편의성을 위해서 대문자는 거의 사용하지 않는다.
     * 단어간 구분을 할때는 '-' 을 사용하여 구분한다.
     */
    
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
    
    // 로그인
    @PostMapping("/loginProcess")
    @ResponseBody
    public String login(String member_id, String member_password, HttpSession session) {
        
        log.info("login -----------");
        
        MemberVO principal = memberService.memberLogin(member_id, member_password);
        
        log.info("login service 완료-----------");
        
        if(principal != null) {
            session.setAttribute("principal", principal);
        }
        
        log.info("login 완료-----------");
        
        return "success";
    }


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
    
    @RequestMapping("/CheckMail")
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



