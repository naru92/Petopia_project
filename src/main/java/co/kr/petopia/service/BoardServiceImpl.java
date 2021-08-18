package co.kr.petopia.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.kr.petopia.mapper.AattachMapper;
import co.kr.petopia.mapper.BoardMapper;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.FileUploadVO;
import jdk.internal.org.jline.utils.Log;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@ToString
@Log4j2
public class BoardServiceImpl implements BoardService{
    
    @Autowired
    private final BoardMapper boardMapper;
    @Autowired
    private final AattachMapper aattachMapper;

    @Override
    public void contentRegister(BoardVO board) {
        
        boardMapper.contentInsert(board);
    }
    
    @Override
    public void petstagramRegister(BoardVO board) {
        
        boardMapper.contentInsert(board);
        
        board.getAttachList().forEach(attach -> {
            log.info("attach : " + attach);
            attach.setContent_idx(board.getContent_idx());
            attach.setBoard_id(4);

            aattachMapper.insertContentImage(attach);
        });
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
    public List<FileUploadVO> getImgList(BoardVO boardVO) {
        
        return aattachMapper.findByContent(boardVO);
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

	@Override
	public List<BoardVO> getQnaList(BoardVO boardVO) {
		return boardMapper.getQnaList(boardVO);
	}

	@Override
	public int deleteContent(int qna_idx) {
		
		int count = 0;
		try {
			boardMapper.deleteContentInfo(qna_idx);
		} catch (Exception e) {
			e.getMessage();
			return count;
		}
		
		count++;
		return count;
	}



	
}
