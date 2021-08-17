package co.kr.petopia.mapper;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.ReplyVO;
import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
public class ReplyMapperTests {
    
    @Autowired
    private ReplyMapper replyMapper;
    
    @Test
    public void testGetReplyList() {
        
        replyMapper.getReplyList(1);
    }
    
    @Test
    public void testGetReplyRead() {
        
        replyMapper.getReplyRead(23);
    }

    @Test
    public void testReplytInsert() {
        ReplyVO reply = new ReplyVO();
        reply.setContent_idx(22);
        reply.setReply_text("댓글입니다.");
        reply.setMember_id("dummy23");
        
        replyMapper.replyInsert(reply);
        
        log.info("----------------------------");
        log.info("insert " + reply.getReply_idx());
    }
    
    @Test
    public void testReplyDelete() {
        
        int count = replyMapper.replyDelete(21);
        log.info("count: " + count);
    }
    
    @Test
    public void testReplyUpdate() {
        ReplyVO reply = new ReplyVO();
        reply.setReply_idx(22);
        reply.setReply_text("Updated 댓글입니다.");

        log.info("count: " + replyMapper.replyUpdate(reply));
    }
}
