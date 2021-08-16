package co.kr.petopia.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import co.kr.petopia.service.MypetService;
import co.kr.petopia.service.PointService;
import co.kr.petopia.vo.MemberVO;
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
	// @Autowired
	// private PointService pointService;
    
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

    // 아이디 찾기 폼
    @GetMapping("/help/idInquiry")
    public String findMeberIdForm() {
        log.info("아이디 찾기 페이지-----------");
        return "member/idInquiry";
    }
    
    // 아이디 찾기 결과 화면
    @PostMapping("/help/findid")
    public String findMemeberId(@RequestParam("member_name") String member_name, 
            @RequestParam("member_phoneNumber") String member_phoneNumber,
            @RequestParam("member_email") String member_email, Model model, HttpServletResponse response) throws Exception {
        
        String member_id = memberService.findMemberId(member_name, member_phoneNumber, member_email);
        
        if (member_id == null) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('일치하는 정보가 없습니다. 다시 확인해주세요.'); history.go(-1);</script>");
            out.flush();
        } else {
            model.addAttribute("member_id", member_id);
        }
        
        return "member/findid";
    }
    
    // 비밀번호 찾기 폼
    @GetMapping("/help/pwInquiry")
    public String findMeberPwForm() {
        log.info("비밀번호 찾기 페이지-----------");
        return "member/pwInquiry";
    }
    
    // 비밀번호 재설정
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
    
    // 비밀번호 재설정 완료 화면
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

    // 마이페이지 기부
    @GetMapping("member/myDonation")
    public String mypage_donation(Model model, Principal principal) {

        String member_id = principal.getName();
        MemberVO memberVO = memberService.getMemberInfo(member_id);
        model.addAttribute("member", memberVO);
        
        model.addAttribute("d_update", pointService.donationUpdate(member_id));
        model.addAttribute("d_total", pointService.donationPoint(member_id));
        model.addAttribute("d_history", pointService.donationHistory(member_id));
        model.addAttribute("d_count", pointService.countDonation(member_id));

        return "member/myDonation";
    }

    // 마이페이지 포인트

    @GetMapping("member/point")
    public String mypage_point(Model model, Principal principal) {

        String member_id = principal.getName();
        MemberVO memberVO = memberService.getMemberInfo(member_id);
        model.addAttribute("member", memberVO);
        
        model.addAttribute("p_update", pointService.pointUpdate(member_id));
        model.addAttribute("p_total", pointService.retentionPoint(member_id));
        model.addAttribute("p_history", pointService.pointHistory(member_id));

        return "member/point";
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

    // 마이펫 등록
    @GetMapping("member/myPet1")
    public String myPet1() {
        return "member/myPet1";
    }

    // 회원정보수정 비밀번호 확인
    @GetMapping("member/passwordConfirm")
    public String passwordConfirm() {

        return "member/passwordConfirm";
    }

    // 회원정보수정
    @GetMapping("member/modify")
    public String memberModify() {

        return "member/memberModify";
    }

}
