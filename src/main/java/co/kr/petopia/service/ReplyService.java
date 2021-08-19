package co.kr.petopia.service;

import java.util.List;

import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.ReplyVO;

public interface ReplyService {

    // 게시글 별 list
    List<ReplyVO> getReplyList(int content_idx);

    // 게시글 별 list + 페이징
    List<ReplyVO> getReplyListPaging(Criteria cri, int content_idx);

    // read
    ReplyVO getReply(int reply_idx);

    // insert
    int replyRegister(ReplyVO reply);

    // update
    int replyModify(ReplyVO reply);

    // delete
    int replyRemove(int reply_idx);

	ReplyVO getMyAnswerList(int content_idx);

	// 리뷰 insert
    int productReviewInsert(ReplyVO reply);

}
