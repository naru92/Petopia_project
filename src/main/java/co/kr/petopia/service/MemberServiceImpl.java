package co.kr.petopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.MemberMapper;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.ReplyVO;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class MemberServiceImpl implements MemberService{

    @Autowired
    private final MemberMapper memberMapper;

    @Autowired
    private BCryptPasswordEncoder encodePWD;
    
    // 회원권한조회
    @Override
    public MemberVO getSelectMemberInfo(String member_id) {
        
        return memberMapper.getSelectMemberInfo(member_id);
    }
    
    // 회원정보조회
    @Override
    public MemberVO getMemberInfo(String member_id) {

        return memberMapper.getMemberInfoRead(member_id);
    }
    
    
    // 회원가입
    @Override
    public void memberRegister(MemberVO member) {
        
        String rawPassword = member.getMember_password();
        String encPassword = encodePWD.encode(rawPassword);
        
        member.setMember_password(encPassword);
        
        memberMapper.memberJoin(member);
        memberMapper.memberAuthorities(member);
        
    }
    
    // 회원수정
    @Override
    public int memberModify(MemberVO member) {
        
        return memberMapper.memberUpdate(member);
    }

    // 회원삭제(탈퇴)
    @Override
    public int memberRemove(String member_id) {

        memberMapper.memberAuthDelete(member_id);
        memberMapper.memberDelete(member_id);
        
        return 1;
    }

    // 회원이 작성한 댓글리스트
    @Override
    public List<ReplyVO> getMyReplyList(String member_id) {

        return memberMapper.getMyReplyList(member_id);
    }
    
    // 회원이 작성한 게시글리스트
    public List<BoardVO> getMyContentList(String member_id) {

        return memberMapper.getMyContentList(member_id);
    }

    // 아이디 중복 체크
    @Override
    public int checkMemberId(String member_id) {
        
        return memberMapper.checkMemberId(member_id);
    }

    // 핸드폰번호 중복 체크
    @Override
    public int checkMemberPhoneNumber(String member_phoneNumber) {
        
        return  memberMapper.checkMemberPhoneNumber(member_phoneNumber);
    }

    // 이메일 중복 체크
    @Override
    public int checkMemberEmail(String member_email) {

        return memberMapper.checkMemberEmail(member_email);
    }
    
    
}
