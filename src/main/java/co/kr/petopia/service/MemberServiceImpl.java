package co.kr.petopia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.MemberMapper;
import co.kr.petopia.vo.MemberAuthVO;
import co.kr.petopia.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class MemberServiceImpl implements MemberService{

    private final MemberMapper memberMapper;

    @Override
    public List<MemberVO> getMemberList() {

        return memberMapper.getMemberList();
    }
    
    @Override
    public MemberVO getSelectMemberInfo(String member_id) {
        
        return memberMapper.getSelectMemberInfo(member_id);
    }
    
    @Override
    public void memberRegister(MemberVO member, MemberAuthVO memberAuth) {
        
        memberMapper.memberJoin(member);
        memberMapper.memberAuthorities(memberAuth);
        
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

    
}
