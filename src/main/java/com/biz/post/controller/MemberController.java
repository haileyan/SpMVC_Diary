package com.biz.post.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.post.model.MemberVO;
import com.biz.post.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	MemberService mService;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(Model model) {
		model.addAttribute("BODY", "JOIN");
		return "home";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST,produces="text/html;charset=utf8")
	public String join(@ModelAttribute MemberVO memberVO, Model model) {
		mService.insert(memberVO);
		return "home";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(String LOGIN_MSG, Model model) {
		model.addAttribute("LOGIN_MSG", LOGIN_MSG);
		return "member/login_form";
	}
	
	@RequestMapping(value="/login_check", method=RequestMethod.POST)
	public String login(HttpSession session, Model model,@ModelAttribute MemberVO memberVO) {
		String b_userid = memberVO.getB_userid();
		String b_password = memberVO.getB_password();
		
		MemberVO vo = mService.findById(b_userid);
		
		if(vo == null) {
			model.addAttribute("LOGIN_MSG", "NULL");
		} else {
			if(b_password.equalsIgnoreCase(vo.getB_password())) {
				memberVO = vo ;
				session.setAttribute("LOGIN_INFO", memberVO);
				model.addAttribute("LOGIN_MSG", "SUCCESS");
			} else {
				model.addAttribute("LOGIN_MSG", "FAIL");
			}
		}
		return "redirect:/login";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.setAttribute("LOGIN_INFO", null);
		return "redirect:/";
	}
	
}
