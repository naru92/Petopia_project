package co.kr.petopia.service;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.kr.petopia.mapper.BoardMapper;
import co.kr.petopia.vo.BoardVO;
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
    
}