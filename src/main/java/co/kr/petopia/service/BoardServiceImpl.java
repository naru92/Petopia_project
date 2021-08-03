package co.kr.petopia.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.kr.petopia.mapper.BoardMapper;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;
import jdk.internal.org.jline.utils.Log;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class BoardServiceImpl implements BoardService{
    
    private final BoardMapper boardMapper;

    @Override
    public void contentRegister(BoardVO board) {
        
        boardMapper.contentInsert(board);
    }

    @Override
    public BoardVO getContent(Long content_idx) {
        
        return boardMapper.contentRead(content_idx);
    }

    @Override
    public int contentModify(BoardVO board) {
        
        return boardMapper.contentUpdate(board);
    }

    @Override
    public int contentRemove(Long content_idx) {
        
        return boardMapper.contentDelete(content_idx);
    }

    @Override
    public List<BoardVO> getContentList(Long board_id) {
        
        return boardMapper.getContentList(board_id);
    }

    @Override
    public List<BoardVO> getContentListPaging(Criteria cri, Long board_id) {

        return boardMapper.getContentListPaging(cri, board_id);
    }

    @Override
    public int getTotal(Criteria cri, Long board_id) {

        return boardMapper.getTotalCount(cri, board_id);
    }

	@Override
	public String getBoardInfo(long board_idx) {
		// TODO Auto-generated method stub
		return boardMapper.getBoardInfo(board_idx);
	}

	@Override
	public int getTotal(Map<String, Object> pagingMap) {
		return boardMapper.getTotalCount2(pagingMap);
	}

	@Override
	public List<BoardVO> getContentListPaging(Map<String, Object> pagingMap) {
		return boardMapper.getContentListPaging1(pagingMap);
	}

	@Override
	public void modifyContentInfo(BoardVO modifyContentVO) {
		boardMapper.modifyContentInfo(modifyContentVO);
		
	}

	@Override
	public void deleteContentInfo(int content_idx) {
		boardMapper.deleteContentInfo(content_idx);
	}

	@Override
	public List<BoardVO> getAllBoardInfo() {
		return boardMapper.getAllBoardInfo();
	}
    
}
