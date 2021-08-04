package co.kr.petopia.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.kr.petopia.service.MemberSecurtiyService;
import co.kr.petopia.service.MemberService;
import co.kr.petopia.vo.KakaoProfile;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.NaverProfile;
import co.kr.petopia.vo.OAuthToken;

@Controller
public class SocialController {
    /*
     * 카카오 로그인
     */
    
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private MemberSecurtiyService memberSecurtiyService;
    
    private String kakaoClientId = "ff1341405313f721c279ce5cd541bf40";
    private String kakaoRedirectUri = "http://localhost:8282/kakao/callback";
    
    @Value("${petopia.key}")
    private String petopiaKey;

    @GetMapping("/kakao/callback")
    public String kakaoCallback(String code, HttpSession session, Model model) throws IOException { 

        // POST방식으로 key=value 데이터를 요청 (카카오 쪽으로)
        RestTemplate rt = new RestTemplate();

        // HttpHeader 오브젝트 생성
        HttpHeaders accessTokenHeaders = new HttpHeaders();
        accessTokenHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HttpBody 오브젝트 생성
        MultiValueMap<String, String> accessTokenParams = new LinkedMultiValueMap<>();
        accessTokenParams.add("grant_type", "authorization_code");
        accessTokenParams.add("client_id", kakaoClientId);
        accessTokenParams.add("redirect_uri", kakaoRedirectUri);
        accessTokenParams.add("code", code);

        // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest 
                                                = new HttpEntity<>(accessTokenParams, accessTokenHeaders);

        // Http 요청하기 -> Post방식으로 -> 그리고 response 변수의 응답 받음.
        ResponseEntity<String> response = rt.exchange(
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
        HttpHeaders accessTokenHeaders2 = new HttpHeaders();
        accessTokenHeaders2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
        accessTokenHeaders2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(accessTokenHeaders2);

        // Http 요청하기 -> Post방식으로 -> 그리고 response 변수의 응답 받음.
        ResponseEntity<String> response2 = rt2.exchange(
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
        
  
        // Member 오브젝트 : member_id, member_password, member_email, member_name
        System.out.println("아이디: "+kakaoProfile.getId());
        System.out.println("이메일: "+kakaoProfile.getKakao_account().getEmail());
        System.out.println("비밀번호: "+petopiaKey);
        System.out.println("이름: "+kakaoProfile.getProperties().getNickname());
        

        MemberVO kakaoMember = new MemberVO();
        
        kakaoMember.setMember_id(kakaoProfile.getId().toString());
        kakaoMember.setMemberAuth_id(kakaoProfile.getId().toString());
        kakaoMember.setMember_password(petopiaKey);
        kakaoMember.setMember_oauth("KAKAO");
        kakaoMember.setMember_email(kakaoProfile.getKakao_account().getEmail());
        kakaoMember.setMember_name(kakaoProfile.getProperties().getNickname());
        kakaoMember.setMember_phoneNumber("미입력");
        kakaoMember.setMember_address("미입력");
        
        // 아이디 비번 확인
        System.out.println(kakaoMember.getMember_id());
        System.out.println(petopiaKey);
        
        // 아이디를 찾아서 int 값으로 반환
        // 기존 아이디가 있으면 1 ==> 로그인 시키고
        // 없으면 0 ==> 회원가입 처리 하기
        int originMember = memberService.checkMemberId(kakaoMember.getMember_id());
        
        if(originMember == 0) {
            System.out.println("카카오 신규회원가입 진행-------------");
            memberService.memberRegister(kakaoMember);
            System.out.println("카카오 회원가입 완료-------------");
        } 

        System.out.println("카카오 자동 로그인-------------");

        // kakaoMember로 로그인처리 (세션등록)
        memberSecurtiyService.loadUserByUsername(kakaoMember.getMember_id());

        Authentication authentication = new UsernamePasswordAuthenticationToken(kakaoMember.getMember_id(), kakaoMember.getMember_password()); 
        
        SecurityContext securityContext = SecurityContextHolder.getContext();
        
        securityContext.setAuthentication(authentication);
        
        session.setAttribute("SPRING SECURITY CONTEXT", securityContext);
        
        model.addAttribute("msg", "카카오 계정으로 로그인 되었습니다");
        model.addAttribute("url", "/");
        
        
        return "redirect:/main";
    }
    
    
    /*
     * 네이버 로그인
     */
    
    private String naverClientId = "oXosCRoUhjS_qv3Pgdcy";
    private String naverClientSecret = "L2zj9O0Qoc";
    
    @GetMapping("/naver/callback")
    public String naverOAuthRedirect(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) {
        
        RestTemplate rt = new RestTemplate();
        
        HttpHeaders accessTokenHeaders = new HttpHeaders();
        accessTokenHeaders.add("Content-type", "application/x-www-form-urlencoded");
        
        MultiValueMap<String, String> accessTokenParams = new LinkedMultiValueMap<>();
        accessTokenParams.add("grant_type", "authorization_code");
        accessTokenParams.add("client_id", naverClientId);
        accessTokenParams.add("client_secret", naverClientSecret);
        accessTokenParams.add("code", code);
        accessTokenParams.add("state", state);
        
        // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> naverTokenRequest 
                                                = new HttpEntity<>(accessTokenParams, accessTokenHeaders);
        
        // Http 요청하기 -> Post방식으로 -> 그리고 response 변수의 응답 받음.
        ResponseEntity<String> naverTokenResponse = rt.exchange(
                "https://nid.naver.com/oauth2.0/token",
                HttpMethod.POST,
                naverTokenRequest,
                String.class
        );
        
        
        
        
        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oauthToken = null;
        
        try {
            oauthToken = objectMapper.readValue(naverTokenResponse.getBody().toString(), OAuthToken.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        System.out.println("네이버 엑세스 토큰:" + oauthToken.getAccess_token());

        
        // 토큰을 통한 사용자 정보 조회하기 (POST)
        // RestTemplate rt2 = new RestTemplate();

        // HttpHeader 오브젝트 생성
        HttpHeaders accessTokenHeaders2 = new HttpHeaders();
        accessTokenHeaders2.add("Authorization", "Bearer "+oauthToken.getAccess_token());

        // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<HttpHeaders> naverProfileEntity = new HttpEntity<>(accessTokenHeaders2);

        // Http 요청하기 -> Post방식으로 -> 그리고 response 변수의 응답 받음.
        ResponseEntity<String> naverTokenResponse2 = rt.exchange(
            "https://openapi.naver.com/v1/nid/me", 
            HttpMethod.POST, 
            naverProfileEntity,
            String.class
        );

        System.out.println(naverTokenResponse2.getBody());
        
        ObjectMapper objectMapper2 = new ObjectMapper();
        NaverProfile naverProfile = null;

        try {
            naverProfile = objectMapper2.readValue(naverTokenResponse2.getBody().toString(), NaverProfile.class);
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        
  
        // Member 오브젝트 : member_id, member_password, member_email, member_name
        System.out.println("아이디: "+naverProfile.getResponse().getId());
        System.out.println("이메일: "+naverProfile.getResponse().getEmail());
        System.out.println("비밀번호: "+petopiaKey);
        System.out.println("이름: "+naverProfile.getResponse().getName());
        System.out.println("휴대폰번호: "+naverProfile.getResponse().getMobile());
        

        MemberVO naverMember = new MemberVO();
        
        naverMember.setMember_id(naverProfile.getResponse().getId());
        naverMember.setMemberAuth_id(naverProfile.getResponse().getId());
        naverMember.setMember_password(petopiaKey);
        naverMember.setMember_oauth("NAVER");
        naverMember.setMember_email(naverProfile.getResponse().getEmail());
        naverMember.setMember_name(naverProfile.getResponse().getName());
        naverMember.setMember_phoneNumber(naverProfile.getResponse().getMobile());
        naverMember.setMember_address("미입력");
        
        // 아이디 비번 확인
        System.out.println(naverMember.getMember_id());
        System.out.println(petopiaKey);
        
        // 아이디를 찾아서 int 값으로 반환
        // 기존 아이디가 있으면 1 ==> 로그인 시키고
        // 없으면 0 ==> 회원가입 처리 하기
        int originMember = memberService.checkMemberEmail(naverMember.getMember_email());
        
        if(originMember == 0) {
            System.out.println("네이버 신규회원가입 진행-------------");
            memberService.memberRegister(naverMember);
            System.out.println("네이버 회원가입 완료-------------");
        } 

        System.out.println("네이버 자동 로그인-------------");

        // naverMember로 로그인처리 (세션등록)
        memberSecurtiyService.loadUserByUsername(naverMember.getMember_id());

        Authentication authentication = new UsernamePasswordAuthenticationToken(naverMember.getMember_id(), naverMember.getMember_password()); 
        
        SecurityContext securityContext = SecurityContextHolder.getContext();
        
        securityContext.setAuthentication(authentication);
        
        session.setAttribute("SPRING SECURITY CONTEXT", securityContext);
        
        model.addAttribute("msg", "네이버 계정으로 로그인 되었습니다");
        model.addAttribute("url", "/");
        
        
        return "redirect:/main";        
        
    }

}
