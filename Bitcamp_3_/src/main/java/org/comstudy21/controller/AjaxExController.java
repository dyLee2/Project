package org.comstudy21.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ajax") // 
public class AjaxExController {
	
	// /ajax/ex << 주소로 들어오면
	@RequestMapping("/ex") 
	public String ajaxEx() {
		// ajax_ex(패키지이름)/jsp파일이름 << 을 보여준다
		return "ajax_ex/AjaxEx";
	}
	
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public ModelAndView ajaxCheck(@RequestParam("msg") String msg, @RequestParam("user") String user) {
		//System.out.println(data);
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("title", "KIM");
		mav.addObject("value", "GOOD");
		mav.addObject("msg", msg);
		mav.addObject("user", user);
		
		mav.setViewName("ajax_ex/AjaxCheck");
		
		return mav;
	}
}
