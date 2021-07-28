package co.kr.petopia.vo;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class MemberVO implements UserDetails {
	/*
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String member_id;
	private String memberAuth_id;
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
	private boolean enabled;

	
	private List<? extends GrantedAuthority> authList;
	private boolean Isenabled = true;
	private	String username;
	private boolean isCredentialsNonExpired = true;
	private boolean isAccountNonExpired = true;
	private boolean isAccountNonLocked = true;
	
	//통계용 변수
	private String statistics_join_day;
	private String mainStatistics_join_day;
	private int statistics_join_count;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		return this.authList;
	}
	@Override
	public String getPassword() {
		return this.member_password;
	}
	@Override
	public String getUsername() {
		return this.member_id;
	}
	@Override
	public boolean isAccountNonExpired() {
		return this.isAccountNonExpired;
	}
	@Override
	public boolean isAccountNonLocked() {
		return this.isAccountNonLocked;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return this.isCredentialsNonExpired;
	}
	@Override
	public boolean isEnabled() {
		return this.Isenabled;
	}

	

}
