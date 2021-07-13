package co.kr.petopia.vo;

import java.util.Date;

import lombok.Data;


@Data
public class OrderVO {

	private int order_idx;
	private String order_name;
	private int member_id;
	private Date order_date;
	private int payment_method;
	
	
	private int product_stock;
	private int product_price;
	private int product_category_id;
	private int product_idx;
	private String order_receiver_name;
	private String order_receiver_phonenumber;
	private String order_receiver_address;
	private int order_quantity;
	private int order_price;
	
	
	
}
