package co.kr.petopia.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import co.kr.petopia.service.MemberSecurtiyService;

@Component
public class AuthFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	MemberSecurtiyService memberSecurtiyService;
	
	private final static Logger logger = LoggerFactory.getLogger(AuthenticationFailureHandler.class);
	
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		logger.info("** 로그인 실패 ** ");
		String member_id = "";
		String msg ="";
		logger.info("aa" + member_id);
		logger.info("bb" + msg);
		
		try {
			member_id = exception.getMessage();
			if(memberSecurtiyService.getSelectMemberInfo(member_id) != null) {
				msg ="비밀번호가 틀렸습니다.";
			}else {
				msg = "해당 아이디가 존재하지 않습니다.";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/login");
	}
	
}