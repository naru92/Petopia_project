package co.kr.petopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.petopia.mapper.AattachMapper;
import co.kr.petopia.mapper.AdminMapper;
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
	
	@Autowired
    public final ProductMapper productMapper;
    
	@Autowired
	AattachMapper attachMapper;

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

	@Override
	public List<ProductVO> getSerachProductList(String keyword) {
		List<ProductVO> list = productMapper.getSerachProductList(keyword);
		if(list.size() != 0) {
		for(int i=0 ; i<list.size(); i++) {
			list.get(i).setProductVOList(attachMapper.findByProduct(list.get(i).getProduct_idx()));
			}
		}
		return list;
	}

}
