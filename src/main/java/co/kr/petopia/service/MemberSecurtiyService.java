package co.kr.petopia.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import co.kr.petopia.vo.MemberVO;

public interface MemberSecurtiyService extends UserDetailsService {
	
	//시큐리티 사용자 인증	
	UserDetails loadUserByUsername(String member_id);
	//회원 가입
	MemberVO getSelectMemberInfo(String member_id);
	
	

}
