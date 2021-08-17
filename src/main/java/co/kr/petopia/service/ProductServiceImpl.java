package co.kr.petopia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.ProductMapper;
import co.kr.petopia.vo.ProductVO;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
@ToString
public class ProductServiceImpl implements ProductService{

    public final ProductMapper productMapper;

    @Override
    public List<ProductVO> getCategoryProductList(int product_category_id, int product_idx) {
        productMapper.getProductImgList(product_idx);
        return productMapper.getCategoryProductList(product_category_id);
    }

    @Override
    public ProductVO getProductDetail(int product_idx) {
        productMapper.getProductImgList(product_idx);
        return productMapper.getProductDetail(product_idx);
    }

}
