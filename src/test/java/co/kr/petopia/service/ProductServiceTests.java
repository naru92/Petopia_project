package co.kr.petopia.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import co.kr.petopia.controller.BoardController;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Log4j2
public class ProductServiceTests {
        
    @Autowired
    private ProductService productService;
    
    @Test
    public void testPrint() {
        log.info(productService);
    }
    
    @Test
    public void testGetProductCategoryList() {
        productService.getCategoryProductList(1, 1).forEach(product -> log.info(product));
    }
}
