package co.kr.petopia.mapper;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.mapper.BoardMapper;
import co.kr.petopia.vo.BoardVO;
import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class BoardMapperTests {
    
    @Autowired
    private BoardMapper boardMapper;
    
    @Test
    public void testGetList() {
        boardMapper.getPetstagramList();
    }
    
    @Test
    public void testInsert() {
        BoardVO vo = new BoardVO();
        vo.setBoard_id(4);
        vo.setContent_text("내용입니다");
        vo.setContent_title("제목입니다");
        vo.setMember_id("dummy56");
        
        boardMapper.insert(vo);
        
        log.info("----------------------------");
        log.info("afrer insert" + vo.getContent_idx());
    }
    
    @Test
    public void testRead() {
        
        BoardVO vo = boardMapper.read(21L);
        log.info(""+vo);
        
    }
    
    @Test
    public void testDelete() {
        
        int count = boardMapper.delete(21L);
        log.info("count: " + count);
    }
    
    @Test
    public void testUpdate() {
        BoardVO vo = new BoardVO();
        vo.setContent_idx(22);
        vo.setContent_text("Updated 내용입니다");
        vo.setContent_title("Updated 제목입니다");

        log.info("count: " + boardMapper.update(vo));
    }
}
