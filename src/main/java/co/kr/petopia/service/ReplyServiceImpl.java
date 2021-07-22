package co.kr.petopia.service;


import java.util.List;

import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.ReplyMapper;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.ReplyVO;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@ToString
@Log4j2
public class ReplyServiceImpl implements ReplyService{
    
    private final ReplyMapper replyMapper;

    @Override
    public List<ReplyVO> getReplyList(Long content_idx) {
        
        return replyMapper.getReplyList(content_idx);
    }
    
    @Override
    public List<ReplyVO> getReplyListPaging(Criteria cri, Long content_idx) {
        
        log.info("get Reply List of a Board with paging" + content_idx + cri);
        
        return replyMapper.getReplyListPaging(cri, content_idx);
    }

    
    @Override
    public ReplyVO getReply(Long reply_idx) {
        
        log.info("get......." + reply_idx);
        
        return replyMapper.getReplyRead(reply_idx);
    }

    
    @Override
    public int replyRegister(ReplyVO reply) {
        
        log.info("register......." + reply);
        
        return replyMapper.replyInsert(reply);
    }


    @Override
    public int replyModify(ReplyVO reply) {
        
        log.info("modify......." + reply);
        
        return replyMapper.replyUpdate(reply);
    }

    @Override
    public int replyRemove(Long reply_idx) {
        
        return replyMapper.replyDelete(reply_idx);
    }

}
