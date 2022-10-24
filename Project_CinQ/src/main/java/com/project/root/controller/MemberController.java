package com.project.root.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.root.join.service.JoinService;
import com.project.root.member.dto.MemberDTO;
import com.project.root.member.service.MemberService;
import com.project.root.session.name.MemberSession;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSession {
	
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
	
	@PostMapping("user_check")
	public String userCheck(HttpServletRequest request, RedirectAttributes rs) {
		int result = ms.user_check(request);
		if(result == 0) {
			rs.addAttribute("id", request.getParameter("id"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, HttpSession session) {
		session.setAttribute(LOGIN, id);
		return "member/successLogin";
	} 
	
	@GetMapping("join/artistForm")
	public String rentPlace() {
		return "join/artistForm";
	}
	
	
	@Autowired
	JoinService js;
	
	
	@GetMapping("myinfo2")
	public String myinfo2(@RequestParam("id") String id, Model model) {
		js.myJoinView(id,model);
		return "member/myinfo2";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "redirect:/index"; // index 는 기본 컨트롤러에 있으기 때문에 '/' 붙여줍니다
	}
	
	
}
