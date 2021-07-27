package co.kr.petopia.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.CartMapper;
import co.kr.petopia.mapper.MemberMapper;
import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.OrderVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
	
	@Override
	public List<CartVO> goCart(String member_id) {
		
		log.info("get Meber cartList : " +  member_id);
		
		return cartMapper.goCart(member_id);
	}


	@Override
	public CartVO checkProductsInCart(CartVO cartVO) {
		log.info("check Products In Cart " + cartVO.getMember_id());
		
		return cartMapper.checkProductsInCart(cartVO);
	}


	@Override
	public int updateCartItem(CartVO originalCart) {
		log.info("update Cart Item");
		
		return cartMapper.updateCartItem(originalCart);
	}


	@Override
	public int addCart(CartVO cartVO) {
		log.info("add cart " + cartVO);
		
		return cartMapper.addCart(cartVO);
	}


	@Override
	public int deleteCartItem(int cart_id) {
			log.info("delete Cart Item");
		
		return cartMapper.deleteCartItem(cart_id);
	}


	@Override
	public int insertOrderLog(List<OrderVO> orderVO) {
		log.info("insert order log");

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String payDate = sdf.format(date);
		
		for(int i = 0; i < orderVO.size(); i++) {
			//카드결제 '2'
			orderVO.get(i).setPayment_method(2);
			orderVO.get(i).setOrder_date(date);
			
		}
		
		log.info("orderVO = " + orderVO);
		
		int count = 0;
		
		for(int i = 0; i < orderVO.size(); i++) {
			log.info("orderVO 정보  = " + orderVO.get(i));
			count += cartMapper.insertOrderLog(orderVO.get(i));
		}
		
		log.info("count : " + count);
		
		return count;
	}


	@Override
	public List<OrderVO> orderLogInfo(String member_id) {
		// TODO Auto-generated method stub
		return null;
	}
		
	

}
