package co.kr.petopia.service;

import java.util.List;
import java.util.Map;

import co.kr.petopia.utils.Criteria;
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
    
    // list + paging
    List<BoardVO> getContentListPaging(Criteria cri, Long board_id);
    
    // count
    public int getTotal(Criteria cri, Long board_id);
    
    //게시판 이름 가져오기
	String getBoardInfo(long board_idx);

	int getTotal(Map<String, Object> pagingMap);

	List<BoardVO> getContentListPaging(Map<String, Object> pagingMap);
}
