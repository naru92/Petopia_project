package co.kr.petopia.service;

import java.util.List;

import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.ProductVO;

public interface AdminService {
	/*맴버*/
	public List<MemberVO> getMemberList();
	public List<MemberVO> getMemberListWithPaging(Criteria cri);
	public int getTotalMemberCount(Criteria cri);
	
	
	/*상품*/	
	public List<ProductVO> getProductListWithPaging(Criteria cri);
	public int getTotalProductCount(Criteria cri);
}
