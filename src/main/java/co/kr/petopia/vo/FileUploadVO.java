package co.kr.petopia.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileUploadVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean imageType;
	private String product_image;
	
	
	private Long board_id;
	private int product_idx;
	
	
	
}
