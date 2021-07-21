package co.kr.petopia.service;

import java.util.List;

import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.OrderVO;


public interface OrderService {
	// 장바구니 목록 불러오기
	List<CartVO> getCartList();

	// 결제시 주문자 정보 입력(order_form)
	void orderFormInsert(OrderVO orderVO);

	// 결제시 주문자 정보 입력(order_detail)
	void orderDetailInsert(OrderVO orderVO);
	
	// order_form -> 주문번호 idx 불러오는 메소드
	int getOrderFormCurrVal();
	
	// order_form -> 주문번호 idx 삭제 메소드
	void deleteOrderIdx(int order_idx);
	
}
