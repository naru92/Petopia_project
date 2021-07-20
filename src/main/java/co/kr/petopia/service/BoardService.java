package co.kr.petopia.service;

import java.util.List;

import co.kr.petopia.vo.BoardVO;

public interface BoardService {
    
    
    // insert
    void contentRegister(BoardVO board);
    
    // read
    BoardVO getContent(Long content_idx);

    // update
    int contentModify(BoardVO board);
    
    // delete
    int contentRemove(Long content_idx);
    
    // list
    List<BoardVO> getContentList(Long board_id);
}
