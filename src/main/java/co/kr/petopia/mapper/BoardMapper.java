package co.kr.petopia.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;

@Mapper
public interface BoardMapper {

    // list 불러오기
    List<BoardVO> getContentList(Long board_id);
    
    // list 불러오기 + 페이징
    List<BoardVO> getContentListPaging(Criteria cri, Long board_id);

    // content_idx 기준으로 불러오기
    BoardVO contentRead(Long content_idx);

    // insert
    void contentInsert(BoardVO board);

    // update
    int contentUpdate(BoardVO board);

    // delete
    int contentDelete(Long content_idx);
    
    public int getTotalCount(Criteria cri, Long board_id);
    
    //게시판 이름
	String getBoardInfo(long board_idx);
	//게시판 번호/이름 따오기
	List<BoardVO> getAllBoardInfo();

	int getTotalCount2(Map<String, Object> pagingMap);

	List<BoardVO> getContentListPaging1(Map<String, Object> pagingMap);
	//form update
	void modifyContentInfo(BoardVO modifyContentVO);
	//form delete
	void deleteContentInfo(int content_idx);
	//get my qnaList 
	List<BoardVO> getQnaList(BoardVO boardVO);

	
}
