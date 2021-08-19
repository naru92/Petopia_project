package co.kr.petopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.service.ProductService;
import co.kr.petopia.vo.ProductVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
public class ProductController {
    @Autowired
    AdminService adminService;
	
    @Autowired
    public final ProductService productService;

    @GetMapping("/shop")
    public String getCategoryProductList(Model model) {
    List<ProductVO> productList	= adminService.getAllProductList();
    model.addAttribute("productList" , productList);
    return "product/shopProductList";
    }
    
    @GetMapping("/shop/search")
    public String getSearchProductList(Model model, @RequestParam String keyword) {
    List<ProductVO> productList = productService.getSerachProductList(keyword);
    log.info("검색리스트 : " + productList);
    model.addAttribute("productList" , productList);
    return "product/shopProductList";
    }
    
    @GetMapping("/shopDetail")
    public String getProductDetail(@RequestParam("product_idx") int product_idx, Model model) {
        
    	ProductVO product= adminService.getProductOne(product_idx);
    	log.info("상품 : " + product);
    	
    	model.addAttribute("product", product);
        //model.addAttribute("product", productService.getProductDetail(product_idx));

        return "product/shopProductDetail";
    }
    
    @GetMapping("/shop/category")
    public String getCategoryDetail(Model model , @RequestParam String category) {
    	
    	List<ProductVO> productList = productService.getCateGoryProductList(category);
        log.info("검색리스트 : " + productList);
        model.addAttribute("productList" , productList);
        
        return "product/shopProductList";
    }
}
