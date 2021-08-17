package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import co.kr.petopia.vo.OrderVO;

@Mapper
public interface OrderMapper {

	// 회원
	// 해당 멤버 정보 가지고오기
	OrderVO getMemberInfoRead(String member_id);
	
	// 회원의 장바구니 목록 가져오기
	List<OrderVO> getMemberCartList(String member_id);

	// 결제 시 정보 입력하기 메소드(order_form)
	void memberOrderFormInsert(String member_id);

	// 결제 시 정보 입력하기 메소드(order_detail)
	void memberOrderDetailInsert(String member_id);

	// order_form -> 주문번호 idx 불러오는 메소드
	@Select("select order_seq.currval from dual")
	int getMemberOrderFormCurrVal();

	// 주문 상세 정보 가져오기
	OrderVO readMemberOrderInfo(String member_id);

	
	
	// 비회원
	// 회원의 장바구니 목록 가져오기
	

	// 결제 시 정보 입력하기 메소드(order_form)
	void orderFormInsert(OrderVO orderVO);

	// 결제 시 정보 입력하기 메소드(order_detail)
	void orderDetailInsert(OrderVO orderVO);

	// order_form -> 주문번호 idx 불러오는 메소드
	@Select("select order_seq.currval from dual")
	int getOrderFormCurrVal();

	// 결제 시 정보 입력하기 메소드(users)
	void orderUserInsert(OrderVO orderVO);
	
	// 주문 상세 정보 가져오기
	OrderVO readOrderInfo();
}
