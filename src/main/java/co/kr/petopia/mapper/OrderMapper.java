package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.OrderDetailVO;
import co.kr.petopia.vo.OrderVO;

@Mapper
public interface OrderMapper{
	
	// 특정 회원의 장바구니 목록 가져오기
	List<CartVO> getCartList();

	// 결제 시 정보 입력하기 메소드(order_form)
	void orderFormInsert(OrderVO orderVO);
	
	// 결제 시 정보 입력하기 메소드(order_detail)
	void orderDetailInsert(OrderVO orderVO);
	
	// order_form -> 주문번호 idx 불러오는 메소드
	@Select("select order_seq.currval from dual")
	int getOrderFormCurrVal();
	
	// order_form -> 주문번호 idx 삭제 메소드
	void deleteOrderIdx(int order_idx);

	// 주문 상세 정보 가져오기
	OrderVO readOrderInfo();
	
}
