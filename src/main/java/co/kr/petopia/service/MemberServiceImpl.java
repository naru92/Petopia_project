package co.kr.petopia.service;

import java.util.List;

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

    private final MemberMapper memberMapper;

    
    @Override
    public MemberVO getSelectMemberInfo(String member_id) {
        
        return memberMapper.getSelectMemberInfo(member_id);
    }
    
    @Override
    public MemberVO getMemberInfo(String member_id) {

        return memberMapper.getMemberInfoRead(member_id);
    }
    
    @Override
    public void memberRegister(MemberVO member) {
        
        memberMapper.memberJoin(member);
        memberMapper.memberAuthorities(member);
        
    }

    @Override
    public int memberModify(MemberVO member) {
        
        return memberMapper.memberUpdate(member);
    }

    @Override
    public int memberRemove(String member_id) {

        memberMapper.memberAuthDelete(member_id);
        memberMapper.memberDelete(member_id);
        
        return 1;
    }

    @Override
    public List<ReplyVO> getMyReplyList(String member_id) {

        return memberMapper.getMyReplyList(member_id);
    }
    
    public List<BoardVO> getMyContentList(String member_id) {

        return memberMapper.getMyContentList(member_id);
    }

    @Override
    public int checkMemberId(String member_id) {
        
        return memberMapper.checkMemberId(member_id);
    }

    @Override
    public int checkMemberPhoneNumber(String member_phoneNumber) {
        
        return  memberMapper.checkMemberPhoneNumber(member_phoneNumber);
    }
    
    
}
