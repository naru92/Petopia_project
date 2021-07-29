package co.kr.petopia.controller;

import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@SpringBootTest
@AutoConfigureMockMvc
@Log4j2
public class MemberControllerTests {
    
    @Setter(onMethod_ = {@Autowired})
    private WebApplicationContext ctx;
    
    @Autowired
    private MockMvc mockMvc;
    
    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }
    
    @Test
    public void tsetList() throws Exception{
        
        log.info(
                mockMvc.perform(MockMvcRequestBuilders.get("/petstagram"))
                .andReturn()
                .getModelAndView()
                .getModelMap());
    }
    
    @Test
    public void tsetRegister() throws Exception{
        
        log.info(
                mockMvc.perform(MockMvcRequestBuilders.post("/petstagram/register")
                        .param("board_id", "4")
                        .param("content_text", "내용입니다")
                        .param("content_title", "제목입니다")
                        .param("member_id", "dummy84")
                        )
                .andReturn()
                .getModelAndView()
                .getModelMap());
    }
}
