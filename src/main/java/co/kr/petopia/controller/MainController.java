package co.kr.petopia.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nimbusds.oauth2.sdk.http.HTTPRequest;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.service.BoardService;
import co.kr.petopia.service.CartService;
import co.kr.petopia.service.MemberService;
import co.kr.petopia.vo.ProductVO;
import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {

	@Autowired
	AdminService adminService;
	@Autowired
	CartService cartService;
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	
	
	@GetMapping("/main")
	public String mainPage(Model model, HttpSession httpSession,Principal principal) {
		if(principal == null) {
			log.info("httpSession.getId() : " + httpSession.getId());
			model.addAttribute("not_member" , httpSession.getId());
		}
		
		Random random = new Random();
		ArrayList<ProductVO> md = new ArrayList<>();
	
		/*
		 * 메인에 필요한것들
		 * 상품정보 
		 * 게시판정보
		 */
		
		
		List<ProductVO> AllProductList = adminService.getAllProductList();
	
		//MD추천제품
		List<ProductVO> allList= adminService.getAllProductList();
		int[] mdNumber = new int[2];
		
		for(int i=0; i < 2; i++) {
			
			mdNumber[i] = random.nextInt(allList.size());
		}	
		while(mdNumber[0] == mdNumber[1]) {
			mdNumber[1] = random.nextInt(allList.size());
		}
		
		
		
		//MD추천 두개만
		md.add(allList.get(mdNumber[0]));
		md.add(allList.get(mdNumber[1]));
		
		model.addAttribute("productVO", AllProductList);
		model.addAttribute("single_product", AllProductList);
		model.addAttribute("popular_product" , adminService.productListBestDesc());
		model.addAttribute("new_product" , adminService.productListDateDesc());
		model.addAttribute("md_product", md);
		model.addAttribute("notice_info" , boardService.getAllBoardInfo().get(0));//공지사항 게시판정보
		model.addAttribute("qna_info" , boardService.getAllBoardInfo().get(1)); //문의사항 게시판정보
		model.addAttribute("event_info" , boardService.getAllBoardInfo().get(2));//이벤트게시판 정보
		model.addAttribute("petsta_info" , boardService.getAllBoardInfo().get(3));//펫스타그램 게시판 정보
		
		 


		return "main";
	}

}
