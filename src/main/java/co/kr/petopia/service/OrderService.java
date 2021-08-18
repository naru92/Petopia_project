package co.kr.petopia.service;


import java.util.Date;
import java.util.List;

import co.kr.petopia.vo.OrderVO;

public interface OrderService {

	// 회원
	// 해당 멤버 정보 불러오기
    OrderVO getMemberInfoRead(String member_id);
	// 장바구니 목록 불러오기
	List<OrderVO> getMemberCartList(String member_id);
	// 결제시 주문자 정보 입력(order_form)
	void memberOrderFormInsert(String member_id, int product_idx);
	// 결제시 주문자 정보 입력(order_detail)
	void memberOrderDetailInsert(int order_idx, int product_idx, String order_name,
			String order_receiver_name, String order_receiver_phonenumber, String order_receiver_address,
			int order_quantity, int payment_method, Date order_date);
	// order_form -> 주문번호 idx 불러오는 메소드
	int getMemberOrderFormCurrVal();
	// 주문 상세 정보 가져오기
	OrderVO readMemberOrderInfo();
	// 주문 리스트 가져오기
	List<OrderVO> readMemberOrderList(String member_id);

	// 비회원
	// 장바구니 목록 불러오기
	// List<CartVO> getCartList();
	// 결제시 주문자 정보 입력(order_form)
	void orderFormInsert(OrderVO orderVO);
	// 결제시 주문자 정보 입력(order_detail)
	void orderDetailInsert(OrderVO orderVO);
	// 결제시 주문자 정보 입력(users)
	void orderUserInsert(OrderVO orderVO);
	// order_form -> 주문번호 idx 불러오는 메소드
	int getOrderFormCurrVal();
	// 주문 상세 정보 가져오기
	OrderVO readOrderInfo();
	
	
	// 비회원 주문 상세정보 조회
    OrderVO usersOrderInfo(OrderVO orderVO);
}
