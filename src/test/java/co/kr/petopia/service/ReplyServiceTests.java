package co.kr.petopia.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.vo.ReplyVO;
import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
public class ReplyServiceTests {
        
    @Autowired
    private ReplyService replyService;
    
    @Test
    public void testPrint() {
        log.info(""+replyService);
    }
    
    @Test
    public void testGetReplyList() {
        replyService.getReplyList(22).forEach(reply -> log.info(reply));
    }
    
    @Test
    public void testGetReply() {
        replyService.getReply(23);
    }
    
    @Test
    public void testReplyRegister() {
        ReplyVO reply = new ReplyVO();
        
        reply.setContent_idx(86);
        reply.setMember_id("dummy42");
        reply.setReply_text("댓글입니다.");
        
        replyService.replyRegister(reply);
    }
    
    @Test
    public void testReplyModify() {
        ReplyVO reply = new ReplyVO();
        
        reply.setReply_idx(23);
        reply.setReply_text("수정댓글입니다.");
        
        replyService.replyModify(reply);
    }
    
    @Test
    public void testReplyRemove() {
        replyService.replyRemove(22);
    }
}
