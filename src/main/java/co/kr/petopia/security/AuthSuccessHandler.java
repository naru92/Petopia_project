package co.kr.petopia.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import co.kr.petopia.service.MemberSecurtiyService;
import lombok.extern.slf4j.Slf4j;

//로그인 성공시 핸들러
@Slf4j
@Component
public class AuthSuccessHandler implements AuthenticationSuccessHandler {
	
	private final static Logger logger = LoggerFactory.getLogger(AuthenticationFailureHandler.class);
	
	@Autowired
	MemberSecurtiyService memberSecurtiyService;
	
	private String defaultUrl="/main";//기본설정 url
	private RequestCache requestCache = new HttpSessionRequestCache(); //원래 요청한주소
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy(); //원래 가야할 url위치
	
	/*super.setDefaultTargetUrl("/admin/main");
		
		super.onAuthenticationSuccess(request, response, authentication);*/
	
	


	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		logger.info("로그인 성공");
		
		
		String member_id="";
		
		try {
			member_id = auth.getName().toString();
			logger.info(request.getParameter(member_id));
			
		List<String> authorityNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority ->{
			authorityNames.add(authority.getAuthority());
		});
		
		log.info(request.getParameter(member_id) + "ROLE_NAMES : " + authorityNames );
		resultRedirectStrategy(request, response, auth);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, 
			HttpServletResponse response, Authentication auth) 
					throws IOException, ServletException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if(savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			//로그인전 요청한 url이 있다면 보낼곳
			redirectStrategy.sendRedirect(request, response, targetUrl);
		} else {
			//로그인전 요청한 url이 없다면 디폴트로
			redirectStrategy.sendRedirect(request, response, defaultUrl);
		}
	}
	
}
