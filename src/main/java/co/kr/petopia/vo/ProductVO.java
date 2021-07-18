package co.kr.petopia.vo;

import java.util.List;

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
	private String product_coloroption;
	private String product_stock;
	private String product_detail_info;
	private String product_image; //file name
	private String product_review;
	
	
	private List<FileUploadVO> productVOList;
}
