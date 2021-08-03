package co.kr.petopia.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.petopia.vo.OrderVO;
import jdk.internal.org.jline.utils.Log;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home(HttpServletRequest request) {
//		System.out.println(request.getServletContext().getRealPath("/"));  첨부파일경로
//		System.out.println(loginUserBeanzz);
		System.out.println("파일 업로드할 경로" + request.getSession().getServletContext().getRealPath("/"));
		return "redirect:/main";
	}
	
	
}


