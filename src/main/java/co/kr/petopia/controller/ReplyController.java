package co.kr.petopia.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import co.kr.petopia.service.ReplyService;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.ReplyVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/replies")
@RestController
@Log4j2
@AllArgsConstructor
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    // 댓글 등록
    @PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> replyCreate(@RequestBody ReplyVO reply, Principal principal) {

        log.info("ReplyVO: " + reply);
        reply.setMember_id(principal.getName());
        
        int insertCount = replyService.replyRegister(reply);

        log.info("Reply INSERT COUNT: " + insertCount);

        return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 특정 게시물의 댓글 목록 확인
    @GetMapping(value = "/pages/{content_idx}", produces = { MediaType.APPLICATION_XML_VALUE })
    public ResponseEntity<List<ReplyVO>> getReplyList(@PathVariable("content_idx") Long content_idx) {

        log.info("getReplyList..............");

        return new ResponseEntity<>(replyService.getReplyList(content_idx), HttpStatus.OK);
    }
    
    // 특정 게시물의 댓글 목록 확인 + 페이징
    @GetMapping(value = "/pages/{content_idx}/{pageNum}", 
            produces = { MediaType.APPLICATION_XML_VALUE })
    public ResponseEntity<List<ReplyVO>> getReplyListPaging(
            @PathVariable("pageNum") int pageNum,
            @PathVariable("content_idx") Long content_idx) {

        log.info("getReplyList..............");
        
        Criteria cri = new Criteria(pageNum, 10);
        
        log.info(cri);

        return new ResponseEntity<>(replyService.getReplyListPaging(cri, content_idx), HttpStatus.OK);
    }

    // 댓글 조회
    @GetMapping(value = "/{reply_idx}", produces = { MediaType.APPLICATION_XML_VALUE })
    public ResponseEntity<ReplyVO> get(@PathVariable("reply_idx") Long reply_idx) {

        log.info("getReply: " + reply_idx);

        return new ResponseEntity<>(replyService.getReply(reply_idx), HttpStatus.OK);
    }

    // 댓글 삭제
    @DeleteMapping(value = "/{reply_idx}",
            produces = {
                    MediaType.APPLICATION_XML_VALUE })
    public ResponseEntity<String> replyRemove(@PathVariable("reply_idx") Long reply_idx){
        
        log.info("replyRemove: " + reply_idx);
        
        return replyService.replyRemove(reply_idx) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    // 댓글 수정
    @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
            value = "/{reply_idx}",
            consumes = "application/json",
            produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> replyModify(@RequestBody ReplyVO vo,
                                              @PathVariable("reply_idx") int reply_idx) {
        vo.setReply_idx(reply_idx);
        
        log.info("reply_idx: " + reply_idx);
        
        log.info("replyModify: " + vo);
        
        return replyService.replyModify(vo) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        
    }
    //QNA(리턴값을 List로 하지않음, 따로만듬)
    @GetMapping(value ="/QnaAnswer/{content_idx}",
    		 produces = "text/plain;charset=UTF-8")  
	public @ResponseBody String getMyAnswerList(@PathVariable int content_idx) {
    	
		log.info("get myAnswer List...");
		log.info(content_idx);

		Gson gson = new Gson();
		
		return gson.toJson(replyService.getMyAnswerList(content_idx));
				
	}	
    
    
}