package co.kr.petopia.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import co.kr.petopia.service.MemberSecurtiyService;

//로그인 성공시 핸들러
@Component
public class AuthSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	private final static Logger logger = LoggerFactory.getLogger(AuthenticationFailureHandler.class);
	
	@Autowired
	MemberSecurtiyService memberSecurtiyService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		logger.info("로그인 성공");
		
		
		String member_id="";
		
		try {
			member_id = authentication.getName().toString();
			logger.info(member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		super.setDefaultTargetUrl("/admin/main");
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
