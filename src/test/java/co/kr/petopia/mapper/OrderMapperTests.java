package co.kr.petopia.mapper;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.PointVO;
import jdk.internal.org.jline.utils.Log;

@SpringBootTest
class OrderMapperTests {

	@Autowired
	private OrderMapper orderMapper;

	// 결제 시 주문자 정보 입력 테스트(order_form)
	@Test
	public void testOrderFormInsert() {
		
		OrderVO vo = new OrderVO();
		
		// orderform
		vo.setProduct_idx(3);
		vo.setMember_id("dummy27");
		
		// orderMapper.orderFormInsert(vo);
		
		orderMapper.memberOrderFormInsert(null, 0);
		
		
		int orderCurrVal = orderMapper.getOrderFormCurrVal();
		
		vo.setOrder_idx(orderCurrVal);
		vo.setOrder_name("test1");
		//vo.setProduct_idx(5);
		vo.setOrder_receiver_name("test1");
		vo.setOrder_receiver_phonenumber("test1");
		vo.setOrder_receiver_address("test1");
		vo.setOrder_quantity(3);
		vo.setPayment_method(1);
		
		// orderMapper.orderDetailInsert(vo);
		
		orderMapper.memberOrderDetailInsert(orderCurrVal, orderCurrVal, null, null, null, null, orderCurrVal, orderCurrVal, null);
		

		//System.out.println("sysout" + orderCurrVal);
	}

	// 결제 시 주문자 정보 입력 테스트(order_detail)
	@Test
	public void testOrderDetailInsert() {
		
		int orderCurrVal = orderMapper.getOrderFormCurrVal();
		System.out.println("sysout " + orderCurrVal);
		/*
		 * OrderVO vo = new OrderVO();
		 * 
		 * // orderdetail vo.setOrder_name("test1"); vo.setProduct_idx(5);
		 * vo.setOrder_receiver_name("test1");
		 * vo.setOrder_receiver_phonenumber("test1");
		 * vo.setOrder_receiver_address("test1"); vo.setOrder_quantity(3);
		 * vo.setPayment_method(1);
		 * 
		 * orderMapper.orderDetailInsert(vo);
		 */
	}
	
	@Test
	public void testMemberOrderInfo() {
		orderMapper.readMemberOrderInfo();
	
	}
	
	@Test
    public void testMemberOrderList() {
        orderMapper.readMemberOrderList("dummy23");
    
    }
	
	@Test
	public void testGetMemberCartList() {
		CartVO vo = new CartVO();
		vo.setMember_id("dummy20");
		List<OrderVO> getMemberCartList = orderMapper.getMemberCartList("dummy20");
		System.out.println(getMemberCartList);
	}
	
	// 포인트 추가
	@Test
	public void testInsertPoint() {
		PointVO vo = new PointVO();
		vo.setMember_id("dummy30");
		vo.setMember_point_savedetail("100");
	}
	
	// 포인트 업데이트
	@Test
	public void testUpdatePoint() {
		PointVO vo = new PointVO();
		vo.setMember_id("dummy30");
		vo.setMember_point_savepoint(0);
	}
	
	// 회원 정보 불러오기 테스트
	@Test
	public void testGetMemberinfo() {
		orderMapper.getMemberInfoRead("dummy20");
	}
	
	// 비회원 주문 테스트
	@Test
	public void testUsersOrder() {
		OrderVO vo = new OrderVO();
		// orderform
		vo.setProduct_idx(3);
		vo.setUser_name("테스트");

		orderMapper.orderFormInsert(vo);
		
		int orderCurrVal = orderMapper.getOrderFormCurrVal();
		
		vo.setOrder_idx(orderCurrVal);
		//vo.setProduct_idx(5);
		vo.setOrder_name(vo.getUser_name());
		vo.setOrder_receiver_name("usertest");
		vo.setOrder_receiver_phonenumber("usertest");
		vo.setOrder_receiver_address("usertest");
		vo.setOrder_quantity(3);
		vo.setPayment_method(1);
		
		// users
		vo.setUser_phonenumber(vo.getOrder_receiver_phonenumber());
		vo.setUser_address(vo.getOrder_receiver_address());
	
		orderMapper.orderDetailInsert(vo);
		orderMapper.orderUserInsert(vo);
	}
	
	
}
