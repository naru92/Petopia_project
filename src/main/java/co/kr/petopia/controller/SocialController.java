package co.kr.petopia.controller;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.kr.petopia.service.MemberService;
import co.kr.petopia.vo.KakaoProfile;
import co.kr.petopia.vo.OAuthToken;

@Controller
public class SocialController {

	@Autowired
	private MemberService memberService;
	
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
		
		// Member 오브젝트 : member_id, member_password, member_email
		System.out.println("아이디: "+kakaoProfile.getId());
		System.out.println("이메일: "+kakaoProfile.getKakao_account().getEmail());
		UUID garbagePassword=UUID.randomUUID();
		System.out.println("비밀번호: "+garbagePassword);
		
		
		return (String) response2.getBody();
	}
}
