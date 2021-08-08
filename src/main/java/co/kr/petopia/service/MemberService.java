package co.kr.petopia.service;

import java.util.List;

import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.ReplyVO;

public interface MemberService {

    // 회원 권한 불러오기
    MemberVO getSelectMemberInfo(String member_id);

    // 해당 멤버 정보 불러오기
    MemberVO getMemberInfo(String member_id);
    
    // insert
    void memberRegister(MemberVO member);

    // update
    int memberModify(MemberVO member);

    // delete
    int memberRemove(String member_id);

    // 회원 별 게시물 list
    List<BoardVO> getMyContentList(String member_id);

    // 회원 별 댓글 list
    List<ReplyVO> getMyReplyList(String member_id);
 
    // 아이디 중복체크
    int checkMemberId(String member_id);

    // 휴대폰번호 중복체크
    int checkMemberPhoneNumber(String member_phoneNumber);
    
    // 이메일 중복체크
    int checkMemberEmail(String member_email);
    
    // 아이디 찾기
    String findMemberId(String member_name, String member_phoneNumber, String member_email);

    // 비밀번호 찾기 (수정)
    int resetMemberPw(MemberVO member);
}
