package co.kr.petopia.service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.OrderMapper;
import co.kr.petopia.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	// 회원
	// 회원 정보 조회
	@Override
	public OrderVO getMemberInfoRead(String member_id) {
		// TODO Auto-generated method stub
		return orderMapper.getMemberInfoRead(member_id);
	}

	// 결제 시 장바구니 목록 처리 함수
	@Override
	public List<OrderVO> getMemberCartList(String member_id) {

		return orderMapper.getMemberCartList(member_id);
	}

	// 주문자 정보 입력 처리 함수
	@Override
	public void memberOrderFormInsert(String member_id, int product_idx) {

		orderMapper.memberOrderFormInsert(member_id, product_idx);

	}

	// 주문자 정보 입력 처리 함수
	@Override
	public void memberOrderDetailInsert(int order_idx, int product_idx, String order_name,
			String order_receiver_name, String order_receiver_phonenumber, String order_receiver_address,
			int order_quantity, int payment_method, Date order_date) { 

		orderMapper.memberOrderDetailInsert(order_idx, product_idx, order_name, order_receiver_name,
				order_receiver_phonenumber, order_receiver_address, order_quantity, payment_method, order_date);

	}

	// order_form -> 주문번호 idx 불러오는 메소드
	@Override
	public int getMemberOrderFormCurrVal() {

		return orderMapper.getOrderFormCurrVal();

	}

	// 주문 상세 정보 가져오기
	@Override
	public OrderVO readMemberOrderInfo() {

		return orderMapper.readMemberOrderInfo();

	}
	
	// 주문 리스트 가져오기
	@Override
	public List<OrderVO> readMemberOrderList(String member_id) {
	    
	    return orderMapper.readMemberOrderList(member_id);
	}

	// 비회원
	// 결제 시 장바구니 목록 처리 함수
//	@Override
//	public List<CartVO> getCartList() {
//
//		return orderMapper.getCartList();
//	}

	// 주문자 정보 입력 처리 함수
	@Override
	public void orderFormInsert(OrderVO orderVO) {

		orderMapper.orderFormInsert(orderVO);

	}

	// 주문자 정보 입력 처리 함수
	@Override
	public void orderDetailInsert(OrderVO orderVO) {

		orderVO.setOrder_name(orderVO.getUser_name());
		
		orderMapper.orderDetailInsert(orderVO);

	}
	
	// 주문자 정보 입력 처리 함수
	@Override
	public void orderUserInsert(OrderVO orderVO) {
		
		orderVO.setUser_name(orderVO.getOrder_name());
		orderVO.setUser_phonenumber(orderVO.getOrder_receiver_phonenumber());
		orderVO.setUser_address(orderVO.getOrder_receiver_address());
		
		orderMapper.orderUserInsert(orderVO);
		
	}

	// order_form -> 주문번호 idx 불러오는 메소드
	@Override
	public int getOrderFormCurrVal() {

		return orderMapper.getOrderFormCurrVal();

	}


	// 주문 상세 정보 가져오기
	@Override
	public OrderVO readOrderInfo() {

		return orderMapper.readOrderInfo();

	}

	
	// 비회원 상세정보 조회
    @Override
    public OrderVO usersOrderInfo(OrderVO orderVO) {
        
        return orderMapper.usersOrderInfo(orderVO);
    }


}
