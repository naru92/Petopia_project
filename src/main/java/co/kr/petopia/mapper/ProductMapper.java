package co.kr.petopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.kr.petopia.vo.FileUploadVO;
import co.kr.petopia.vo.ProductVO;

@Mapper
public interface ProductMapper {

    // 카테고리에 해당하는 상품 리스트
    List<ProductVO> getCategoryProductList(int product_category_id);
    // 상품 상세 정보
    ProductVO getProductDetail(int product_idx);
    // 파일첨부도 불러와야 하는데..?! 
    List<FileUploadVO> getProductImgList(int product_idx);
    
}
