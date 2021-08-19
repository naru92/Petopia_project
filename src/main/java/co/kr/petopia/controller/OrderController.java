package co.kr.petopia.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.petopia.service.CartService;
import co.kr.petopia.service.MemberService;
import co.kr.petopia.service.OrderService;
import co.kr.petopia.vo.CartVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j2
@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

    @Autowired
    private MemberService memberService;
    
    @Autowired
    private CartService cartService;
    
	// 회원
	// 회원 주문서 작성(회원일 경우 정보 불러오기)
	@GetMapping("/member/checkout")
	public String getMemberOrderForm(Model model, Principal principal, HttpSession session) {
		log.info("getOrderForm()..");
		log.info("OrderService.getCartList()..");

		MemberVO memberInfo;
	
		if (principal != null) {
			String member_id = principal.getName();
			List<CartVO> cartInfo = cartService.goCart(member_id);
			log.info("카트정보: " + cartInfo);
			
			memberInfo = memberService.getMemberInfo(member_id);
			
			model.addAttribute("memberInfo", memberInfo);
			model.addAttribute("order", orderService.getMemberCartList(member_id));
			log.info(member_id);
			
		}
		
		

		return "/order/checkout_member";
	}
	//회원 다이렉트
	@GetMapping("/member/direct/checkout")
	public String getMemberDirectOrderForm(Model model, Principal principal, HttpSession session,@RequestParam int product_idx,
			@RequestParam int amount) {
		log.info("getOrderForm()..");
		log.info("OrderService.getCartList()..");

		MemberVO memberInfo;
	
			String member_id = principal.getName();
			
			memberInfo = memberService.getMemberInfo(member_id);
			
			model.addAttribute("memberInfo", memberInfo);
			log.info(member_id);
			
		

		return "/order/checkout_member";
	}

	// 회원 주문 상세 페이지(무통장입금)
	@GetMapping("/member/confirmation_deposit")
	public String confirmation_deposit(OrderVO orderVO, Model model, Principal principal, HttpSession httpSession) {
		log.info("confirmation_deposit");
		log.info("orderService.readOrderInfo()..");
		
		String member_id = principal.getName();
		log.info("member_id = " + member_id);
		
		List<CartVO> cartInfo = cartService.goCart(member_id);
		log.info("카트정보: " + cartInfo);
		
		log.info("orderVO = " + orderService.readMemberOrderInfo());
		model.addAttribute("confirmation_deposit", orderService.readMemberOrderInfo());
		model.addAttribute("order", orderService.getMemberCartList(member_id));
		
		

		return "/order/confirmation_deposit";
	}

	// 회원 주문 상세 페이지(카드)
	@GetMapping("/member/confirmation_card")
	public String confirmation_card(OrderVO orderVO, Model model, Principal principal, HttpSession httpSession) {
		log.info("confirmation_card");
		log.info("orderService.readOrderInfo()..");

		String member_id = principal.getName();

		model.addAttribute("confirmation_card", orderService.readMemberOrderInfo());
		model.addAttribute("order", orderService.getMemberCartList(member_id));

		return "/order/confirmation_card";
	}

	// 회원 주문자 정보 입력 데이터 넘기기
	@PostMapping("/member/order-proc")
	@ResponseBody
	public String orderInsert( OrderVO orderVO, RedirectAttributes rttr, Principal principal) {
		log.info("주문입력 : " + orderVO);

		String member_id = principal.getName();

		orderService.memberOrderFormInsert(member_id, orderVO.getProduct_idx());

		orderVO.setOrder_idx(orderService.getOrderFormCurrVal());

		orderService.memberOrderDetailInsert(
								orderVO.getOrder_idx(), orderVO.getProduct_idx(),
								orderVO.getOrder_name(), orderVO.getOrder_receiver_name(),
							    orderVO.getOrder_receiver_phonenumber(), orderVO.getOrder_receiver_address(),
								orderVO.getOrder_quantity(), orderVO.getPayment_method(), orderVO.getOrder_date());

		rttr.addFlashAttribute("result", "success");

		orderService.insertDelivery(orderVO);
		orderService.insertPoint(orderVO);
		orderService.updatePoint(orderVO);
		
		
		return "success";
	}

	
	// 비회원
	// 비회원 주문서 작성(장바구니 리스트 불러오기)
	@GetMapping("/users/checkout")
	public String getOrderForm(Model model, HttpSession session) {
		log.info("getOrderForm()..");
		
		
		log.info("총가격 : " + session.getAttribute("totalPrice"));		
		String member_id = session.getId();
		List<CartVO> cartInfo = cartService.goCart(member_id);
		log.info("카트정보: " + cartInfo);
		
		model.addAttribute("cartInfo", cartInfo);
		model.addAttribute("order", orderService.getCartList(member_id));
		

		return "/order/checkout_users";
	}
	//비회원 바로구매
	@GetMapping("/users/direct/checkout")
	public String getUsersDirectOrderForm(Model model, HttpSession session, @RequestParam int product_idx, @RequestParam int amount) {
		log.info("getOrderForm()..");
		
		
		log.info("총가격 : " + session.getAttribute("totalPrice"));		
		String member_id = session.getId();
	
		
		

		return "/order/checkout_users";
	}

	// 비회원 주문 상세 페이지(무통장입금)
	@GetMapping("/users/confirmation_deposit")
	public String confirmation_deposit(OrderVO orderVO, Model model, HttpSession session) {
		log.info("confirmation_deposit");
		log.info("orderService.readOrderInfo()..");

		model.addAttribute("confirmation_deposit", orderService.readOrderInfo());

		return "/order/confirmation_deposit";
	}

	// 비회원 주문 상세 페이지(카드)
	@GetMapping("/users/confirmation_card")
	public String confirmation_card(OrderVO orderVO, Model model, HttpSession session) {
		log.info("confirmation_card");
		log.info("orderService.readOrderInfo()..");

		model.addAttribute("confirmation_deposit", orderService.readOrderInfo());

		return "/order/confirmation_card";
	}

	// 비회원 주문자 정보 입력 데이터 넘기기
	@PostMapping("/users/order-proc")
	@ResponseBody
	public String orderInsert(OrderVO orderVO, RedirectAttributes rttr) {
		log.info("order : " + orderVO);

		orderService.orderFormInsert(orderVO);

		orderVO.setOrder_idx(orderService.getOrderFormCurrVal());

		orderService.orderDetailInsert(orderVO);

		rttr.addFlashAttribute("result", "success");

		orderService.insertDelivery(orderVO);
		
		return "success";
	}
	
	
	
    // 비회원 주문상세조회 페이지
    @PostMapping("users/orderdetail")
    public String usersOrderDetail(OrderVO orderVO, Model model) throws Exception {

        System.out.println(orderVO);
        
        OrderVO usersOrderInfo = orderService.usersOrderInfo(orderVO);

        System.out.println("날짜: " + usersOrderInfo.getOrder_date_str());
        
        model.addAttribute("u", usersOrderInfo);
      
        return "order/usersOrderDetail";
    }

    // 회원 주문상세조회 페이지
    @GetMapping("member/orderdetail")
    public String memberOrderDetail(@RequestParam("order_idx") int order_idx, OrderVO orderVO, Model model, Principal principal) throws Exception {

        System.out.println(orderVO);
        String member_id = principal.getName();
        orderVO.setMember_id(member_id);
        
        OrderVO memberOrderInfo = orderService.memberOrderInfo(orderVO);
        memberOrderInfo.setMember_id(member_id);
        log.info("orderVO"+orderVO);
        
        model.addAttribute("m", memberOrderInfo);

        return "order/memberOrderDetail";
    }

}
