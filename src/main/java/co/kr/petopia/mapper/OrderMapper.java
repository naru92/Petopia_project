package co.kr.petopia.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.ProductVO;

@Mapper
public interface OrderMapper{
	
	// 특정 회원의 장바구니 목록 가져오기
	List<CartVO> getCartList();

	
	
}
