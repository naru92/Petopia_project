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
	private boolean filetype;
	private String product_image;
	
	
	private Integer board_id;
	private int product_idx;
	
	
	
}
