package co.kr.petopia.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.service.CartService;
import co.kr.petopia.service.MemberService;
import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {
	
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private CartService cartService;
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping("/cartpage")
	public String showPage() {
		return "order/cart";
	}
	
	//카트 목록가져오기
	@GetMapping("/cart")
	public void goCart(Principal principal, Model model) {
		
		
		principal.getName();
		MemberVO memberInfo = new MemberVO();
		
		if(principal != null) {
			memberInfo = memberService.getMemberInfo(principal.getName());
			log.info("cart page " + principal.getName());
			
			String member_id = memberInfo.getMember_id();
			
			log.info("member_id = " + member_id);
			
			List<CartVO> cartList = cartService.goCart(member_id);
			
			log.info("cartList = " + cartList);
			
			model.addAttribute("cart", cartList);
			
			// 총 가격
			int totalPrice = 0;
			
		
			//카트 총가격 구하기
			for(int i = 0; i < cartList.size(); i++) {
			
				totalPrice += cartList.get(i).getProductVOList().get(0).getProduct_price() * cartList.get(i).getAmount();
			} 
			
			log.info("TotalPrice : " + totalPrice);
			
			model.addAttribute("totalPrice", totalPrice);
			
			// 회원 정보
			MemberVO memberVO = memberService.getMemberInfo(principal.getName());
			
			log.info("memberInfo = " + memberVO);
			
			//모델에 이름 넘기기
			model.addAttribute("member", memberVO);
			
			}
		
		
	}
	//사용자 카트 목록추가
	@PostMapping(value = "/addCart", 
			consumes = "application/json", 
			produces = { MediaType.APPLICATION_XML_VALUE, 
			MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public ResponseEntity<String> addCart(@RequestBody CartVO cartVO, Principal principal) {
		
		log.info("add cart " + cartVO);

		MemberVO memberInfo= memberService.getMemberInfo(principal.getName());
		
		cartVO.setMember_id(memberInfo.getMember_id());
		
		log.info(cartVO.getMember_id()+ " " + cartVO.getProduct_idx());
		
		CartVO originalCart = cartService.checkProductsInCart(cartVO);
		
		int count = 0;
		
		if(originalCart != null) {
			log.info("cart = " + originalCart);
			// 원래 양에 받아온 카트 + 사용자가 추가한 카트 더해줘야함
			originalCart.setAmount(originalCart.getAmount() + cartVO.getAmount());
			count = cartService.updateCartItem(originalCart);
		} else {
			count = cartService.addCart(cartVO);	
		}
		
		return count == 1 
				? new ResponseEntity<> ("success", HttpStatus.OK)
				: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value="/deleteCartItem", 
			consumes = "application/json", 
			produces = { MediaType.APPLICATION_XML_VALUE, 
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public ResponseEntity<String> deleteCartItem(@RequestBody int cart_id) {
		
		log.info("cartID = " + cart_id);
		int count = cartService.deleteCartItem(cart_id);
		
		return count == 1
				? new ResponseEntity<> ("success", HttpStatus.OK)
				: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping(value="/afterPurchase", 
			consumes = "application/json", 
			produces = { MediaType.APPLICATION_XML_VALUE, 
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public ResponseEntity<String> afterPurchase(@RequestBody List<OrderVO> orderVO, Principal principal) {
		
		log.info("insert order info");
		
		log.info("orderVO = " + orderVO);
		
		MemberVO memberInfo = memberService.getMemberInfo(principal.getName());

		for(int i = 0; i < orderVO.size(); i++) {
			orderVO.get(i).setMember_id(memberInfo.getMember_id());
		}
		
		int count = cartService.insertOrderLog(orderVO);

		return count == orderVO.size()
				? new ResponseEntity<> ("success", HttpStatus.OK)
				: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/OrderLog")
	public void orderLogInfo(Principal principal, Model model) {
		
		log.info("order log info");
		
		MemberVO memberInfo = memberService.getMemberInfo(principal.getName());
		
		List<OrderVO> orderLog = cartService.orderLogInfo(memberInfo.getMember_id());

		log.info("orderLog = " +orderLog);

		model.addAttribute("orderLog", orderLog);
		
	}
	
}
