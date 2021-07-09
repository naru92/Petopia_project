package co.kr.petopia.vo;

import java.util.Date;
import java.util.List;

import co.kr.petopia.vo.MemberAuthVO;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemberVO {
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
	private List<MemberAuthVO> authList;
	private boolean enabled;
}
