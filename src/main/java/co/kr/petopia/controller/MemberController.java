package co.kr.petopia.controller;

import java.security.Principal;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import co.kr.petopia.service.MemberService;
import co.kr.petopia.vo.MemberVO;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("/login")
	public String loginPage() {
		log.info("로그인 페이지-----------");
		return "member/login";
	}

	@GetMapping("/joinAgree")
	public String joinAgreePage() {
		log.info("약관동의 페이지-----------");
		return "member/joinAgree";
	}

	@GetMapping("/joinForm")
	public String joinFormPage() {
		log.info("회원가입 페이지-----------");
		return "member/joinForm";
	}

	@GetMapping("/welcome")
	public String welcomePage() {
		log.info("회원가입 완료 페이지-----------");
		return "member/welcome";
	}

	// 회원가입
	@PostMapping("/joinProcess")
	@ResponseBody
	public String signUp(MemberVO member, RedirectAttributes rttr) throws Exception {

		log.info("join -----------");

		memberService.memberRegister(member);

		rttr.addFlashAttribute("result", "success");

		log.info("join service 완료-----------");

		return "success";
	}

	// joinForm -> 아이디 중복 체크
	@GetMapping("/idCheck")
	@ResponseBody
	public int checkMemberId(@RequestParam("memberId") String member_id) {

		return memberService.checkMemberId(member_id);
	}

	// joinForm -> 휴대폰 번호 중복 체크
	@GetMapping("/pnCheck")
	@ResponseBody
	public int checkMemberPhoneNumber(@RequestParam("memberPN") String member_phoneNumber) {

		return memberService.checkMemberPhoneNumber(member_phoneNumber);
	}

	// 이메일 인증

	/*
	 * 이메일 인증 번호를 json으로 변환하여 return해 줘야, 자바스크립트에서 인식 가능!
	 */

	@Autowired
	JavaMailSender javaMailSender;

	@RequestMapping({ "/CheckMail", "member/CheckMail" })
	@ResponseBody
	public String SendMail(String mail) {
		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mail); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소

		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}

		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성

		key += numIndex;
		message.setSubject("[PETOPIA] 인증번호 입력을 위한 메일 전송");
		message.setText("이메일 인증 번호 : " + key);
		javaMailSender.send(message);

		Gson gson = new Gson();

		return gson.toJson(key);
	}

	// 마이페이지 메인
	@GetMapping("member/mypage")
	public String mypage() {
		return "member/mypage";
	}

	// 마이페이지 기부
	@GetMapping("member/mypage_donation")
	public String mypage_donation() {
		return "member/mypage_donation";
	}

	// 회원 탈퇴
	@GetMapping("member/withdrawal_agree")
	public String withdrawal_agree() {
		return "member/withdrawal_agree";
	}

	@GetMapping("member/withdrawal")
	public String withdrawal() {
		return "member/withdrawal";
	}

	@GetMapping("member/withdrawal_success")
	public String withdrawal_success() {
		return "member/withdrawal_success";
	}

	// 기부 메인
	@GetMapping("/donation")
	public String donation() {
		return "member/donation";
	}

	// 마이펫 등록
	@GetMapping("member/myPet1")
	public String myPet1() {
		return "member/myPet1";
	}

	// 회원정보수정 비밀번호 확인
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

		log.info("passwordConfirm 완료-----------");

		return "redirect:/main";
	}

	// 회원정보수정 폼 수정 요청
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
		String address1 = memberAddress.substring(0, 5).trim(); // 우편번호
		String[] address = (memberAddress.trim().substring(6)).split("\\)"); // 도로명 주소

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

	@PostMapping("/member/modifySuccess") // 경로 url
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

		log.info("회원정보 완료 페이지-----------");

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

		log.info("회원정보 수정 완료-----------");

		return "/member/modifySuccess"; // 뷰(jsp)
	}

	// 교환/환불 조회
	@GetMapping("member/exchangeRefund")
	public String exchangeRefund(Principal principal, Model model) {

		model.addAttribute("memberId", principal.getName());
		return "member/exchangeRefund";
	}
	
	// 교환/환불 요청
	@GetMapping("member/claim")
	public String claim(Principal principal, Model model) {

		model.addAttribute("memberId", principal.getName());
		return "member/claim";
	}

	// 배송내역 조회
	@GetMapping("member/deilveryCheck")
	public String deilveryCheck(Principal principal, Model model) {

		model.addAttribute("memberId", principal.getName());
		return "member/deilveryCheck";
	}


}
