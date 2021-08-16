package co.kr.petopia.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public int addCart(CartVO cartVO) {
		log.info("add cart " + cartVO);
		
		cartVO.setCart_id(cartMapper.nextVal());
		cartVO.setCart_name("장바구니");
		cartMapper.insertCartType(cartVO);
		
		
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


	@Override
	public int addWish(CartVO cartVO) {
		log.info("add wish " + cartVO);
		
		cartVO.setCart_id(cartMapper.nextVal());
		cartVO.setCart_name("위시리스트");
		cartMapper.addWishType(cartVO);
		
		
		return cartMapper.addWish(cartVO);
	}


	@Override
	public List<CartVO> getWishList(String member_id) {
		log.info("get wish for member : " + member_id);
		return cartMapper.getWishList(member_id);
	}


	@Override
	public int deleteWishList(int cart_id) {
		log.info("delete Cart Item");
		
		return cartMapper.deleteCartItem(cart_id);
	}

	
	
	
	
		



		
	

}
