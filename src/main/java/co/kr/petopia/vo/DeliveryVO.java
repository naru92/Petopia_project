package co.kr.petopia.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class DeliveryVO {
	private int delivery_idx;
	private String product_name;
	private String order_receiver_name;
	private String order_receiver_phonenumber; 
	private String order_receiver_address; 
	private String delivery_state;
	
	private Date delivery_date;
	private String order_name;
	private int order_idx;
	private int order_quantity;
}
