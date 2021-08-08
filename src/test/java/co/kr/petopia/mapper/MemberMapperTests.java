package co.kr.petopia.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.vo.MemberVO;
import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
public class MemberMapperTests {

    @Autowired
    private MemberMapper memberMapper;


    @Test
    public void testGetMemberInfo() {

        memberMapper.getMemberInfoRead("dummy11");

    }

    @Test
    public void testMemberJoin() {

        MemberVO vo = new MemberVO();

        vo.setMember_id("test23");
        vo.setMember_password("1111");
        vo.setMember_name("test");
        vo.setMember_phoneNumber("010-1111-1111");
        vo.setMember_address("test");
        vo.setMember_email("test@test.com");
        
        vo.setMemberAuth_id("test23");

        memberMapper.memberJoin(vo);
        memberMapper.memberAuthorities(vo);

        log.info("----------------------------");
        log.info("afrer insert" + vo.getMember_id());

    }

    @Test
    public void testMemberDelete() {

        memberMapper.memberAuthDelete("test07");
        memberMapper.memberDelete("test07");
    }

    @Test
    public void testMemberUpdate() {
        MemberVO vo = new MemberVO();
        vo.setMember_id("test03");
        vo.setMember_password("2222");
        vo.setMember_address("주소");
        vo.setMember_email("test@test.com");
        vo.setMember_phoneNumber("010-1111-1111");

        log.info("count: " + memberMapper.memberUpdate(vo));
    }
    
    @Test
    public void testGetMyContentList() {
        memberMapper.getMyContentList("dummy56");
    }
    
    @Test
    public void testGetMyReplyList() {
        memberMapper.getMyReplyList("dummy42");
    }
    
    @Test
    public void testResetMemberPw() {
        
        MemberVO vo = new MemberVO();
        vo.setMember_id("dummy1");
        vo.setMember_name("테스트1");
        vo.setMember_email("test@test.com");
        vo.setMember_password("2222");
        memberMapper.resetMemberPw(vo);
    }
    
}
