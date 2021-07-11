package co.kr.petopia.security;

import java.util.List;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import co.kr.petopia.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Getter @Setter
public class MemberAuthentication extends UsernamePasswordAuthenticationToken {
	//로그인 사용자를 객체 저장할것임
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;	
	
	MemberVO member;
	
	public MemberAuthentication(String member_id, String member_password, List<GrantedAuthority> grantedAuthorityList , MemberVO member) {
		super(member_id, member_password, grantedAuthorityList);
		this.member = member;
	}
}
