package co.kr.petopia.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
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
    public String login() {
        return "member/login";
    }
    
    @GetMapping("/joinAgree")
    public String joinAgree() {
        return "member/joinAgree";
    }

    @GetMapping("/joinForm")
    public String joinForm() {

        log.info("회원가입 페이지-----------");

        return "member/joinForm";
    }

    @GetMapping("/welcome")
    public String welcome() {
        return "member/welcome";
    }
    
    @PostMapping("/join-proc")
    @ResponseBody
    public String signUp(MemberVO member, RedirectAttributes rttr) throws Exception{

        log.info("join -----------");
        
        memberService.memberRegister(member);
        
        rttr.addFlashAttribute("result", "success");

        log.info("join service 완료-----------");

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
    
    
    @Autowired
    JavaMailSender javaMailSender;
    // 이메일 인증
    @RequestMapping("/CheckMail")
    @ResponseBody
    public Map<String, Object> SendMail(String mail, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
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
        map.put("key", key);
        
        
        
        return map;
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
    
    
    /*
     * 카카오 로그인
     */
    
    private String clientId = "ff1341405313f721c279ce5cd541bf40";
    private String redirectUri = "http://localhost:8282/kakao/callback";

    @GetMapping("/kakao/callback")
    public @ResponseBody String kakaoCallback(String code) throws IOException { // Data를 리턴해주는 컨트롤러 함수

        // POST방식으로 key=value 데이터를 요청 (카카오 쪽으로)
        RestTemplate rt = new RestTemplate();

        // HttpHeader 오브젝트 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HttpBody 오브젝트 생성
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", clientId);
        params.add("redirect_uri", redirectUri);
        params.add("code", code);

        // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

        // Http 요청하기 -> Post방식으로 -> 그리고 response 변수의 응답 받음.
        ResponseEntity response = rt.exchange(
            "https://kauth.kakao.com/oauth/token", 
            HttpMethod.POST, 
            kakaoTokenRequest,
            String.class
        );

        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oauthToken = null;

        try {
            oauthToken = objectMapper.readValue(response.getBody().toString(), OAuthToken.class);
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        System.out.println("카카오 엑세스 토큰:" + oauthToken.getAccess_token());

        
        // 토큰을 통한 사용자 정보 조회하기 (POST)
        RestTemplate rt2 = new RestTemplate();

        // HttpHeader 오브젝트 생성
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
        headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);

        // Http 요청하기 -> Post방식으로 -> 그리고 response 변수의 응답 받음.
        ResponseEntity response2 = rt2.exchange(
            "https://kapi.kakao.com/v2/user/me", 
            HttpMethod.POST, 
            kakaoProfileRequest,
            String.class
        );

        System.out.println(response2.getBody());
        
        ObjectMapper objectMapper2 = new ObjectMapper();
        KakaoProfile kakaoProfile = null;

        try {
            kakaoProfile = objectMapper2.readValue(response2.getBody().toString(), KakaoProfile.class);
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        
        String memberId = Integer.toString(kakaoProfile.getId());
        
        // Member 오브젝트 : member_id, member_password, member_email, member_name
        System.out.println("아이디: "+kakaoProfile.getId());
        System.out.println("이메일: "+kakaoProfile.getKakao_account().getEmail());
        UUID garbagePassword=UUID.randomUUID();
        System.out.println("비밀번호: "+garbagePassword);
        System.out.println("이름: "+kakaoProfile.getProperties().getNickname());
        
        
        MemberVO member = new MemberVO();
        
        member.builder()
              .member_id(memberId)
              .member_password(garbagePassword.toString())
              .member_email(kakaoProfile.getKakao_account().getEmail())
              .member_name(kakaoProfile.getProperties().getNickname())
              .build();
                
        memberService.memberRegister(member);
        
        return "회원가입 완료";
    }
}



