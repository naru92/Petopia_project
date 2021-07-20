package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.BoardVO;

@Mapper
public interface BoardMapper {
    
    // list 불러오기
    List<BoardVO> getPetstagramList();
    
    // insert
    void insert(BoardVO board);
    
    // content_idx 기준으로 불러오기
    BoardVO read(Long content_idx);
    
    // update
    int update (BoardVO board);
    
    // delete
    int delete (Long content_idx);
}
