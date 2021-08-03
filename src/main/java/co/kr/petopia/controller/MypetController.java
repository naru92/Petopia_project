package co.kr.petopia.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.petopia.service.MypetService;

@Controller
@RequestMapping("/mypet")
public class MypetController {
	
	@Autowired
    private MypetService mypetService;
	
	@ResponseBody
	@PostMapping("/passwordCheck")
	public String passwordCheck(@RequestParam HashMap<String, Object> param ) {
		return mypetService.selectPassword(param);
	}
	
	
}
