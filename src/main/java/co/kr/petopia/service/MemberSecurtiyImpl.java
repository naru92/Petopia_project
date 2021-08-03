package co.kr.petopia.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.MemberMapper;
import co.kr.petopia.vo.MemberVO;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class MemberSecurtiyImpl implements MemberSecurtiyService {
	
	@Autowired
	MemberMapper loginMapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		
			
				MemberVO member= loginMapper.getSelectMemberInfo(member_id);				
				List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
				
				if(member != null) {
					authorities.add(new SimpleGrantedAuthority(member.getAuthority()));
					member.setAuthList(authorities);
				
				
			}
			
				return (UserDetails) member;
		
	}


	@Override
	public MemberVO getSelectMemberInfo(String member_id) {
		
		return loginMapper.getSelectMemberInfo(member_id);
	}


	
}
 