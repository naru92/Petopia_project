package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.FileUploadVO;

@Mapper
public interface AattachMapper {

	// 상품
	public void insertProductImage(FileUploadVO fileUploadVO);
	public void deleteProductImage(String uuid);
	public List<FileUploadVO> findByProduct(int product_idx);
	public void deleteAllProductImage(int product_idx);
	
	
	// 게시판
	public void insertContentImage(FileUploadVO fileUploadVO);
    public void deleteContentImage(String uuid);
    public List<FileUploadVO> findByContent(int Content_idx);
}
