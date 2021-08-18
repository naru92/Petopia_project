package co.kr.petopia.mapper;

import java.util.Date;
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
	void memberOrderFormInsert(String member_id, int product_idx);

	// 결제 시 정보 입력하기 메소드(order_detail)
	void memberOrderDetailInsert(int order_idx, int product_idx, String order_name,
			String order_receiver_name, String order_receiver_phonenumber, String order_receiver_address,
			int order_quantity, int payment_method, Date order_date);

	// order_form -> 주문번호 idx 불러오는 메소드
	@Select("select order_seq.currval from dual")
	int getMemberOrderFormCurrVal();

	// 주문 상세 정보 가져오기
	OrderVO readMemberOrderInfo();
	
	// 포인트 테이블 멤버 아이디 찾기
	@Select("select count(*) from member where member_id = #{member_id}")
	int readMemberId(OrderVO orderVO);
	
	// 포인트 추가
	void insertPoint(OrderVO orderVO);
	
	// 멤버 테이블 포인트 업데이트
	void updateMemberPoint(OrderVO orderVO);
	
	// 포인트 업데이트
	void updatePoint(OrderVO orderVO);
	
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
