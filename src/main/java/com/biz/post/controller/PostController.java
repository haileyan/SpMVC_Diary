package com.biz.post.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.post.model.MemberVO;
import com.biz.post.model.PostVO;
import com.biz.post.service.PostService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PostController {

	@Autowired
	PostService pService;

	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String view(Model model) {
		
		List<PostVO> pList = pService.selectAll();
		model.addAttribute("POSTS", pList);
		model.addAttribute("BODY", "LIST");
		return "home";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String post_detail(@RequestParam long id,@ModelAttribute PostVO postVO, Model model) {
		model.addAttribute("postVO", pService.findById(id));
		model.addAttribute("BODY", "DETAIL");
		return "home";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write_post(Model model) {
		model.addAttribute("BODY", "WRITE");
		return "home";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST, produces="text/html;charset=utf8")
	public String write_post(@ModelAttribute PostVO postVO, Model model, HttpSession session) {
		LocalDateTime ld = LocalDateTime.now();
		DateTimeFormatter fd = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		MemberVO vo = (MemberVO)session.getAttribute("LOGIN_INFO");
		
		String today = ld.format(fd);
		String auth = vo.getB_userid();
				
		postVO.setP_date(today);
		postVO.setP_auth(auth);
		pService.insert(postVO);
		
		return "redirect:/list";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update_post(@ModelAttribute PostVO postVO) {
		pService.update(postVO);
		return "home";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete_post(@RequestParam long id) {
		pService.delete(id);
		return "home";
	}
	
}

