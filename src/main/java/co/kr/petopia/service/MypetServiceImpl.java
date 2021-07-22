package co.kr.petopia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.MypetMapper;
import co.kr.petopia.vo.MypetVO;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Service
@RequiredArgsConstructor
@ToString
public class MypetServiceImpl implements MypetService {

    private final MypetMapper mypetMapper;

    // 목록
    @Override
    public List<MypetVO> getMypetList() {
        
        return mypetMapper.getMypetList();
    }
    
    // 등록
    @Override
    public void mypetRegister(MypetVO mypet) {

        mypetMapper.mypetInsert(mypet);
    }

    // 수정
    @Override
    public int mypetModify(MypetVO mypet) {

        return mypetMapper.mypetUpdate(mypet);
    }

    // 삭제
    @Override
    public int mypetRemove(int mypet_idx) {

        mypetMapper.mypetDelete(mypet_idx);

        return 1;
    }

}
