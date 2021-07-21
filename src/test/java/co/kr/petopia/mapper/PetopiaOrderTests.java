package co.kr.petopia.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.mapper.OrderMapper;
import co.kr.petopia.vo.OrderVO;

@SpringBootTest
class PetopiaOrderTests {

	@Autowired
	private OrderMapper orderMapper;

	// 결제 시 주문자 정보 입력 테스트(order_form)
	@Test
	public void testOrderFormInsert() {
		
		
		OrderVO vo = new OrderVO();
		// orderform
		vo.setProduct_idx(3);
		vo.setMember_id("dummy27");

		orderMapper.orderFormInsert(vo);
		
		int orderCurrVal = orderMapper.getOrderFormCurrVal();
		
		vo.setOrder_idx(orderCurrVal);
		vo.setOrder_name("test1");
		//vo.setProduct_idx(5);
		vo.setOrder_receiver_name("test1");
		vo.setOrder_receiver_phonenumber("test1");
		vo.setOrder_receiver_address("test1");
		vo.setOrder_quantity(3);
		vo.setPayment_method(1);
		
		orderMapper.orderDetailInsert(vo);
		

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

}
