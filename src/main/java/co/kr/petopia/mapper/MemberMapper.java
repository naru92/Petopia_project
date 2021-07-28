package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.ReplyVO;

@Mapper
public interface MemberMapper {
	
	// 멤버 정보 가지고오기(시큐리티/로그인용)
	MemberVO getSelectMemberInfo(String member_id);
	
	// 해당 멤버 정보 가지고오기
	MemberVO getMemberInfoRead(String member_id);
	
	// 회원가입
    void memberJoin(MemberVO member);
    // 회원가입 시 권한 주입 (회원가입과 동시에 이뤄져야 함)
    void memberAuthorities(MemberVO member);
    
    // 회원정보수정
    int memberUpdate (MemberVO member);
    
    // 회원탈퇴
    int memberDelete (String member_id);
    // 회원탈퇴 시 권한삭제
    int memberAuthDelete (String member_id);
    
    // member 기준으로 댓글 list 불러오기
    List<BoardVO> getMyContentList(String member_id);
    
    // member 기준으로 댓글 list 불러오기
    List<ReplyVO> getMyReplyList(String member_id);
    
    // 아이디 중복체크
    int checkMemberId (String member_id);
    
    // 휴대폰번호 중복체크
    int checkMemberPhoneNumber(String member_phoneNumber);
}


