package co.kr.petopia;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@ControllerAdvice
public class CustomErrorController {
	
	
	@ExceptionHandler(Exception.class)
		private ModelAndView errormv(Exception e) {
			e.printStackTrace();
			log.info("에러 내용 : " + e.getMessage());
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("/error/4xx");
			modelAndView.addObject("exception" ,e);
			
			return modelAndView;
		}
	}
  
  
