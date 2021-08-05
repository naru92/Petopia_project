package co.kr.petopia.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.PointVO;

@Mapper
public interface PointMapper {
    
    List<PointVO> getPointList();
	
    // 포인트 적립
    int savePoint(PointVO savepoint);
    
    // 포인트 사용
    int usePoint(PointVO usepoint);
    
    // 보유 포인트 확인
    int retentionPoint(MemberVO point);
    
    // 총 기부 금액 확인
    int donationPoint(MemberVO donation);
    
}


