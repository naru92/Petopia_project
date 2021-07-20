package co.kr.petopia.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class BoardServiceTests {
        
    @Autowired
    private BoardService boardService;
    
    @Test
    public void testPrint() {
        log.info(""+boardService);
    }
}
