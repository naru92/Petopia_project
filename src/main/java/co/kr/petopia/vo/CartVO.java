package co.kr.petopia.vo;

import java.util.Date;
import java.util.List;


import lombok.Data;

@Data
public class CartVO {
	private int cart_id;
	private String member_id;
	private int product_idx;
	
	
	//카트총량
	private int amount;
	private List<ProductVO> productVOList;
	private int order_quantity;
}
