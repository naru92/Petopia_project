package co.kr.petopia.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import co.kr.petopia.service.AdminService;
import co.kr.petopia.service.MemberService;
import co.kr.petopia.service.MypetService;
import co.kr.petopia.service.OrderService;
import co.kr.petopia.service.PointService;
import co.kr.petopia.service.ReplyService;
import co.kr.petopia.utils.Criteria;
import co.kr.petopia.utils.PageVO;
import co.kr.petopia.vo.MemberVO;
import co.kr.petopia.vo.OrderVO;
import co.kr.petopia.vo.PointVO;
import co.kr.petopia.vo.ProductVO;
import co.kr.petopia.vo.ReplyVO;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private PointService pointService;
    @Autowired
    private MypetService mypetService;
    @Autowired
    private ReplyService replyService;

    @Autowired
    private OrderService orderService;
    
    @GetMapping("/login")
    public String loginPage() {
        log.info("????????? ?????????-----------");
        return "member/login";
    }

    @GetMapping("/joinAgree")
    public String joinAgreePage() {
        log.info("???????????? ?????????-----------");
        return "member/joinAgree";
    }

    @GetMapping("/joinForm")
    public String joinFormPage() {
        log.info("???????????? ?????????-----------");
        return "member/joinForm";
    }

    @GetMapping("/welcome")
    public String welcomePage() {
        log.info("???????????? ?????? ?????????-----------");
        return "member/welcome";
    }

    // ????????????
    @PostMapping("/joinProcess")
    @ResponseBody
    public String signUp(MemberVO member, RedirectAttributes rttr) throws Exception {

        log.info("join -----------");

        memberService.memberRegister(member);

        rttr.addFlashAttribute("result", "success");

        log.info("join service ??????-----------");

        return "success";
    }

    // ????????? ?????? ???
    @GetMapping("/help/idInquiry")
    public String findMeberIdForm() {
        log.info("????????? ?????? ?????????-----------");
        return "member/idInquiry";
    }
    
    // ????????? ?????? ?????? ??????
    @PostMapping("/help/findid")
    public String findMemeberId(@RequestParam("member_name") String member_name, 
            @RequestParam("member_phoneNumber") String member_phoneNumber,
            @RequestParam("member_email") String member_email, Model model, HttpServletResponse response) throws Exception {
        
        String member_id = memberService.findMemberId(member_name, member_phoneNumber, member_email);
        
        if (member_id == null) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('???????????? ????????? ????????????. ?????? ??????????????????.'); history.go(-1);</script>");
            out.flush();
        } else {
            model.addAttribute("member_id", member_id);
        }
        
        return "member/findid";
    }
    
    // ???????????? ?????? ???
    @GetMapping("/help/pwInquiry")
    public String findMeberPwForm() {
        log.info("???????????? ?????? ?????????-----------");
        return "member/pwInquiry";
    }
    
    // ???????????? ?????????
    @PostMapping("/help/resetpw")
    public String changeMemberPw(@RequestParam("member_id") String member_id, 
                                 @RequestParam("member_name") String member_name,
                                 @RequestParam("member_email") String member_email,
                                 HttpServletRequest request) {
        
        HttpSession session = request.getSession();
        
        session.setAttribute("member_id", member_id);
        session.setAttribute("member_name", member_name);
        session.setAttribute("member_email", member_email);
        
        return "/member/resetpw";
    }
    
    // ???????????? ????????? ?????? ??????
    @PostMapping("/help/resetpw/success")
    public String changePwSuccess(@RequestParam("member_password") String member_password, HttpServletRequest request) {
        
        HttpSession session = request.getSession();
        
        String member_id = (String) session.getAttribute("member_id");
        String member_name = (String) session.getAttribute("member_name");
        String member_email = (String) session.getAttribute("member_email");
        
        System.out.println(member_id);
        
        MemberVO member = new MemberVO();
        
        member.setMember_id(member_id);
        member.setMember_name(member_name);
        member.setMember_email(member_email);
        member.setMember_password(member_password);
        
        memberService.resetMemberPw(member);
        
        session.invalidate();
        
        return "member/resetpwsuccess";
    }

    // joinForm -> ????????? ?????? ??????
    @GetMapping("/idCheck")
    @ResponseBody
    public int checkMemberId(@RequestParam("memberId") String member_id) {

        return memberService.checkMemberId(member_id);
    }

    // joinForm -> ????????? ?????? ?????? ??????
    @GetMapping("/pnCheck")
    @ResponseBody
    public int checkMemberPhoneNumber(@RequestParam("memberPN") String member_phoneNumber) {

        return memberService.checkMemberPhoneNumber(member_phoneNumber);
    }

    // ????????? ??????

    /*
     * ????????? ?????? ????????? json?????? ???????????? return??? ??????, ???????????????????????? ?????? ??????!
     */

    @Autowired
    JavaMailSender javaMailSender;

    @RequestMapping({ "/CheckMail", "member/CheckMail" })
    @ResponseBody
    public String SendMail(String mail) {
        Random random = new Random();
        String key = "";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mail); // ?????????????????? ?????? ????????? ?????? ????????? ????????? ??????

        // ?????? ?????? ?????? ??????
        for (int i = 0; i < 3; i++) {
            int index = random.nextInt(25) + 65; // A~Z?????? ?????? ????????? ??????
            key += (char) index;
        }

        int numIndex = random.nextInt(8999) + 1000; // 4?????? ????????? ??????

        key += numIndex;
        message.setSubject("[PETOPIA] ???????????? ????????? ?????? ?????? ??????");
        message.setText("????????? ?????? ?????? : " + key);
        javaMailSender.send(message);

        Gson gson = new Gson();

        return gson.toJson(key);
    }

    
    // ??????????????? ??????
    @GetMapping("member/mypage")
    public String mypage(Model model, Principal principal) {
        
        String member_id = principal.getName();
        
        model.addAttribute("p_update", pointService.pointUpdate(member_id));
        model.addAttribute("p_total", pointService.retentionPoint(member_id));
        
        MemberVO memberVO = memberService.getMemberInfo(member_id);
        model.addAttribute("member", memberVO);
        
        log.info("memberVO: " + memberVO);
        
//        MypetVO mypetVO = MypetService.getMypetInfo(mypet_idx);
//        model.addAttribute("mypet", mypetVO);

        return "member/mypage";
    }

    // ??????????????? ??????
    @GetMapping("member/myDonation")
    public String mypage_donation(Model model, Principal principal) {

        String member_id = principal.getName();
        
        MemberVO memberVO = memberService.getMemberInfo(member_id);
        model.addAttribute("member", memberVO);
        
        model.addAttribute("donation", pointService.donationHistory(member_id));

        return "member/myDonation";
    }
    // ????????? ????????????
    @GetMapping("member/donate")
    public String donate() {
        return "member/donate";
    }
    // ????????? ?????? ??????
    @GetMapping("member/donateSuccess")
    public String donateSuccess(Model model, Principal principal, PointVO pointVO) {
        
//        pointVO.setMember_id(principal.getName());
        
        
        
        return "member/donateSuccess";
    }
    
    
    

    // ??????????????? ?????????

    @GetMapping("member/point")
    public String mypage_point(Model model, Principal principal) {

        String member_id = principal.getName();
        MemberVO memberVO = memberService.getMemberInfo(member_id);
        PointVO pointVO = new PointVO();
        pointVO.setMember_id(member_id);
        model.addAttribute("member", memberVO);
        
        List<PointVO> pointList = pointService.pointHistory(member_id);
        log.info("???????????? : " + pointList); 
       
        model.addAttribute("point", pointList);
     
        return "member/point";
    }
    

    // ?????? ??????
    @GetMapping("member/myOrderList")
    public String orderList(Model model, Principal principal) {
        
        log.info("my order list..");
        
        String member_id = principal.getName();
        log.info("??????????????? = " + member_id);
        log.info("orderList " + orderService.readMemberOrderList(member_id));
        model.addAttribute("orderList", orderService.readMemberOrderList(member_id));
        
        return "member/myOrderList";
    }
    
    
	// ?????? ?????? ?????? ??????
	@ResponseBody
	@PostMapping(value = "/member/donation_month", consumes = "application/json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<PointVO>> selectOptionProductList(@RequestBody Map<String, Object> month,
			Criteria cri, Model model) {
		
		HashMap<String, Object> optionMap = new HashMap<String, Object>();

		String donation_date_month = (String) month.get("donation_date_month");
		String member_id = (String)month.get("member_id");
		
		
		log.info("????????? ??? : " + donation_date_month);
		log.info("????????? ?????? : " + member_id);

		optionMap.put("selected_month", donation_date_month);
		optionMap.put("member_id", donation_date_month);
		List<PointVO> pointList = pointService.getSelectOptionList(optionMap);
		
		return new ResponseEntity<>(pointList, HttpStatus.OK);
	}
    
    
    
    
    // ?????? ??????
    @GetMapping("member/grade")
    public String grade() {
        return "member/grade";
    }
    
    // ?????? ??????
    @GetMapping("member/reviewList")
    public String reviewList(Model model, Principal principal) {
        log.info("my reply list...");
        
        String member_id = principal.getName();
        model.addAttribute("replyList", memberService.getMyReplyList(member_id));
        
        return "member/myReviewList";
    }
    
    // ?????? ????????????
    @GetMapping("member/reviewRegister")
    public String reviewRegister() {
       
        return "member/reviewRegister";
    }

    // ?????? ?????? ??????
    @PostMapping("member/reviewSuccess")
    public String reviewSuccess(Model model, Principal principal, ReplyVO replyVO) {
        log.info("reply register...." + replyVO);
        replyVO.setMember_id(principal.getName());
    
        int insertCount = replyService.productReviewInsert(replyVO);

        log.info("Reply INSERT COUNT: " + insertCount);
    
        return "member/reviewSuccess";
    }
    
    
    // ??????/??????/??????
    @GetMapping("member/exchange_refund")
    public String exchange_refund(Model model, Principal principal) {
        log.info("my order list..");
        
        String member_id = principal.getName();
        log.info("orderList " + orderService.readMemberOrderList(member_id));
        model.addAttribute("orderList", orderService.readMemberOrderList(member_id));
        
        return "member/exchange_refund";
    }
    
    // ??? ?????? ??????
    @GetMapping("member/qna_my_qna")
    public String qna_main() {
        return "board/qna_my_qna";
    }
    // ????????????
    @GetMapping("member/cart")
    public String cart() {
        return "order/cart";
    }
    // ???????????????
    @GetMapping("member/wishlist")
    public String wishlist() {
        return "order/wishlist";
    }
    
    // ??????????????? ????????? ?????????
    @GetMapping("member/contentList")
    public String postList(Model model, Principal principal) {
        log.info("my content list..");
        
        String member_id = principal.getName();
        model.addAttribute("contentList", memberService.getMyContentList(member_id));
       

        return "member/myContentList";
    }
    

    // ??????????????????
    @GetMapping("member/modify")
    public String memberModify() {

        return "member/memberModify";
    }


	// ?????? ??????
	@GetMapping("member/withdrawal_agree")
	public String withdrawal_agree() {
		return "member/withdrawal_agree";
	}
	@GetMapping("member/withdrawal_success")
	public String withdrawal_success(Principal principal, HttpSession session){
	    log.info("remove ..");
	    
	    String member_id = principal.getName();
	    log.info("remove id .." + member_id);
	    memberService.memberRemove(member_id);
	    
	    session.invalidate(); // ???????????????????????? ???????????? ??????... ?????? ????????? ?????? ?????????..

	    
	    
		return "member/withdrawal_success";
	}


	
	
	/* // ?????? ??????
	 * 
	 * @GetMapping("/donation") public String donation() { return "member/donation";
	 * }
	 */

	// ????????? ??????
	@GetMapping("member/myPet1")
	public String myPet1() {
		return "member/myPet1";
	}

	// ?????????????????? ???????????? ??????
	@GetMapping("member/passwordConfirm")
	public String passwordConfirm(Principal principal, Model model) {

		model.addAttribute("memberId", principal.getName());
		return "member/passwordConfirm";
	}

	@PostMapping("member/passwordProcess")
	public String passwordConfirm(MemberVO member, RedirectAttributes rttr) throws Exception {

		log.info("passwordConfirm -----------");

		memberService.memberRegister(member);

		rttr.addFlashAttribute("result", "success");

		log.info("passwordConfirm ??????-----------");

		return "redirect:/main";
	}

	// ?????????????????? ??? ?????? ??????
	@GetMapping("member/memberModify")
	public String memberModifyForm(Principal principal, MemberVO modifyMemberVO, Model model) {

		MemberVO memberInfo = memberService.getMemberInfo(principal.getName()); // --> member_id

		log.info(memberInfo);

		model.addAttribute("memberInfo", memberInfo);

		String memberEmail = memberInfo.getMember_email();
		String[] email = memberEmail.split("@");
		String email1 = email[0];
		String email2 = email[1];

		log.info(email1 + email2);
		model.addAttribute("email1", email1);
		model.addAttribute("email2", email2);

		String memberAddress = memberInfo.getMember_address();
		String address1 = memberAddress.substring(0, 5).trim(); // ????????????
		String[] address = (memberAddress.trim().substring(6)).split("\\)"); // ????????? ??????

		String address2 = (address[0] + ")").trim();
		String address3 = address[1].trim();

		log.info(address1 + address2 + address3);
		model.addAttribute("address1", address1);
		model.addAttribute("address2", address2);
		model.addAttribute("address3", address3);

		/*
		 * String memberAdress = emberInfo.getMember_address(); String[] adress =
		 * memberAdress.split("@"); String adress1 = adress[0]; String adress2 =
		 * adress[1]; String adress3 = adress[2];
		 * 
		 * log.info(adress1+ adress2+adress3); model.addAttribute("email1", email1);
		 * model.addAttribute("adress1", adress1); model.addAttribute("adress1",
		 * adress1);
		 */

		modifyMemberVO.setMember_id(memberInfo.getMember_id());
		modifyMemberVO.setMember_name(memberInfo.getMember_name());
		modifyMemberVO.setMember_email(memberInfo.getMember_email());
		modifyMemberVO.setMember_phoneNumber(memberInfo.getMember_phoneNumber());
		modifyMemberVO.setMember_address(memberInfo.getMember_address());

		return "member/memberModify";
	}

	@PostMapping("/member/modifySuccess") // ?????? url
	public String memberModifySuccess(HttpServletRequest request, Model model, Principal principal)
	/*
	 * @RequestParam("email01") String email01, @RequestParam("email02") String
	 * email02,
	 * 
	 * @RequestParam("member_password") String
	 * member_password, @RequestParam("member_phoneNumber") String
	 * member_phoneNumber,
	 * 
	 * @RequestParam("member_address1") String
	 * member_address1, @RequestParam("member_address2") String member_address2,
	 * 
	 * @RequestParam("member_address3") String member_address3)
	 */ {

		log.info("???????????? ?????? ?????????-----------");

		String member_id = principal.getName();
		String member_email = request.getParameter("email01") + "@" + request.getParameter("email02");
		String member_password = request.getParameter("member_password");
		String member_phoneNumber = request.getParameter("member_phoneNumber");
		String member_address = request.getParameter("member_address1") + " " + request.getParameter("member_address2")
				+ " " + request.getParameter("member_address3");

		MemberVO member = new MemberVO();

		member.setMember_id(member_id);
		member.setMember_email(member_email);
		member.setMember_password(member_password);
		member.setMember_phoneNumber(member_phoneNumber);
		member.setMember_address(member_address);

		/*
		 * member.setMember_email(email01+"@"+email02);
		 * member.setMember_password(member_password);
		 * member.setMember_phoneNumber(member_phoneNumber);
		 * member.setMember_address(member_address1+" "+member_address2+" "
		 * +member_address3);
		 */

		memberService.memberModify(member);

		log.info("???????????? ?????? ??????-----------");

		return "/member/modifySuccess"; // ???(jsp)
	}

	// ??????/?????? ??????
	@GetMapping("member/exchangeRefund")
	public String exchangeRefund(Principal principal, Model model) {

		model.addAttribute("memberId", principal.getName());
		return "member/exchangeRefund";
	}
	
	// ??????/?????? ??????
	@GetMapping("member/claim")
	public String claim(Principal principal, Model model) {

		model.addAttribute("memberId", principal.getName());
		return "member/claim";
	}

	// ???????????? ??????
	@GetMapping("member/deilveryCheck")
	public String deilveryCheck(Principal principal, Model model) {

		model.addAttribute("memberId", principal.getName());
		return "member/deilveryCheck";
	}

}
