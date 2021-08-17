package co.kr.petopia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.petopia.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
public class ProductController {
    
    @Autowired
    public final ProductService productService;

    @GetMapping("/shop")
    public String getCategoryProductList() {
        return "product/shopProductList";
    }
    
    @GetMapping("/shopDetail")
    public String getProductDetail(/*@RequestParam("product_idx") int product_idx,*/ Model model) {
        
        //model.addAttribute("product", productService.getProductDetail(product_idx));

        return "product/shopProductDetail";
    }
    
}
