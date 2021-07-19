package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.FileUploadVO;

@Mapper
public interface ProductAattachMapper {

	
	public void insertProductImage(FileUploadVO fileUploadVO);
	public void deleteProductImage(String uuid);
	public List<FileUploadVO> findByProduct(int product_idx);
	public void deleteAllProductImage(int product_idx);
	
}
