package co.kr.petopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {

    @GetMapping("/shop")
    public String shopProductList() {
        return "board/shopProductList";
    }
}
