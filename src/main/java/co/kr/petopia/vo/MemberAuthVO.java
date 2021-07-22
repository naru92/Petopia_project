package co.kr.petopia.vo;

import lombok.Data;

@Data
public class MemberAuthVO {
	
	private String member_id;	
	private String authority;
	private boolean enabled;
}
