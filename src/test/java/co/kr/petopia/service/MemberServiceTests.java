package co.kr.petopia.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.vo.MemberVO;
import lombok.extern.log4j.Log4j2;

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

        member.setMember_id("test01");
        member.setMember_password("1111");
        member.setMember_name("테스트");
        member.setMember_phoneNumber("010-1111-1111");
        member.setMember_address("test");
        member.setMember_email("test@test.com");
        member.setMember_oauth("(null)");
        
        member.setMemberAuth_id("test01");

        memberService.memberRegister(member);
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
        
        memberService.memberRemove("J2SJzXng4l38ql4KRqnGsnbRQmRNQ8LXyBF5qUgq470");

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
