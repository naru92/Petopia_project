package co.kr.petopia.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.MypetVO;

@Mapper
public interface MypetMapper {
    
    // 마이펫 리스트
    List<MypetVO> getMypetList();
    
    MypetVO getMypetInfo(String mypet_idx);
    
    // 마이펫 등록
    void mypetInsert(MypetVO mypet);
    
    // 마이펫 정보 수정
    int mypetUpdate (MypetVO mypet);
    
    // 마이펫 삭제
    int mypetDelete (int mypet_idx);

    String selectPassword(HashMap<String, Object> param);
}


