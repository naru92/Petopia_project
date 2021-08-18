package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.OrderVO;

@Mapper
public interface CartMapper {
	
	public List<CartVO> goCart(String member_id);
	
	public CartVO checkProductsInCart(CartVO cartVO);

	public int updateCartItem(CartVO originalCart);

	public int addCart(CartVO cartVO);
	
	public int addWishList(CartVO cartVO);

	public int deleteCartItem(int cart_id);
	
	public int deleteWishList(int cart_id);
	
	public int insertOrderLog(OrderVO orderVO);
	
	public void insertCartType(CartVO cartVO);
	
	public int nextVal();

	public List<CartVO> getWishList(String member_id);
	
	public int addWish(CartVO cartVO);
	
	public void addWishType(CartVO cartVO);
}
