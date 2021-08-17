package co.kr.petopia.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import co.kr.petopia.mapper.AattachMapper;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;

public interface BoardService {
    
    // insert
    void contentRegister(BoardVO board);
    void petstagramRegister(BoardVO board);
    
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

	//게시판 이름,정보 따오기
	List<BoardVO> getAllBoardInfo();
	
	int getTotal(Map<String, Object> pagingMap);

	List<BoardVO> getContentListPaging(Map<String, Object> pagingMap);
	
	//폼방식 수정
	void modifyContentInfo(BoardVO modifyContentVO);
	//폼방식 삭제
	void deleteContentInfo(int content_idx);
	//회원 문의 리스트
	List<BoardVO> getQnaList(BoardVO boardVO);
	//삭제메서드 성공시 1리턴
	int deleteContent(int qna_idx);

}
