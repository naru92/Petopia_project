package co.kr.petopia.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.kr.petopia.service.AdminService;
@Controller
public class DonationController {

	@Autowired
	AdminService adminService;
	   // 기부 메인
    @GetMapping("/donation")
    public String donation(Model model, Principal principal) {
		
		  int today = adminService.getDonationTodayCount(); 
		  int month = adminService.getDonationMonthCount(); 
		  int total = adminService.getDonationTotalCount(); 
		  
		  model.addAttribute("member_id", principal.getName());
		  model.addAttribute("donation", adminService.getAllDonationSum());
		  model.addAttribute("today", today);
		  model.addAttribute("month", month);
		  model.addAttribute("total", total);
		  
		 
    	return "/board/donation";
    }
}
