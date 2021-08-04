package co.kr.petopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import co.kr.petopia.mapper.AdminMapper;
import co.kr.petopia.mapper.OrderMapper;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.vo.BoardVO;
import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.DeliveryVO;
import co.kr.petopia.vo.DonationVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderDetailVO;
import co.kr.petopia.mapper.OrderMapper;
import co.kr.petopia.vo.CartVO;

import co.kr.petopia.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	// 결제 시 장바구니 목록 처리 함수
	@Override
	public List<CartVO> getCartList() {
		
		return orderMapper.getCartList();
	}

	// 주문자 정보 입력 처리 함수
	@Override
	public void orderFormInsert(OrderVO orderVO) {
		
		orderMapper.orderFormInsert(orderVO);
		
	}

	// 주문자 정보 입력 처리 함수
	@Override
	public void orderDetailInsert(OrderVO orderVO) {
		
		orderMapper.orderDetailInsert(orderVO);
		
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
}
