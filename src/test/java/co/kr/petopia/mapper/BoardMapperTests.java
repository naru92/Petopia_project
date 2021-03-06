package co.kr.petopia.mapper;


import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.utils.Criteria;
import co.kr.petopia.utils.PageVO;
import co.kr.petopia.vo.BoardVO;
import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
public class BoardMapperTests {
    
    @Autowired
    private BoardMapper boardMapper;
    
    @Test
    public void testGetContentList() {
        
        boardMapper.getContentList(4L);
    }
    
    @Test
    public void testContentInsert() {
        BoardVO vo = new BoardVO();
        vo.setBoard_id(4);
        vo.setContent_text("내용입니다");
        vo.setContent_title("제목입니다");
        vo.setMember_id("dummy20");
        
        boardMapper.contentInsert(vo);
        
        log.info("----------------------------");
        log.info("afrer insert" + vo.getContent_idx());
    }
    
    @Test
    public void testContentRead() {
        
        BoardVO vo = boardMapper.contentRead(21L);
        log.info(vo);
        
    }
    
    @Test
    public void testContentDelete() {
        
        int count = boardMapper.contentDelete(21L);
        log.info("count: " + count);
    }
    
    @Test
    public void testContentUpdate() {
        BoardVO vo = new BoardVO();
        vo.setContent_idx(22);
        vo.setContent_text("Updated 내용입니다");
        vo.setContent_title("Updated 제목입니다");

        log.info("count: " + boardMapper.contentUpdate(vo));
    }
    
    @Test
    public void testPaging() {
        
        Criteria cri = new Criteria();
        
        List<BoardVO> list = boardMapper.getContentListPaging(cri, 4L);
        
        list.forEach(b -> log.info(b));
    }
    
    @Test
    public void testPageVO() {
        
        Criteria cri = new Criteria();
        cri.setPageNum(11);
        
        PageVO pageVO = new PageVO(cri, 20);
        
        log.info(pageVO);
    }
}
