package com.project.root.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.root.member.dto.MemberDTO;
import com.project.root.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
//	@RequestMapping("index")
//	public String index() {
//		return "index";
//	}
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/register_form")
	public String register_form() {
		return "member/register";
	}
	
	@RequestMapping("/register")
	public String register(MemberDTO member) {
		int result = ms.register(member);
		
		if(result == 1) {
			return "redirect:login";
		}
		
		return "redirect:register_form";
	}
}
