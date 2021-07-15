package co.kr.petopia.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	
	private int product_idx;
	private String product_name;
	private int product_category_id;
	private long product_price;
	private String product_colorOption;
	private String product_stock;
	private String product_detail_info;
	private String product_image;
	private String product_review;
}
