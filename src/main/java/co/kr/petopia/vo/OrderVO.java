package co.kr.petopia.vo;

import java.util.Date;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
	
	// MEMBER
	private String member_name;
	private String member_phoneNumber;
	private String member_address;
	
	private int order_idx;
	private int product_idx;
	private String member_id;
	private Date order_date;
	private int payment_method;
	private String product_name;
	private String product_coloroption;
	private String product_price;
	private int cart_id;
	private String product_detail_info;

	// POINT
	private int member_point_savepoint; // 적립 포인트
	private String member_point_savedetail; // 적립 내역
	private Date member_point_savedate; // 적립 날짜
	private int member_point;

	// USERS
	private String user_name;
	private String user_phonenumber;
	private String user_address;

	private String order_name;
	private String order_receiver_name;
	private String order_receiver_phonenumber;
	private String order_receiver_address;
	private int order_quantity;
	private int order_price;
	private List<ProductVO> productList;

}
