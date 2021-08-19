package co.kr.petopia.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

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
	
	private int product_price;
	
	private String product_coloroption;
	
	private String product_stock;
	
	private String product_detail_info;
	
	private String product_review;

	private int amount;
	
	private String category;
	
	private List<FileUploadVO> productVOList;
	private String product_image; //file name
	private int sales;
}
