package co.kr.petopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.AdminMapper;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.ProductVO;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public List<MemberVO> getMemberList() {
		
		return adminMapper.getMemberList();
	}

	@Override
	public List<MemberVO> getMemberListWithPaging(Criteria cri) {
		
		return adminMapper.getMemberListWithPaging(cri);
	}

	@Override
	public int getTotalMemberCount(Criteria cri) {
		
		return adminMapper.getTotalMemberCount(cri);
	}

	@Override
	public List<ProductVO> getProductListWithPaging(Criteria cri) {
		
		return adminMapper.getProductListWithPaging(cri);
	}

	@Override
	public int getTotalProductCount(Criteria cri) {
		
		return adminMapper.getTotalProductCount(cri);
	}

}
