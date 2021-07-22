package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.MemberAuthVO;
import co.kr.petopia.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	// 멤버 정보 가지고오기
	MemberVO getSelectMemberInfo(String member_id);
	
	// 멤버 리스트
	List<MemberVO> getMemberList();
	
	// 회원가입
    void memberJoin(MemberVO member);
    // 회원가입 시 권한 주입 (회원가입과 동시에 이뤄져야 함)
    void memberAuthorities(MemberAuthVO memberAuth);
    
    // 회원정보수정
    int memberUpdate (MemberVO member);
    
    // 회원탈퇴
    int memberDelete (String member_id);
    // 회원탈퇴 시 권한삭제
    int memberAuthDelete (String member_id);

}


