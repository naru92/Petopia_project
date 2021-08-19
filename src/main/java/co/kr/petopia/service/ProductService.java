package co.kr.petopia.service;

import java.util.List;

import co.kr.petopia.vo.ProductVO;

public interface ProductService {

    // 카테고리에 해당하는 상품 리스트
    List<ProductVO> getCategoryProductList(int product_category_id, int product_idx);
    // 상품 상세 정보
    ProductVO getProductDetail(int product_idx);
    
    public List<ProductVO> getSerachProductList(String keyword);

}
