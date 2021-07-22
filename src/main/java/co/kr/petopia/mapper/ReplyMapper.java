package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.ReplyVO;

@Mapper
public interface ReplyMapper {
    
    // content_idx 기준으로 list 불러오기
    List<ReplyVO> getReplyList(Long content_id);
    
    // 게시글 별 list + 페이징
    List<ReplyVO> getReplyListPaging(@Param("cri") Criteria cri,
                                     @Param("content_idx") Long content_idx);
    
    // read
    ReplyVO getReplyRead(Long reply_idx);

    // insert
    int replyInsert(ReplyVO reply);
   
    // update
    int replyUpdate (ReplyVO reply);
    
    // delete
    int replyDelete (Long reply_idx);

}