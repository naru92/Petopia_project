package co.kr.petopia.service;

import java.util.List;

import co.kr.petopia.vo.MemberAuthVO;
import co.kr.petopia.vo.MemberVO;

public interface MemberService {

    // list
    List<MemberVO> getMemberList();
    
    // read
    MemberVO getSelectMemberInfo(String member_id);
    
    // insert
    void memberRegister(MemberVO member, MemberAuthVO memberAuth);
    
    // update
    int memberModify(MemberVO member);
    
    // delete
    int memberRemove(String member_id);
    

}
    

