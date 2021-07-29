package co.kr.petopia.security;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired 
	private UserDetailsService userDetailsService;
	
	//로그인 버튼 클릭시 처리 클래스
	@Autowired
	AuthProvider authProvider;
	
	//로그인 성공시 처리 클래스
	@Autowired
	AuthSuccessHandler authSuccessHandler;
	
	//로그인 실패시 처리 클래스
	@Autowired
	AuthFailureHandler authFailureHandler;
	
	

	//정적 파일은 시큐리티 검열 무시
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/petopia/**", "/petopia/css/**", "/petopia/js/**", "/petopia/images/**","/petoia/images/**","/petopia/font");
				

	
		     
		
	}
	
	//권한 관리
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {		
		auth.authenticationProvider(authProvider);
	}
	
	//상세 설정 (리소스접근, 폼로그인 설정, 로그아웃 설정)
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http
				.csrf()
						.disable(); //csrf꺼둠(개발시에만)
		
		
		http
				.authorizeRequests()
						
								
						.antMatchers("/admin/main","/member/login","/member/**","/main","/","/**","/order/**","/error","/cartpage").permitAll(); //공개 할 url
						//.antMatchers("/member/**").access("hasRole('ROLE_USER')")//맴버만 접근

						//.antMatchers("/admin/**").access("hasRole('ROLE_USER')");//어드민만접근근
						//.antMatchers("/**").authenticated(); //그 밖의 기타경로 인증필요


		http
				.formLogin() //폼로그인 방식
						.loginPage("/member/login") //로그인 페이지 url설정
						.loginProcessingUrl("/loginProcess") //로그인 프로세스 경로
						.usernameParameter("member_id") //아이디 파라미터값 jsp의 input 값과 일치
						.passwordParameter("member_password")//비밀번호 파라미터값 jsp의 passwor값과 일치
						.successHandler(authSuccessHandler)//로그인 성공시
						.failureHandler(authFailureHandler);//로그인 실패시
						//.and()
		http
				.logout()
						.logoutRequestMatcher(new AntPathRequestMatcher("login/logout"))//로그아웃 요청시 경로
						.logoutSuccessUrl("/login")//로그아웃 성공후 가게될 url
						.invalidateHttpSession(true); //세션 초기화	
						
	}
	
	
	
	
		
		
	
	
	

}
