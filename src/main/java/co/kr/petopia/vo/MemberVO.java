package co.kr.petopia.vo;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import co.kr.petopia.vo.MemberAuthVO;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class MemberVO implements UserDetails {
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_phoneNumber;
	private String member_address;
	private Date member_joindate;
	private String member_email;
	private String member_grade;
	private int member_point;
	private int member_donation;
	private String authority;
	
	private List<? extends GrantedAuthority> authList;
	private boolean Isenabled = true;
	private	String username;
	private boolean isCredentialsNonExpired = true;
	private boolean isAccountNonExpired = true;
	private boolean isAccountNonLocked = true;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		return this.authList;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.member_password;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.member_id;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return this.isAccountNonExpired;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return this.isAccountNonLocked;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return this.isCredentialsNonExpired;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return this.Isenabled;
	}
	
}
