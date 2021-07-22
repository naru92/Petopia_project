package co.kr.petopia.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.controller.BoardController;
import co.kr.petopia.vo.MemberAuthVO;
import co.kr.petopia.vo.MemberVO;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Log4j2
public class MemberServiceTests {
        
    @Autowired
    private MemberService memberService;
    
    @Test
    public void testPrint() {
        log.info(memberService);
    }
    
    @Test
    public void testGetMemberInfo() {
        memberService.getMemberInfo("dummy98");
    }
    
    @Test
    public void testGetSelectMemberInfo() {
        memberService.getSelectMemberInfo("dummy23");
    }
    
    @Test
    public void testMemberRegister() {
        
        MemberVO member = new MemberVO();

        member.setMember_id("test07");
        member.setMember_password("1111");
        member.setMember_name("test");
        member.setMember_phoneNumber("010-1111-1111");
        member.setMember_address("test");
        member.setMember_email("test@test.com");

        MemberAuthVO memberAuth = new MemberAuthVO();

        
        memberAuth.setMember_id("test07");

        memberService.memberRegister(member, memberAuth);
    }
    
    @Test
    public void getMemberModify() {
        
        MemberVO member = new MemberVO();
        
        member.setMember_id("test05");
        member.setMember_password("2222");
        member.setMember_address("주소");
        member.setMember_email("test@test.com");
        member.setMember_phoneNumber("010-1111-1111");
        
        memberService.memberModify(member);
    }
    
    @Test
    public void getMemberRemove() {
        
        memberService.memberRemove("test07");
    }
    
    @Test
    public void testGetMyContentList() {
        memberService.getMyContentList("dummy56");
    }
    
    @Test
    public void testGetMyReplyList() {
        memberService.getMyReplyList("dummy42");
    }
    
}
