package co.kr.petopia.service;

import java.util.HashMap;
import java.util.List;

import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.PointVO;

public interface PointService {
    
    // 포인트 적립
    String savePoint(PointVO savepoint);
    
    // 포인트 사용
    String usePoint(PointVO usepoint);
    
    // 보유 포인트 업데이트
    int pointUpdate(String member_id);
    
    // 보유 포인트 확인
    int retentionPoint(String member_id);
    
    // 포인트 적립/사용 내역 리스트
    List<PointVO> pointHistory(String member_id);

    
    // 총 기부 금액 업데이트
    int donationUpdate(String member_id);
    
    // 총 기부 금액 확인
    int donationPoint(String member_id);
    
    // 기부 날짜 조회 리스트
    List<PointVO> donationHistory(String member_id);

    // 기부 횟수 조회
    int countDonation(String member_id);
	
    //월별 기부
   	List<PointVO> getSelectOptionList(HashMap<String, Object> optionMap);
}
