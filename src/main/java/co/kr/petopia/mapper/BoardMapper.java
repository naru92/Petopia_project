package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.BoardVO;

@Mapper
public interface BoardMapper {
    
    // list 불러오기
    List<BoardVO> getContentList(Long board_id);
    
    // insert
    void contentInsert(BoardVO board);
    
    // content_idx 기준으로 불러오기
    BoardVO contentRead(Long content_idx);
    
    // update
    int contentUpdate (BoardVO board);
    
    // delete
    int contentDelete (Long content_idx);

}
