package co.kr.petopia.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.controller.BoardController;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Log4j2
public class BoardServiceTests {
        
    @Autowired
    private BoardService boardService;
    
    @Test
    public void testPrint() {
        log.info(""+boardService);
    }
    
    @Test
    public void testGetContentList() {
        boardService.getContentList(4L).forEach(board -> log.info(board));;
    }
}
