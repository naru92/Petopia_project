package co.kr.petopia.vo;

import java.util.List;


import lombok.Data;

@Data
public class CartVO {
	private int cart_id;
	private String member_id;
	private int product_idx;
	private int amount;
	
	
	//카트총량
	private List<ProductVO> productList;
	private int order_quantity;
	private String cart_name; 
}
