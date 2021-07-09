package co.kr.petopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.AdminMapper;
import co.kr.petopia.vo.MemberVO;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public List<MemberVO> getMemberList() {
		
		return adminMapper.getMemberList();
	}

}
