package co.kr.petopia.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import co.kr.petopia.service.MemberSecurtiyService;
import co.kr.petopia.vo.MemberVO;


@Component
public class AuthProvider implements AuthenticationProvider {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandler.class);
	
	@Autowired
	MemberSecurtiyService memberSecurtiyService;
	
	//로그인 상황 (로그인 버튼 눌렀을시)
	
	//첫번째 실행
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String member_id = authentication.getName();
		String member_password = authentication.getCredentials().toString();
		return authenticate(member_id, member_password);
	}
	
	//두번째 실행
	private Authentication authenticate(String member_id, String member_password) throws AuthenticationException {
		
		List<GrantedAuthority> grantedAuthoriList = new ArrayList<GrantedAuthority>();
		
		MemberVO member = new MemberVO();
		
		member = (MemberVO)memberSecurtiyService.loadUserByUsername(member_id);
		
		//DB에 사용자가 없을시
		if(member == null) {
			logger.info("사용자 정보가 없습니다");
			throw new UsernameNotFoundException(member_id);
			
		}else if(member != null && !member.getMember_password().equals(member_password)) {
			logger.info("비밀번호가 틀렸습니다.");
			throw new BadCredentialsException(member_password);
		}
		grantedAuthoriList.add(new SimpleGrantedAuthority(member.getAuthority()));
		
		return new MemberAuthentication(member_id, member_password, grantedAuthoriList, member);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
