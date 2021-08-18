package co.kr.petopia.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.PointMapper;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.PointVO;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class PointServiceImpl implements PointService {
	
	@Autowired
	private PointMapper pointMapper;

	// 포인트 적립
    @Override
    public String savePoint(PointVO savepoint) {
        log.info("save point...", savepoint);
        
        return pointMapper.savePoint(savepoint);
    }
    // 포인트 사용
    @Override
    public String usePoint(PointVO usepoint) {
        log.info("use point...", usepoint);
        
        return pointMapper.usePoint(usepoint);
    }
    // 보유 포인트 업데이트
    @Override
    public int pointUpdate(String member_id) {
        log.info("point Update...", member_id);
        
        return pointMapper.pointUpdate(member_id);
    }
    // 보유 포인트 확인
    @Override
    public int retentionPoint(String member_id) {
        log.info("retention point...", member_id);
        
        return pointMapper.retentionPoint(member_id);
    }
    // 포인트 적립/사용 날짜 리스트
    @Override
    public List<PointVO> pointHistory(String member_id) {
        
        return pointMapper.pointHistory(member_id);
    }
    
    
    // 총 기부 금액 업데이트
    @Override
    public int donationUpdate(String member_id) {
        
        return pointMapper.donationUpdate(member_id);
    }
    // 총 기부 금액 조회
    @Override
    public int donationPoint(String member_id) {
        log.info("donation point...", member_id);
        
        return pointMapper.donationPoint(member_id);
    }
    // 기부 날짜 조회 리스트
    @Override
    public List<PointVO> donationHistory(String member_id) {
        
        return pointMapper.donationHistory(member_id);
    }
    // 기부 횟수 조회
    @Override
    public int countDonation(String member_id) {
        
        return pointMapper.countDonation(member_id);
    }
	@Override
	public List<PointVO> getSelectOptionList(HashMap<String, Object> optionMap) {
		return pointMapper.getSelectOptionList(optionMap);
	}
	
	

	

	
}
