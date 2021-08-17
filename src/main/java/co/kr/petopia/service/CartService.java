package co.kr.petopia.service;

import java.util.List;

import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.OrderVO;

public interface CartService {
	
	//카트리스트
	public List<CartVO> goCart(String member_id);
	//중복된 카트 물건 확인
	public CartVO checkProductsInCart(CartVO cartVO);
	//카트갱신
	public int updateCartItem(CartVO originalCart);
	//카트추가
	public int addCart(CartVO cartVO);
	//카트삭제
	public int deleteCartItem(int cart_id);
	
	public int deleteWishList(int cart_id);
	
	public int insertOrderLog(List<OrderVO> orderVO);
	
	public List<OrderVO> orderLogInfo(String member_id);
	
	public int addWish(CartVO cartVO);
	//카트리스트 보기
	public List<CartVO> getWishList(String member_id);
	
}
