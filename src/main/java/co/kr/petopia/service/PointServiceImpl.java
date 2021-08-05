package co.kr.petopia.service;

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

	
    @Override
    public List<PointVO> getPointList() {
        
        return pointMapper.getPointList();
    }

    @Override
    public int savePoint(PointVO savepoint) {
        
        log.info("save point...", savepoint);
        
        return pointMapper.savePoint(savepoint);
        
    }

    @Override
    public int usePoint(PointVO usepoint) {
        
        log.info("use point...", usepoint);
        
        return pointMapper.usePoint(usepoint);
        
    }

    @Override
    public int retentionPoint(MemberVO point) {
        
        log.info("retention point...", point);
        
        return pointMapper.retentionPoint(point);
    }
    
    @Override
    public int donationPoint(MemberVO donation) {
        
        log.info("donation point...", donation);
        
        return pointMapper.donationPoint(donation);
    }
	
	

	

	
}
