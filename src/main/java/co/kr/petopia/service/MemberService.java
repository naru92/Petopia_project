package co.kr.petopia.service;

import java.util.List;

import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.MemberAuthVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.ReplyVO;

public interface MemberService {

    // 회원 권한 불러오기
    MemberVO getSelectMemberInfo(String member_id);
    
    // 해당 멤버 정보 불러오고
    MemberVO getMemberInfo(String member_id);

    // insert
    void memberRegister(MemberVO member, MemberAuthVO memberAuth);

    // update
    int memberModify(MemberVO member);

    // delete
    int memberRemove(String member_id);

    // 회원 별 게시물 list
    List<BoardVO> getMyContentList(String member_id);

    // 회원 별 댓글 list
    List<ReplyVO> getMyReplyList(String member_id);
 

}
